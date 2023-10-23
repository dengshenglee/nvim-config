-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end
-- map("n", "<A-t>", function()
--   Util.float_term(nil, { cwd = Util.get_root() })
-- end, { desc = "Terminal (root dir)" })
-- map("i", "<A-t>", function()
--   Util.float_term(nil, { cwd = Util.get_root() })
-- end, { desc = "Terminal (root dir)" })
vim.api.nvim_exec(
  [[
" Normal
nnoremap dd ddzz
" Visual
vnoremap d dzz
noremap # #zz
noremap * *zz
noremap w wzz
noremap W Wzz
noremap e ezz
noremap E Ezz
noremap b bzz
noremap B Bzz
noremap H Hzz
noremap L Lzz
noremap 0 0zz
noremap $ $zz
noremap ^ ^zz
noremap j jzz
noremap k kzz
noremap G Gzz
noremap u uzz
noremap ( (zz
noremap ) )zz
noremap { {zz
noremap } }zz
noremap [{ [{zz
noremap ]} ]}zz
noremap gd gdzz
"noremap <C-O> <ESC>:action Back<CR>
"noremap <C-I> <ESC>:action Forward<CR>
noremap <C-D> <C-D>zz
noremap <C-U> <C-U>zz
" E和R是为了保持与Chrome中的SurfingKeys的键位一致
noremap E <ESC>:BufferLineCyclePrev<CR>
noremap R <ESC>:BufferLineCycleNext<CR>
]],
  false
)
