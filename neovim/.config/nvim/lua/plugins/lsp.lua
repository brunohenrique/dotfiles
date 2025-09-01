local on_attach = function(client, bufnr)
  -- FIX: Enable semanticTokensProvider only for supported servers
  if not client.server_capabilities.semanticTokensProvider then
    client.server_capabilities.semanticTokensProvider = nil
  end

  -- if client.server_capabilities.inlayHintProvider then
  if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
    vim.lsp.inlay_hint.enable(true)
  end
  -- end
  -- require("navigator.lspclient.mapping").setup({ client = client, bufnr = bufnr }) -- setup navigator keymaps here,
  -- require("navigator.dochighlight").documentHighlight(bufnr)
  -- require("navigator.codeAction").code_action_prompt(bufnr)
  -- Use LSP as the handler for omnifunc.
  --    See `:help omnifunc` and `:help ins-completion` for more information.
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

local function lsp_names(servers)
  local names = {}
  for _, server in pairs(servers) do
    names[#names + 1] = server.name
  end
  return names
end

return {
  {
    "neovim/nvim-lspconfig",
    -- keys = {
    --   {
    --     "<C-K>",
    --     "<CMD>lua vim.lsp.buf.signature_help()<CR>",
    --     desc = "Signature Help",
    --     remap = false,
    --   },
    --   {
    --     "<space>D",
    --     "<CMD>lua vim.lsp.buf.type_definition()<CR>",
    --     desc = "Type Definition",
    --     remap = false,
    --   },
    --   {
    --     "<space>K",
    --     "<CMD>lua vim.lsp.buf.hover()<CR>",
    --     desc = "Hover Information",
    --     remap = false,
    --   },
    --   -- {
    --   --   "<space>ca",
    --   --   "<CMD>lua vim.lsp.buf.code_action()<CR>",
    --   --   desc = "Code Action",
    --   --   remap = false,
    --   -- },
    --   -- { "<space>f",  "<CMD>lua vim.lsp.buf.format({async = true})<CR>",                             desc = "Code Formating",          remap = false },
    --   {
    --     "<space>ih",
    --     "<CMD>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>",
    --     desc = "Toggle Inlay Hints",
    --     remap = false,
    --   },
    --   {
    --     "<space>q",
    --     "<CMD>lua vim.lsp.diagnostic.setloclist()<CR>",
    --     desc = "Set Loclist",
    --     remap = false,
    --   },
    --   -- {
    --   --   "<space>rn",
    --   --   "<CMD>lua vim.lsp.buf.rename()<CR>",
    --   --   desc = "Rename",
    --   --   remap = false,
    --   -- },
    --   {
    --     "<space>wa",
    --     "<CMD>lua vim.lsp.buf.add_workspace_folder()<CR>",
    --     desc = "Add Workspace Folder",
    --     remap = false,
    --   },
    --   {
    --     "<space>wr",
    --     "<CMD>lua vim.lsp.buf.remove_workspace_folder()<CR>",
    --     desc = "Remove Workspace Folder",
    --     remap = false,
    --   },
    --   {
    --     "gD",
    --     "<CMD>lua vim.lsp.buf.declaration()<CR>",
    --     desc = "Go to Declaration",
    --     remap = false,
    --   },
    --   {
    --     "gd",
    --     "<CMD>lua vim.lsp.buf.definition()<CR>",
    --     desc = "Go to Definition",
    --     remap = false,
    --   },
    --   {
    --     "gi",
    --     "<CMD>lua vim.lsp.buf.implementation()<CR>",
    --     desc = "Go to Implementation",
    --     remap = false,
    --   },
    --   {
    --     "gr",
    --     "<CMD>lua vim.lsp.buf.references()<CR>",
    --     desc = "References",
    --     remap = false,
    --   },
    -- },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local util = require("lspconfig.util")
      local servers = {
        { name = "clangd",      opts = { on_attach = on_attach } },
        { name = "dotls",       opts = { on_attach = on_attach } },
        { name = "efm",         opts = { on_attach = on_attach } },
        { name = "taplo",       opts = { on_attach = on_attach } },
        { name = "terraformls", opts = { on_attach = on_attach } },
        { name = "texlab",      opts = { on_attach = on_attach } },
        { name = "tflint",      opts = { on_attach = on_attach } },
        { name = "zls",         opts = { on_attach = on_attach } },
        { name = "marksman",    opts = { on_attach = on_attach } },
        {
          name = "tinymist",
          opts = {
            on_attach = on_attach,
            settings = {
              formatterMode = "typstyle",
              exportPdf = "onType",
              semanticTokens = "disable",
            },
          },
        },
        {
          name = "lua_ls",
          opts = {
            on_attach = on_attach,
            on_init = function(client)
              if client.workspace_folders then
                local path = client.workspace_folders[1].name
                if vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc") then
                  return
                end
              end

              client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
                runtime = {
                  -- Tell the language server which version of Lua you're using
                  -- (most likely LuaJIT in the case of Neovim)
                  version = "LuaJIT",
                },
                -- Make the server aware of Neovim runtime files
                workspace = {
                  checkThirdParty = false,
                  library = {
                    vim.env.VIMRUNTIME,
                    -- Depending on the usage, you might want to add additional paths here.
                    -- "${3rd}/luv/library"
                    -- "${3rd}/busted/library",
                  },
                  -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
                  -- library = vim.api.nvim_get_runtime_file("", true)
                },
              })
            end,
            single_file_support = true,
            settings = {
              Lua = {
                hint = {
                  enable = true,
                },
                diagnostics = { globals = { "vim" } },
              },
            },
          },
        },
        {
          name = "gopls",
          opts = {
            on_attach = on_attach,
            single_file_support = true,
            settings = {
              gopls = {
                analyses = { unusedparams = true, shadow = true },
                completeUnimported = true,
                experimentalPostfixCompletions = true,
                gofumpt = true,
                staticcheck = true,
                hints = {
                  assignVariableTypes = true,
                  compositeLiteralFields = true,
                  compositeLiteralTypes = true,
                  constantValues = true,
                  functionTypeParameters = true,
                  parameterNames = true,
                  rangeVariableTypes = true,
                },
                codelenses = {
                  gcDetails = true,
                  generate = true,
                  regenerateCgo = true,
                  runGovulncheck = true,
                  tidy = true,
                  upgradeDependency = true,
                  vendor = true,
                },
              },
            },
          },
        },
        {
          name = "pylsp",
          opts = {
            on_attach = on_attach,
            pylsp = {
              plugins = {
                pycodestyle = {
                  maxLineLength = 100,
                },
                rope_completion = {
                  enabled = true,
                },
                jedi_completion = {
                  enabled = true,
                },
              },
            },
          },
        },
        {
          name = "marksman",
          opts = {
            filetypes = { "markdown", "quarto" },
          },
          root_dir = util.root_pattern(".git", ".marksman.toml", "_quarto.yml"),
        },
        {
          name = "rust_analyzer",
          opts = {
            on_attach = on_attach,
            settings = {
              ["rust-analyzer"] = {
                assist = { importGranularity = "module", importPrefix = "by_self" },
                cargo = { loadOutDirsFromCheck = true },
                checkOnSave = { command = "clippy" },
                completion = { autoimport = { enable = true } },
                procMacro = { enable = true },
              },
            },
          },
        },
        {
          name = "r_language_server",
          on_attach = on_attach,
          opts = {
            settings = {
              r = {
                lsp = {
                  rich_documentation = false,
                },
              },
            },
          },
        },
        {
          name = "yamlls",
          opts = {
            on_attach = on_attach,
            settings = {
              yaml = {
                schemaStore = {
                  enable = true,
                  url = "",
                },
                schemas = {
                  kubernetes = "**/templates/*.yaml",
                },
              },
            },
          },
        },
      }
      require("mason").setup()

      local lspconfig = require("lspconfig")
      lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
        inlay_hints = {
          enabled = true,
        },
        codelens = {
          enabled = true,
        },
        document_highlight = {
          enabled = true,
        },
        capabilities = {
          workspace = {
            fileOperations = {
              didRename = true,
              willRename = true,
            },
          },
        },
      })

      require("mason-lspconfig").setup({
        ensure_installed = lsp_names(servers),
      })
      -- After setting up mason-lspconfig you may set up servers via lspconfig
      -- require("lspconfig").lua_ls.setup {}
      -- require("lspconfig").rust_analyzer.setup {}
      -- ...
      for i, server in ipairs(servers) do
        require("lspconfig")[server.name].setup(server.opts)
      end
    end,
  },
}
