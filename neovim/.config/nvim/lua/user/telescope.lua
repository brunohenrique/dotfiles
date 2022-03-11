local telescope = {}

telescope.dotfiles = function()
  require("telescope.builtin").find_files({
    hidden = true,
    prompt_title = "<< Dotfiles >>",
    cwd = "~/.dotfiles"
  })
end

return telescope
