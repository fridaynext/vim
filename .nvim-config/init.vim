set runtimepath^=~/.vim runtimepath+=~/.vim/after runtimepath+=~/.config/nvim
let &packpath = &runtimepath
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0
source ~/.vimrc

lua << EOF
-- Set up nvim-cmp.
local cmp = require'cmp'
cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }, {
        { name = 'buffer' },
    })
})

local lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lsp.intelephense.setup({
    initializationOptions = {
        globalStoragePath = os.getenv('HOME') .. '/.local/share/intelephense'
    },
    settings = {
        intelephense = {
            environment = {
                includePaths = {
                    os.getenv('PWD')
--                    '/home/cfriday/esalon/www/app/Config/SharedConfigs/eS.php',
--                    '/home/cfriday/esalon/www1/app/',
--                    '/home/cfriday/esalon/www1/app/Config/SharedConfigs/eS.php',
--                    '/home/cfriday/esalon/www2/app/',
--                    '/home/cfriday/esalon/www2/app/Config/SharedConfigs/eS.php',
--                    '/home/cfriday/esalon/www3/app/',
--                    '/home/cfriday/esalon/www3/app/Config/SharedConfigs/eS.php'
                }
            },
            files = {
                maxSize = 5000000;
            },
            filetypes = {
                'php', 'ctp'
            },
            storagePath = {
                os.getenv('HOME') .. '/.local/share/intelephense'
            }
        };
    },
    capabilities = capabilities,
    on_attach = on_attach
});
EOF
