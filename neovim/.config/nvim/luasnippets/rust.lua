local snippets = {
  s({ trig = 'd', desc = 'Debug' }, fmt([[
  println!("================");
  dbg!({});
  println!("================");
  ]], { i(1, "DEBUG") })),

  s({ trig = 'test', desc = 'Creates Test Boilerplate' }, fmt([[
  #[test]
  fn {}() {{
    {}
  }}
  ]], { i(1, "test_name"), i(2, "...code...") })),

  s({ trig = 'fn', desc = 'Creates Function' }, fmt([[
  fn {}({}) {{
    {}
  }}
  ]], { i(1, "function_name"), i(2, "arg: type"), i(3, "...code...") })),

  s({ trig = 'pfn', desc = 'Creates Public Funtion' }, fmt([[
  pub fn {}({}) {{
    {}
  }}
  ]], { i(1, "function_name"), i(2, "arg: type"), i(3, "...code...") })),

  s({ trig = 'impl', desc = 'Creates Impl Block' }, fmt([[
  impl {} {{
    {}
  }}
  ]], {
      c(1, {
        i(nil, "StructName"),
        i(nil, "StructName<T>"),
      }),
      i(3, "...code..."),
  })),

  s({ trig = 'implt', desc = 'Creates Impl Trait Block' }, fmt([[
  impl {} for {} {{
    {}
  }}
  ]], {
      c(1, {
        i(nil, "Trait"),
        i(nil, "<T>Trait"),
      }),
      c(2,
        { i(nil, "StructName"),
          i(nil, "StructName<T>"),
      }),
      i(3, "...code..."),
  })),
}

return snippets
