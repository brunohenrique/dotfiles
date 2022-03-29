local snippets = {
  s({ trig = 'd', desc = 'Expands to my debug statement' }, fmt([[
  println("================")
  fmt.Printf("%+v", {})
  println("================")
  ]], { i(1, "DEBUG") })),

  s({ trig = 'fmtp', desc = 'fmt.Printf' }, fmt([[
  fmt.Printf("%+v", {})
  ]], { c(1, { i(1, "DEBUG"), i(1, "ANOTHER OPTION") }) })),

  s({ trig = 'fmts', desc = 'fmt.Sprintf' }, fmt([[
  fmt.Sprintf("{}", {})
  ]], { i(1, "FORMAT"), i(2, "VALUES") })),
}

return snippets
