--mode names
-- n = normal, v = visual, i = insert, t = terminal;

local function termcodes(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local M = {}

M.general = {
  i = {},

  n = {
    -- change directory to current file's.
    ["<leader>cd"] = { ":cd %:p:h<CR>:pwd<CR>", "Change directory" },
  },

  t = {},

  v = {},

  x = {},
}

return M
