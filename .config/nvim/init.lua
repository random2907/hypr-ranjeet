local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"nvim-treesitter/nvim-treesitter",
         "williamboman/mason.nvim",
         "williamboman/mason-lspconfig.nvim",
         "neovim/nvim-lspconfig",
})

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "jsonc", "json", "css", "python" },
  auto_install = true,
  highlight = {
    enable = true,
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,
    additional_vim_regex_highlighting = false,
  },
}

require("mason").setup()
require("mason-lspconfig").setup_handlers {
        function (server_name)
                require("lspconfig")[server_name].setup {}
        end,
        ["lua_ls"] = function ()
                local lspconfig = require("lspconfig")
                lspconfig.lua_ls.setup {
                        settings = {
                                Lua = {
                                        diagnostics = {
                                                globals = { "vim" }
                                        }
                                }
                        }
                }
        end,
}


vim.filetype.add({
        pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})

vim.g.mapleader = " "
vim.keymap.set('n','<leader>f',"<cmd>Ex<cr>")
vim.keymap.set('n','<leader>qf',"<cmd>lua vim.lsp.buf.code_action()<cr>")
vim.keymap.set('n','<leader>y','"+y')
vim.keymap.set('v','<leader>y','"+y')
vim.keymap.set('n','<leader>p','"+p')


vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
vim.opt.undofile = true
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.hlsearch = false
vim.opt.termguicolors = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
