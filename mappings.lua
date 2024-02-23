---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["<leader>fr"] = {function ()
      vim.cmd "Telescope lsp_references"
      vim.cmd "stopinsert" -- Telescope lsp_dynamic_workspace_symbols 执行完成之后会默认进入 insert mode
      -- TODO
    end, "find references"},
    ["<leader><leader><leader>"] = {"<space>", "end of whichkey", opts = {nowait = true}},
    ["<leader>fd"] = {function ()
      vim.cmd "Telescope lsp_definitions"
      vim.cmd "stopinsert" -- Telescope lsp_dynamic_workspace_symbols 执行完成之后会默认进入 insert mode
      -- TODO
    end, "find definitions"},
    ["<leader>fs"] = {function ()
      vim.cmd "Telescope lsp_dynamic_workspace_symbols"
      vim.cmd "stopinsert" -- Telescope lsp_dynamic_workspace_symbols 执行完成之后会默认进入 insert mode
    end, "find symbols in workspac", opts = {nowait = true}},
    -- ["<leader>q"] = {"<cmd>q<cr>", "normal :q"}, -- 这个设置还是太强了
    ["<leader>lq"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "Diagnostic setloclist",
    },
    ["s"] = {"<ESC>", "replace original s to esc" }, -- s stand for subplace one char
    ["<leader>ls"] = {"<cmd> Outline <CR>", "open symbols outline", opts = {nowait = true}},
    ["<leader>gg"] = {"<cmd> LazyGit <CR>", "open LazyGit", opts = {nowait = true}},
    ["<leader>jw"] = {"<cmd> HopWord <CR>", "jump to word", opts = {nowait = true}},
    ["<leader><leader>w"] = {"<cmd> HopWord <CR>", "jump to word", opts = {nowait = true}},
    ["<leader>ww"] = {"<cmd> HopWord <CR>", "jump to word", opts = {nowait = true}},
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
    ["s"] = {"<ESC>", "replace original s to esc" }, -- s stand for subplace one char
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

-- 也许应该要根据当前平台的不同,设置不同的快捷键方式 -- 2024-02-12 20:00:55 原来是alacritty 一开始没有将 option 映射成 meta
-- use alt-num to do quick switch
for i = 1, 9, 1 do
  vim.keymap.set("n", string.format("<A-%s>", i), function()
    vim.api.nvim_set_current_buf(vim.t.bufs[i])
  end)
end


return M
