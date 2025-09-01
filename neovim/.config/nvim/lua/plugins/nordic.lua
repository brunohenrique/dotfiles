---- example lazy.nvim install setup
-- return {
--     "slugbyte/lackluster.nvim",
--     lazy = false,
--     priority = 1000,
--     init = function()
--         vim.cmd.colorscheme("lackluster")
--         -- vim.cmd.colorscheme("lackluster-hack") -- my favorite
--         -- vim.cmd.colorscheme("lackluster-mint")
--     end,
-- }
-- return {
--   "EdenEast/nightfox.nvim",
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme("dayfox")
--   end,
-- }
-- -- return {
--   "fcancelinha/nordern.nvim",
--   branch = "master",
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme("nordern")
--   end,
-- }
return {
  'andersevenrud/nordic.nvim',
  priority = 1000,
  lazy = false,
  config = function()
    vim.cmd.colorscheme('nordic')
    -- The table used in this example contains the default settings.
    -- Modify or remove these to your liking (this also applies to alternatives below):
    require('nordic').colorscheme({
      -- Underline style used for spelling
      -- Options: 'none', 'underline', 'undercurl'
      underline_option = 'underline',
      bold_keywords = true,
      -- Italics for certain keywords such as constructors, functions,
      -- labels and namespaces
      italic = false,
      -- Italic styled comments
      italic_comments = true,
      -- Minimal mode: different choice of colors for Tabs and StatusLine
      minimal_mode = false,
      -- Darker backgrounds for certain sidebars, popups, etc.
      -- Options: true, false, or a table of explicit names
      -- Supported: terminal, qf, vista_kind, packer, nvim-tree, telescope, whichkey
      alternate_backgrounds = false,
      -- Callback function to define custom color groups
      -- See 'lua/nordic/colors/example.lua' for example defitions
      custom_colors = function(c, _, _)
        return {
          { 'TelescopePromptBorder',                                     c.blue },
          { 'TelescopeResultsBorder',                                    c.blue },
          { 'TelescopePreviewBorder',                                    c.blue },
          { { '@include', '@label' },                                    c.purple },
          { { '@type', '@variable', '@field', 'Special', 'identifier' }, c.blue },
          { { '@keyword', '@field' },                                    c.intense_blue },
          { { '@string', '@string.special', 'String' },                  c.cyan },
          { { '@function.macro' },                                       c.bright_cyan },
        }
      end,
    })
  end,
}
