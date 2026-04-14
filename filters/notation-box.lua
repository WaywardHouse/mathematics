-- Quarto / Pandoc Lua filter
--
-- Purpose:
--   If a chapter declares `notation_introduced:` in its YAML front matter,
--   insert a short, consistent "Symbols to keep handy" callout near the top
--   of the rendered chapter.
--
-- Rationale:
--   For non-core learners, the intimidation spike often comes from meeting
--   a new idea, its formal definition, and its notation all at once. This box
--   provides a quick "read aloud" map so the prose can stay conceptual.
--
-- Opt-out:
--   Set `notation_box: false` in the chapter front matter.

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

local function as_number(meta_val, default)
  if meta_val == nil then
    return default
  end
  local s = pandoc.utils.stringify(meta_val)
  local n = tonumber(s)
  if n == nil then
    return default
  end
  return n
end

local function make_notation_box(meta)
  local raw = meta.notation_introduced
  if raw == nil then
    return nil
  end
  if type(raw) ~= "table" then
    return nil
  end

  local rows = {}
  for _, item in ipairs(raw) do
    if type(item) == "table" then
      local sym = item.symbol and pandoc.utils.stringify(item.symbol) or nil
      local read = item.reads_as and pandoc.utils.stringify(item.reads_as) or nil
      local w = as_number(item.notation_weight, 0)
      if sym ~= nil and sym ~= "" and read ~= nil and read ~= "" then
        table.insert(rows, { symbol = sym, reads_as = read, weight = w })
      end
    end
  end

  if #rows == 0 then
    return nil
  end

  -- Prefer the symbols that do the most work (weight >= 2) and cap length.
  table.sort(rows, function(a, b) return a.weight > b.weight end)

  local chosen = {}
  for _, r in ipairs(rows) do
    if r.weight >= 2 then
      table.insert(chosen, r)
    end
  end

  if #chosen == 0 then
    for i = 1, math.min(6, #rows) do
      table.insert(chosen, rows[i])
    end
  else
    while #chosen > 8 do
      table.remove(chosen)
    end
  end

  local title = pandoc.Para({
    pandoc.Strong({
      pandoc.Str("Symbols"),
      pandoc.Space(),
      pandoc.Str("to"),
      pandoc.Space(),
      pandoc.Str("keep"),
      pandoc.Space(),
      pandoc.Str("handy"),
    })
  })

  local lead = pandoc.Para(split_words_to_inlines(
    "These are the pieces of notation you'll see repeatedly. Read them in words first; the math gets easier once the symbols stop feeling like a wall."
  ))

  local items = {}
  for _, r in ipairs(chosen) do
    local sym = r.symbol
    -- If authors included $...$, strip it so we don't end up with $$...$$.
    sym = sym:gsub("^%$", ""):gsub("%$$", "")

    local inlines = {
      pandoc.Math("InlineMath", sym),
      pandoc.Str(":"),
      pandoc.Space(),
    }
    for _, inline in ipairs(split_words_to_inlines(r.reads_as)) do
      table.insert(inlines, inline)
    end
    table.insert(items, { pandoc.Para(inlines) })
  end

  local list = pandoc.BulletList(items)

  return pandoc.Div(
    { title, lead, list },
    pandoc.Attr(
      "",
      { "callout-note", "callout-symbols" },
      { appearance = "simple", icon = "false" }
    )
  )
end

local function find_insertion_point(blocks)
  local first_h2 = nil
  local helps_you = nil

  for i, b in ipairs(blocks) do
    if b.t == "Header" and b.level == 2 then
      if first_h2 == nil then
        first_h2 = i
      end
      local txt = pandoc.utils.stringify(b.content):lower()
      if txt == "what this chapter helps you do" then
        helps_you = i + 1
        break
      end
    end
  end

  return helps_you or first_h2 or 1
end

function Pandoc(doc)
  local enabled = truthy(doc.meta.notation_box)
  if enabled == false then
    return doc
  end

  local box = make_notation_box(doc.meta)
  if box == nil then
    return doc
  end

  local idx = find_insertion_point(doc.blocks)
  table.insert(doc.blocks, idx, box)
  return doc
end
