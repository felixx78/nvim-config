vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.bo.softtabstop = 2

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.expand("~/.nvim/undodir")
vim.opt.undofile = true

vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>s", ':w<CR>:Prettier<CR>')

vim.keymap.set("x", "<leader>y", '"+y')

vim.api.nvim_set_keymap('i', '"', '""<left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', "'", "''<left>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '(', '()<left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '[', '[]<left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '{', '{}<left>', { noremap = true, silent = true })

-- vim.cmd('colorscheme poimandres')
vim.cmd('colorscheme catppuccin')

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
  
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, {buffer = bufnr, remap = false})
end)


local cmp = require('cmp')

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.confirm({select = true}),
  })
})

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'tsserver'},
  handlers = {lsp_zero.default_setup}
});
