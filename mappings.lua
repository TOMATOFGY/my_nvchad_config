---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["<leader>ls"] = {"<cmd> Outline <CR>", "open symbols outline", opts = {nowait = true}},
    ["<leader>gg"] = {"<cmd> LazyGit <CR>", "open LazyGit", opts = {nowait = true}},
    ["<leader>jw"] = {"<cmd> HopWord <CR>", "jump to word", opts = {nowait = true}},
    ["<leader><leader>w"] = {"<cmd> HopWord <CR>", "jump to word", opts = {nowait = true}},
    ["<leader><leader>r"] = {function()
      require("ranger-nvim").open(true)
    end, "Open ranger", opts = {nowait = true}},
    ["<leader><leader>q"] = {"<cmd> q <CR>", "quit", opts = {nowait = true}},
    ["<leader>jb"] = {"<cmd> ReachOpen buffers <CR>", "jump to buffer", opts = {nowait = true}},
    ["<leader>jm"] = {"<cmd> ReachOpen marks <CR>", "jump to marks", opts = {nowait = true}},
    ["<leader>s"] = { "<cmd> w <CR>", "save quickly" , opts = { nowait = true } },
    ["<leader>b"] = { "<cmd> ReachOpen buffers <CR>", "switch buffers" , opts = { nowait = true } },
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
    ["J"] = {
      "<cmd> move '>+1<CR>gv-gv",
      "move selected block up"
    },
    ["K"] = {
      "<cmd> move '<-2<CR>gv-gv",
      "move selected block down"
    }
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
