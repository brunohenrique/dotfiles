local snippets = {
  s({ trig = 'd', desc = 'Expands to my debug statement' }, fmt([[
  println("================")
  fmt.Printf("%+v\n", {})
  println("================")
  ]], { i(1, "DEBUG") })),

  s({ trig = 'fmtp', desc = 'fmt.Printf' }, fmt([[
  fmt.Printf("%+v\n", {})
  ]], { c(1, { i(1, "DEBUG"), i(1, "ANOTHER OPTION") }) })),

  s({ trig = 'fmts', desc = 'fmt.Sprintf' }, fmt([[
  fmt.Sprintf("{}", {})
  ]], { i(1, "FORMAT"), i(2, "VALUES") })),

  s({ trig = 'test', desc = 'Creates the test boilerplate' }, fmt([[
  func Test{}() {{
    {}
  }}
  ]], { i(1, "TestName"), i(2, "TEST_BODY") })),
}

return snippets
