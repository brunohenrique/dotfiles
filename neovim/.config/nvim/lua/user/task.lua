local tasks_query_string = [[
(
 (list_item) @li
 (#match? @li "%s")
 )
]]

local find_task_line = function(bufnr, name)
  local formatted = string.format(tasks_query_string, name)
  local query = vim.treesitter.query.parse("markdown", formatted)
  local parser = vim.treesitter.get_parser(bufnr, "markdown", {})
  local tree = parser:parse()[1]
  local root = tree:root()


  for id, node in query:iter_captures(root, bufnr, 0, -1) do
    if id == 1 then
      local range = { node:range() }
      local text = vim.treesitter.get_node_text(node, bufnr, nil)
      print(vim.inspect(text))
      return range[1], text
    end
  end
end

vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("task", { clear = true }),
  pattern = "*.md",
  callback = function()
    local bufnr = tonumber(vim.fn.expand('<abuf>'))
    vim.fn.jobstart({ "task", "export", "rc.json.array=off" }, {
      stdout_buffered = true,
      on_stdout = function(_, data)
        if not data then
          return
        end

        for _, line in ipairs(data) do
          if line == '' then
            goto continue
          end
          local decoded = vim.json.decode(line)
          local task_line, _ = find_task_line(bufnr, decoded.description)
          if task_line == nil then
            goto continue
          end

          if decoded.status ~= "completed" then
            goto continue
          end

          local text = {"✓"}
          vim.api.nvim_buf_set_extmark(bufnr, 10, task_line, 0, {
            virt_text = { text },
          })

          ::continue::
        end
      end
    })
  end
})
