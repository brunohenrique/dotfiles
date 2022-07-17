local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
  execute 'packadd packer.nvim'
end

-- local group = augroup('packer_user_config', { clear = true })
-- autocmd('BufWritePost', { pattern = 'plugins.lua ', command = 'source <afile> | PackerCompile', group = group })
local group = augroup('packer_user_config', { clear = true })
autocmd('BufWritePost', { group = group, pattern = 'plugins.lua', command = 'source <afile> | PackerCompile' })

-- Enables the use of plugins when the commitment to it is uncertain. It helps
-- to avoid changes to the "lua/plugins.lua" file, decreasing the churn rate
-- related to adding or removing plugins.
--
-- It looks for the file "lua/trial/plugins.lua", if it exists, it loads it and
-- calls the .plugins() function on the module.
function trial(use)
  if fn.filereadable(fn.expand('~/.config/nvim/lua/trial/plugins.lua')) == 1 then
    -- The .plugins() function must return a lua table in the format:
    -- {
    --    key = {
    --      'myusername/example',        -- The plugin location string
    --      -- The following keys are all optional
    --      disable = boolean,           -- Mark a plugin as inactive
    --      as = string,                 -- Specifies an alias under which to install the plugin
    --      installer = function,        -- Specifies custom installer. See |packer-custom-installers|
    --      updater = function,          -- Specifies custom updater. See |packer-custom-installers|
    --      after = string or list,      -- Specifies plugins to load before this plugin.
    --      rtp = string,                -- Specifies a subdirectory of the plugin to add to runtimepath.
    --      opt = boolean,               -- Manually marks a plugin as optional.
    --      branch = string,             -- Specifies a git branch to use
    --      tag = string,                -- Specifies a git tag to use
    --      commit = string,             -- Specifies a git commit to use
    --      lock = boolean,              -- Skip updating this plugin in updates/syncs. Still cleans.
    --      run = string, function, or table  -- Post-update/install hook. See |packer-plugin-hooks|
    --      requires = string or list    -- Specifies plugin dependencies. See |packer-plugin-dependencies|
    --      config = string or function, -- Specifies code to run after this plugin is loaded.
    --      rocks = string or list,      -- Specifies Luarocks dependencies for the plugin
    --      -- The following keys all imply lazy-loading
    --      cmd = string or list,        -- Specifies commands which load this plugin.  Can be an autocmd pattern.
    --      ft = string or list,         -- Specifies filetypes which load this plugin.
    --      keys = string or list,       -- Specifies maps which load this plugin. See |packer-plugin-keybindings|
    --      event = string or list,      -- Specifies autocommand events which load this plugin.
    --      fn = string or list          -- Specifies functions which load this plugin.
    --      cond = string, function, or list of strings/functions,   -- Specifies a conditional test to load this plugin
    --      setup = string or function,  -- Specifies code to run before this plugin is loaded.
    --      module = string or list      -- Specifies Lua module names for require. When requiring a string which starts
    --                                   -- with one of these module names, the plugin will be loaded.
    --      module_pattern = string/list -- Specifies Lua pattern of Lua module names for require. When requiring a string
    --                                   -- which matches one of these patterns, the plugin will be loaded.
    --    },
    -- }
    -- Use ":help packer.use" to see the whole documentation.
    plugins = require('trial.plugins').plugins()
    for key, value in pairs(plugins) do
      use(value)
    end
  end
end

return require('packer').startup({
  function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- ###############################################################################
    -- ###                              STYLING                                    ###
    -- ###############################################################################

    use { 'stevearc/dressing.nvim' }
    use { 'norcalli/nvim-colorizer.lua', config = function() require'colorizer'.setup {} end }

    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
      event = 'BufWinEnter',
      config = function()
        require('lualine').setup {
          options = { theme = 'nord' },
          sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch', 'diff' },
            lualine_c = {
              {
                'filename',
                path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
              },
            },
            lualine_x = {
              { 'diagnostics', symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' } },
              'encoding',
              'fileformat',
              'filetype',
            },
            lualine_y = { 'progress' },
            lualine_z = { 'location' },
          },
          tabline = {
            lualine_a = { { 'buffers' } },
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = { 'tabs' },
          },
        }
      end,
    }

    use {
      'andersevenrud/nordic.nvim',
      config = function()
        vim.cmd([[colorscheme nordic]])
        -- The table used in this example contains the default settings.
        -- Modify or remove these to your liking (this also applies to alternatives below):
        require('nordic').colorscheme({
          -- Underline style used for spelling
          -- Options: 'none', 'underline', 'undercurl'
          underline_option = 'underline',

          -- Italics for certain keywords such as constructors, functions,
          -- labels and namespaces
          italic = false,

          -- Italic styled comments
          italic_comments = true,

          -- Minimal mode: different choice of colors for Tabs and StatusLine
          minimal_mode = true,

          -- Darker backgrounds for certain sidebars, popups, etc.
          -- Options: true, false, or a table of explicit names
          -- Supported: terminal, qf, vista_kind, packer, nvim-tree, telescope, whichkey
          alternate_backgrounds = false,

          -- Callback function to define custom color groups
          -- See 'lua/nordic/colors/example.lua' for example defitions
          custom_colors = function(c, s, cs)
            return {
              { 'TelescopePromptBorder', c.blue },
              { 'TelescopeResultsBorder', c.blue },
              { 'TelescopePreviewBorder', c.blue },
              { { 'TSInclude', 'TSLabel' }, c.purple },
              { { 'TSType', 'TSVariable', 'Special' }, c.blue },
              { { 'TSKeyword', 'TSField' }, c.intense_blue },
              { { 'TSString', 'TSStringSpecial', 'String' }, c.cyan },
              { { 'TSFuncMacro' }, c.bright_cyan },
            }
          end,
        })
      end,
    }

    -- ###############################################################################
    -- ###                              LANGUAGES                                  ###
    -- ###############################################################################

    use { 'Julian/lean.nvim' }
    use { 'lervag/vimtex', ft = { 'tex' }, config = function() vim.g.tex_flavor = 'latex' end }

    use {
      'nvim-treesitter/nvim-treesitter',
      requires = 'nvim-treesitter/playground',
      run = ':TSUpdate',
      config = function()
        require('nvim-treesitter.configs').setup {
          ensure_installed = 'all', -- one of "all", "maintained" (parsers with maintainers), or a list of languages
          ignore_install = {}, -- List of parsers to ignore installing
          highlight = {
            enable = true, -- false will disable the whole extension
            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
            -- Using this option may slow down your editor, and you may see some duplicate highlights.
            -- Instead of true it can also be a list of languages
            additional_vim_regex_highlighting = false,
          },
        }
      end,
    }

    use {
      'fatih/vim-go',
      ft = { 'go' },
      config = function()
        -- These options are disabled to favor the nvim-lspconfig setup:
        -- GoToDefinition -> lua vim.lsp.buf.definition()
        vim.g.go_def_mapping_enabled = false
        -- GoDoc -> lua vim.lsp.buf.hover()
        vim.g.go_doc_keywordprg_enabled = false
        vim.g.go_gopls_enabled = false
        vim.g.go_fmt_fail_silently = true
      end,
    }

    -- ###############################################################################
    -- ###                              ERGONOMICS                                 ###
    -- ###############################################################################

    use { 'dyng/ctrlsf.vim', event = 'BufWinEnter' }
    use { 'editorconfig/editorconfig-vim', event = 'BufWinEnter' }
    use { 'mattn/gist-vim', cmd = 'Gist', requires = { 'mattn/webapi-vim', opt = true } }
    use { 'numToStr/Comment.nvim', event = 'BufWinEnter', config = function() require('Comment').setup {} end }
    use { 'pechorin/any-jump.vim', cmd = 'AnyJump' }
    use { 'pwntester/octo.nvim', cmd = 'Octo', config = function() require'octo'.setup {} end }
    use { 'rhysd/git-messenger.vim', cmd = 'GitMessager' }
    use { 'simrat39/symbols-outline.nvim' }

    use { 'L3MON4D3/LuaSnip', config = function() require("luasnip.loaders.from_lua").load({}) end }

    use {
      'folke/which-key.nvim',
      config = function()
        require('which-key').setup { plugins = { spelling = { enabled = true, suggestions = 20 } } }
        require('user.keymaps').setup()
      end,
    }

    use {
      'rmagatti/goto-preview',
      event = 'BufWinEnter',
      config = function() require('goto-preview').setup { default_mappings = true } end,
    }

    use {
      'folke/todo-comments.nvim',
      event = 'BufWinEnter',
      requires = 'nvim-lua/plenary.nvim',
      config = function() require('todo-comments').setup {} end,
    }

    use {
      'lewis6991/gitsigns.nvim',
      event = 'BufWinEnter',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('gitsigns').setup {
          current_line_blame = true,
          current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
            delay = 1000,
          },
          current_line_blame_formatter_opts = { relative_time = false },
        }
      end,
    }

    use {
      'nvim-telescope/telescope.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('telescope').setup {
          defaults = {
            sorting_strategy = 'ascending',
            layout_config = { prompt_position = 'top' },
            set_env = { ['COLORTERM'] = 'truecolor' },
            color_devicons = false,
            file_ignore_patterns = { 'vendor', 'node_modules' },
          },
        }
      end,
    }

    use {
      'neovim/nvim-lspconfig',
      config = function()
        local settings = require('user.lsp_settings')
        local on_attach = function(client, bufnr)
          settings.setup()

          -- Use LSP as the handler for omnifunc.
          --    See `:help omnifunc` and `:help ins-completion` for more information.
          vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
        end

        local lspconfig = require('lspconfig')
        local servers = { 'efm', 'gopls', 'rust_analyzer', 'pyright', 'terraformls', 'tflint', 'clangd', 'texlab' }
        for _, lsp in ipairs(servers) do
          lspconfig[lsp].setup {
            on_attach = on_attach,
            flags = { debounce_text_changes = 500, exit_timeout = 0 },
            single_file_support = true,
            settings = settings.languages,
          }
        end
      end,
    }

    trial(use)

    if packer_bootstrap then
      require('packer').sync()
    end
  end,
  config = { display = { open_fn = require('packer.util').float } },
})
