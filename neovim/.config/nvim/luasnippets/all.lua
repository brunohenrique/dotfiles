local date = function()
  return { os.date("%B %d, %Y") }
end
local time = function()
  return { os.date("%X") }
end
local pwd = function()
  return { os.getenv("PWD") }
end

local snippets = {
  s({ trig = "date", desc = 'Display current date in "M D, YYYY" format' }, { i(1), f(date, { 1 }) }),
  s({ trig = "time", desc = 'Display current time in "h:m:s" format' }, { i(1), f(time, { 1 }) }),
  s({ trig = "pwd", desc = "Display current path" }, { i(1), f(pwd, { 1 }) }),
}

return snippets
