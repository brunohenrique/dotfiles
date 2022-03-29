local snippets = {
  s({ trig = 'mod', desc = 'Expands to the Terraform module boilerplate' }, fmt([[
  module "{}" {{
    source = "git::git@github.com:{}/{}?ref={}"

    {}
  }}
  ]], { i(1, 'NAME'), i(2, 'ORG'), c(3, { t("TEST1"), t("TEST2") }), i(4, 'VERSION'), i(5, 'BODY') })),
}

return snippets
