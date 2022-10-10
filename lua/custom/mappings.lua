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

M.coderunner = {
  n = {
    ["<leader>r"] = { ":RunCode<CR>" },
    ["<leader>rf"] = { ":RunFile<CR>" },
    ["<leader>rft"] = { ":RunFile tab<CR>" },
    ["<leader>rp"] = { ":RunProject<CR>" },
    ["<leader>rc"] = { ":RunClose<CR>" },
    ["<leader>crf"] = { ":CRFiletype<CR>" },
    ["<leader>crp"] = { ":CRProjects<CR>" },
  }
}

return M
