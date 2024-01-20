---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["<leader>w"] = { ":w <CR>", "save quickly" , opts = { nowait = true } },
    ["<leader>s"] = { "<cmd> w <CR>", "save quickly" , opts = { nowait = true } },
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },

    ["<A-e>"] = {
       "<cmd> NvimTreeFocus <CR>" ,
  "Also Focus nvimtree"
    }

  },
  v = {
    [">"] = { ">gv", "indent"},
  },
}

-- more keybinds!
-- use alt-num to do quick switch
for i = 1, 9, 1 do
  vim.keymap.set("n", string.format("<A-%s>", i), function()
    vim.api.nvim_set_current_buf(vim.t.bufs[i])
  end)
end


return M
