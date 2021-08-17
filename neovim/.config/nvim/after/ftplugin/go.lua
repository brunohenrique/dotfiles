vim.cmd([[
  iabbrev <buffer> debug@ println("============")<ESC>ofmt.Printf("%+v\n",DEBUG)<ESC>oprintln("============")<ESC>kFDdwi
]])
