local date = function() return os.date('%B %d, %Y') end
local time = function() return os.date('%T %Z') end

local snippets = {
  s({ trig = 'fm', desc = 'Expands to Markdown front-matter' }, fmt([[
  ---
  title: {}
  author: {}
  date: {}
  tags:
    - '#{}'
  ---
  ]], { i(1, 'TITLE'), i(2, 'AUTHOR'), d(3, function() return sn(nil, f(date)) end), i(4, 'TAG') })),

  s({ trig = 'link', desc = 'Create a markdown link' }, fmt([[
  [{}]({})
  ]], { i(1, 'TEXT'), i(2, 'LINK') })),

  s({ trig = 'cb', desc = 'Expands to Markdown code block' }, fmt([[
  ```{}
  {}
  ```
  ]], { i(1, 'SYNTAX'), i(2, 'CODE') })),

  s({ trig = 'le', desc = 'Add a log entry for my logbook workflow' }, fmt([[
  #### {}

  {}
  ]], { d(1, function() return sn(nil, f(time)) end), i(2, 'LOG_ENTRY') })),
}

return snippets
