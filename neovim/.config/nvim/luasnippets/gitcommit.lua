local snippets = {
  s({ trig = 'msg', desc = 'Expands to the "conventional commits" style' }, fmt([[
  {}{} {}

  {}
  ]], {
    c(1, {
      i(nil, 'build'),
      i(nil, 'chore'),
      i(nil, 'ci'),
      i(nil, 'docs'),
      i(nil, 'feat'),
      i(nil, 'fix'),
      i(nil, 'perf'),
      i(nil, 'refactor'),
      i(nil, 'revert'),
      i(nil, 'style'),
      i(nil, 'test'),
    }),
    c(2, { fmt([[({}):]], { i(1, 'SCOPE') }), i(nil, ':') }),
    i(3, 'DESC'),
    c(4, { i(nil, 'BODY'), i(nil) }),
  })),

  s({ trig = 'ca', desc = 'Expands to the GitHub co-author' }, fmt([[
  Co-authored-by: {} <{}>
  ]], { i(1, 'NAME'), i(2, 'EMAIL') })),
}

return snippets

