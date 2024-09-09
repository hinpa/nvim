local lsp = require('lsp-zero').preset({'recommended'})

local ls = require("luasnip")



lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
-- local cmp_mappings = lsp.defaults.cmp_mappings(
-- {
-- })
-- lsp.setup_nvim_cmp({
    -- formatting = cmp_format
-- })
--cmp.setup { -- seems not to work properly. Probably being overwritten by lsp-zero
--}

lsp.on_attach(function (client,bufnr)
    local opts = {buffer = bufnr, remap = false}
end)

lsp.setup_nvim_cmp({
    mapping = {
        ['<C-p>']       = cmp.mapping.complete(),
        ['<C-e>']       = cmp.mapping.confirm({select = true}),
        ["<C-j>"]       = cmp.mapping.select_next_item(cmp_select),
        ["<C-k>"]       = cmp.mapping.select_prev_item(cmp_select),
        ["<Down>"]      = cmp.mapping.select_next_item(cmp_select),
        ["<Up>"]        = cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"]       = cmp.mapping(function (fallback) ls.jump(1) end, {"i", "s"}),
        ["<C-b>"]       = cmp.mapping(function (fallback) ls.jump(-1) end, {"i", "s"}),
        ["<C-a>"]       = cmp.mapping.abort(),
    }
})


lsp.setup()


