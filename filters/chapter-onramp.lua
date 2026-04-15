-- Quarto / Pandoc Lua filter
--
-- Purpose:
--   Insert a short "What this chapter helps you do" section near the top of
--   each chapter, *only if the chapter doesn't already include it*.
--
-- Source of truth:
--   Uses the chapter's front matter `axiom` and `rewrite` fields, which are
--   already maintained as the authorial "coming in / leaving with" contract.
--
-- Opt-out:
--   Set `chapter_onramp: false` in the chapter front matter.

local function truthy(meta_val)
  if meta_val == nil then
    return nil
  end
  local s = pandoc.utils.stringify(meta_val):lower()
  if s == "false" or s == "no" or s == "0" then
    return false
  end
  if s == "true" or s == "yes" or s == "1" then
    return true
  end
  return nil
end

local function collapse_ws(s)
  if s == nil then
    return ""
  end
  return tostring(s):gsub("%s+", " "):gsub("^%s+", ""):gsub("%s+$", "")
end

local function text_to_inlines(s)
  local inlines = {}
  local t = collapse_ws(s)
  if t == "" then
    return inlines
  end
  for w in t:gmatch("%S+") do
    table.insert(inlines, pandoc.Str(w))
    table.insert(inlines, pandoc.Space())
  end
  table.remove(inlines, #inlines)
  return inlines
end

local function has_onramp(blocks)
  for _, b in ipairs(blocks) do
    if b.t == "Header" and b.level == 2 then
      local txt = pandoc.utils.stringify(b.content):lower()
      if txt == "what this chapter helps you do" then
        return true
      end
    end
  end
  return false
end

local function insertion_index(blocks)
  for i, b in ipairs(blocks) do
    if b.t == "Header" and b.level == 2 then
      return i
    end
  end
  return 1
end

local function make_onramp(meta)
  local axiom = collapse_ws(pandoc.utils.stringify(meta.axiom or ""))
  local rewrite = collapse_ws(pandoc.utils.stringify(meta.rewrite or ""))
  if axiom == "" or rewrite == "" then
    return nil
  end

  local header = pandoc.Header(2, "What this chapter helps you do")

  local lead = pandoc.Para(text_to_inlines(
    "Here is the main move this chapter is making, in plain terms. You do not need to be fast. You just need to keep the thread."
  ))

  local coming = {
    pandoc.Strong({ pandoc.Str("Coming"), pandoc.Space(), pandoc.Str("in:") }),
    pandoc.Space(),
  }
  for _, inline in ipairs(text_to_inlines(axiom)) do
    table.insert(coming, inline)
  end

  local leaving = {
    pandoc.Strong({ pandoc.Str("Leaving"), pandoc.Space(), pandoc.Str("with:") }),
    pandoc.Space(),
  }
  for _, inline in ipairs(text_to_inlines(rewrite)) do
    table.insert(leaving, inline)
  end

  local bullets = pandoc.BulletList({
    { pandoc.Para(coming) },
    { pandoc.Para(leaving) },
  })

  return { header, lead, bullets }
end

function Pandoc(doc)
  local enabled = truthy(doc.meta.chapter_onramp)
  if enabled == false then
    return doc
  end

  if has_onramp(doc.blocks) then
    return doc
  end

  local blocks = make_onramp(doc.meta)
  if blocks == nil then
    return doc
  end

  local idx = insertion_index(doc.blocks)
  for i = #blocks, 1, -1 do
    table.insert(doc.blocks, idx, blocks[i])
  end
  return doc
end
