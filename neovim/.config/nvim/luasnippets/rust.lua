local snippets = {
  s({ trig = 'd', desc = 'Expands to my debug statement' }, fmt([[
  println!("================")
  dbg!({})
  println!("================")
  ]], { i(1, "DEBUG") })),
}

return snippets
