local M = {}
--
-- -- In order to disable a default keymap, use
-- M.disabled = {
--   n = {
--       ["<leader>h"] = "",
--       ["<C-a>"] = ""
--   }
-- }
--
-- -- Your custom mappings
M.general = {
  n = {
    [";"] = {":", "enter command mode", opts = { nowait = true } },
    ["<leader>rb"] = {
      function ()
        vim.cmd("splt term:// cargo build")
      end,
      "Build Rust Files",
      { noremap = true, silent = true}
    },
    --
    ["<leader>rr"] = {
      function ()
        vim.cmd("split term:// cargo run")
      end,
      "Run Rust Files",
      { noremap = true, silent = true}  
    },
--
    ["<leader>rp"] = {
      function ()
        vim.cmd("split term://python3 %")        
      end,
      "Run Python script",
      { noremap = true, silent = true}
    },

  },
  v = {
    [">"] = { ">gv", "indent"},
  },
}
return M 
