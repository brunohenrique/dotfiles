function nmap(...) vim.api.nvim_set_keymap('n', ...) end

local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
  execute 'packadd packer.nvim'
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

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
    --      'plugin/repo',
    --      function()
    --        plugin config here
    --      end,
    --   },
    -- }
    plugins = require('trial.plugins').plugins()
    for key, value in pairs(plugins) do
      use { value[1], config = value[2] }
    end
  end
end

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- ###############################################################################
  -- ###                              STYLING                                    ###
  -- ###############################################################################

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup {
        options = { theme = 'nord' },
        sections = {
          lualine_a = { 'mode' },
          lualine_c = {
            {
              'filename',
              path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
            },
          },
        },
        tabline = {
          lualine_a = { 'buffers' },
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
      -- The table used in this example contains the default settings.
      -- Modify or remove these to your liking (this also applies to alternatives below):
      require('nordic').colorscheme({
        -- Underline style used for spelling
        -- Options: 'none', 'underline', 'undercurl'
        underline_option = 'underline',

        -- Italics for certain keywords such as constructors, functions,
        -- labels and namespaces
        italic = true,

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
            { { 'TSType', 'TSVariable' }, c.blue },
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

  use { 'lervag/vimtex', ft = { 'tex' }, config = function() vim.g.tex_flavor = 'latex' end }

  use {
    'nvim-treesitter/nvim-treesitter',
    requires = 'nvim-treesitter/playground',
    run = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = 'maintained', -- one of "all", "maintained" (parsers with maintainers), or a list of languages
        ignore_install = { 'javascript' }, -- List of parsers to ignore installing
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

  use 'editorconfig/editorconfig-vim'
  use 'rhysd/git-messenger.vim'
  use 'pechorin/any-jump.vim'
  use { 'mattn/gist-vim', requires = { 'mattn/webapi-vim' } }
  use { 'numToStr/Comment.nvim', config = function() require('Comment').setup {} end }
  use { 'pwntester/octo.nvim', config = function() require'octo'.setup {} end }
  use { 'folke/which-key.nvim', config = function() require('which-key').setup {} end }
  use { 'dyng/ctrlsf.vim', config = function() nmap('<C-s>f', ':CtrlSF<SPACE>', { noremap = true }) end }
  use { 'rmagatti/goto-preview', config = function() require('goto-preview').setup { default_mappings = true } end }

  use {
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function() require('todo-comments').setup {} end,
  }

  use {
    'liuchengxu/vista.vim',
    config = function()
      vim.g.vista_ctags_executable = 'ctags'
      vim.g.vista_default_executive = 'nvim_lsp'
      vim.g['vista#executives'] = { 'nvim_lsp', 'ctags' }

      nmap('<Leader>v', ':Vista!!<CR>', { noremap = true })
    end,
  }

  use {
    'lewis6991/gitsigns.nvim',
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
    requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } },
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

      -- Mappings.
      local opts = { noremap = true, silent = true }
      nmap('<Leader>ff', '<CMD>lua require("telescope.builtin").find_files({ hidden = true })<CR>', opts)
      nmap('<Leader>fd', '<CMD>lua require("garu.telescope").dotfiles()<CR>', opts)
      nmap('<Leader>fg', '<CMD>lua require("telescope.builtin").live_grep()<CR>', opts)
      nmap('<Leader>fb', '<CMD>lua require("telescope.builtin").buffers()<CR>', opts)
      nmap('<Leader>fn', '<CMD>lua require("telescope.builtin").help_tags()<CR>', opts)
    end,
  }

  use {
    'neovim/nvim-lspconfig',
    config = function()
      local on_attach = function(client, bufnr)
        require("aerial").on_attach(client, bufnr)
        vim.lsp.handlers["textDocument/publishDiagnostics"] =
          vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = { prefix = "●" } })

        -- Mappings.
        local opts = { noremap = true, silent = true }

        -- See `:help vim.lsp.*` for documentation on any of the below functions
        nmap('gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        nmap('gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
        nmap('K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
        nmap('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        nmap('<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        nmap('<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
        nmap('<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
        nmap('<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
        nmap('<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
        nmap('<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        nmap('<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
        nmap('gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        nmap('<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
        nmap('[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
        nmap(']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
        nmap('<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
        nmap('<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

        -- Use LSP as the handler for omnifunc.
        --    See `:help omnifunc` and `:help ins-completion` for more information.
        vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
      end

      local servers = { 'efm', 'gopls', 'rust_analyzer', 'terraformls', 'tflint', 'yamlls' }
      local lspconfig = require('lspconfig')
      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
          on_attach = on_attach,
          flags = { debounce_text_changes = 500, exit_timeout = 0 },
          single_file_support = true,
          settings = require('garu.lsp_settings'),
        }
      end
    end,
  }

  trial(use)

  if packer_bootstrap then
    require('packer').sync()
  end
end)
