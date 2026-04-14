-- Quarto / Pandoc Lua filter
--
-- Purpose:
--   If a chapter declares `definitions_introduced:` in its YAML front matter,
--   insert a short, consistent "Definitions to keep handy" callout near the top.
--
-- Opt-out:
--   Set `definitions_box: false` in the chapter front matter.

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

local function split_words_to_inlines(s)
  local inlines = {}
  if s == nil then
    return inlines
  end
  for w in tostring(s):gmatch("%S+") do
    table.insert(inlines, pandoc.Str(w))
    table.insert(inlines, pandoc.Space())
  end
  if #inlines > 0 then
    table.remove(inlines, #inlines)
  end
  return inlines
end

local function make_definitions_box(meta)
  local raw = meta.definitions_introduced
  if raw == nil or type(raw) ~= "table" then
    return nil
  end

  local rows = {}
  for _, item in ipairs(raw) do
    if type(item) == "table" then
      local term = item.term and pandoc.utils.stringify(item.term) or nil
      local means = item.means and pandoc.utils.stringify(item.means) or nil
      if term ~= nil and term ~= "" and means ~= nil and means ~= "" then
        table.insert(rows, { term = term, means = means })
      end
    end
  end

  if #rows == 0 then
    return nil
  end

  -- Keep it scannable: cap length.
  while #rows > 8 do
    table.remove(rows)
  end

  local title = pandoc.Para({
    pandoc.Strong({
      pandoc.Str("Definitions"),
      pandoc.Space(),
      pandoc.Str("to"),
      pandoc.Space(),
      pandoc.Str("keep"),
      pandoc.Space(),
      pandoc.Str("handy"),
    })
  })

  local lead = pandoc.Para(split_words_to_inlines(
    "These are the terms the chapter is building around. Treat them as ordinary language first; the formal versions will come with a reason to care."
  ))

  local items = {}
  for _, r in ipairs(rows) do
    local inlines = {
      pandoc.Strong(split_words_to_inlines(r.term)),
      pandoc.Str(":"),
      pandoc.Space(),
    }
    for _, inline in ipairs(split_words_to_inlines(r.means)) do
      table.insert(inlines, inline)
    end
    table.insert(items, { pandoc.Para(inlines) })
  end

  local list = pandoc.BulletList(items)

  return pandoc.Div(
    { title, lead, list },
    pandoc.Attr(
      "",
      { "callout-note", "callout-definitions" },
      { appearance = "simple", icon = "false" }
    )
  )
end

local function find_insertion_point(blocks)
  for i, b in ipairs(blocks) do
    if b.t == "Header" and b.level == 2 then
      local txt = pandoc.utils.stringify(b.content):lower()
      if txt == "what this chapter helps you do" then
        return i + 1
      end
    end
  end
  -- Fall back to after first h2 (or very top).
  for i, b in ipairs(blocks) do
    if b.t == "Header" and b.level == 2 then
      return i
    end
  end
  return 1
end

function Pandoc(doc)
  local enabled = truthy(doc.meta.definitions_box)
  if enabled == false then
    return doc
  end

  local box = make_definitions_box(doc.meta)
  if box == nil then
    return doc
  end

  local idx = find_insertion_point(doc.blocks)
  table.insert(doc.blocks, idx, box)
  return doc
end

