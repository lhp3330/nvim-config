-- 自动安装 Packer.nvim
-- 插件安装目录
-- ~/user/.Appdate/local/nvim-data/share/nvim/site/pack/packer/
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local paccker_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
    vim.notify('正在安装Pakcer.nvim，请稍后...')
    paccker_bootstrap = fn.system({
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path,
    })

    local rtp_addition = vim.fn.stdpath('data') .. '/site/pack/*/start/*'
    if not string.find(vim.o.runtimepath, rtp_addition) then
        vim.o.runtimepath = rtp_addition .. ',' .. vim.o.runtimepath
    end
    vim.notify('Pakcer.nvim 安装完毕')
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    vim.notify('没有安装 packer.nvim')
    return
end

packer.startup({
    function(use)
        -- Packer 可以升级自己
        use('wbthomason/packer.nvim')
        -- 加速lua
        use('lewis6991/impatient.nvim')
        ------------------ 基础插件------------------
        ------------------ 基本api ------------------
        use('nvim-lua/plenary.nvim')
        ------------------ 弹窗窗口 -----------------
        --use('nvim-lua/popup.nvim')
        --use('rcarriga/nvim-notify')
        use({
            'folke/noice.nvim',
            requires = { 'MunifTanjim/nui.nvim', 'rcarriga/nvim-notify' },
        })
        ------------------ 图标插件 -----------------
        use('kyazdani42/nvim-web-devicons')
        ------------------ 文件树   -----------------
        -- nvim-tree
        use({
            'nvim-tree/nvim-tree.lua',
            requires = { 'nvim-tree/nvim-web-devicons' },
        })
        use('preservim/tagbar')
        ------------------上下状态栏 ----------------
        -- bufferline
        use({
            'akinsho/bufferline.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', 'moll/vim-bbye' },
        })
        -- lualine
        use({
            'nvim-lualine/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons' },
        })
        use('arkav/lualine-lsp-progress')
        ------------------ 多光标 ----------------
        use('mg979/vim-visual-multi')
        ------------------ 搜索弹窗 ----------------
        -- telescope
        use('nvim-telescope/telescope.nvim')
        use('nvim-telescope/telescope-live-grep-args.nvim')
        use('nvim-telescope/telescope-live-grep-raw.nvim')
        use('LinArcX/telescope-env.nvim')
        use('nvim-telescope/telescope-ui-select.nvim')
        use('nvim-telescope/telescope-rg.nvim')
        use('nvim-telescope/telescope-dap.nvim')
        ---------------- markdown预览 -------------
        use('iamcco/markdown-preview.nvim')
        ------------------- 跳转插件-------------
        use('ggandor/flit.nvim')
        --use('ggandor/leap-ast.nvim')
        --use('ggandor/leap-spooky.nvim')
        use('ggandor/leap.nvim')
        -- dashboard-nvim
        use('glepnir/dashboard-nvim')
        -- project
        --use('ahmedkhalf/project.nvim')
        --------语法高亮 treesitter
        use('nvim-treesitter/nvim-treesitter')
        use('p00f/nvim-ts-rainbow')
        -- indent-blankline
        use('lukas-reineke/indent-blankline.nvim')
        --------------------- LSP --------------------
        use('williamboman/mason.nvim')
        use('williamboman/mason-lspconfig.nvim')
        -- Lspconfig
        use('neovim/nvim-lspconfig')
        use('ray-x/lsp_signature.nvim')
        -- cmake
        -- use('Shatur/neovim-cmake')
        -- 补全引擎
        use('hrsh7th/nvim-cmp')
        -- 补全源
        use('hrsh7th/vim-vsnip')
        use('hrsh7th/cmp-vsnip')
        use('hrsh7th/cmp-nvim-lsp') -- { name = nvim_lsp }
        use('hrsh7th/cmp-buffer') -- { name = 'buffer' },
        use('hrsh7th/cmp-path') -- { name = 'path' }
        use('hrsh7th/cmp-cmdline') -- { name = 'cmdline' }
        use('hrsh7th/cmp-nvim-lsp-signature-help') -- { name = 'nvim_lsp_signature_help' }
        -- 常见编程语言代码段
        use('rafamadriz/friendly-snippets')
        -- UI 增强
        use('onsails/lspkind-nvim')
        use('tami5/lspsaga.nvim')
        -- 代码格式化
        use('mhartington/formatter.nvim')
        --use({ 'jose-elias-alvarez/null-ls.nvim', requires = 'nvim-lua/plenary.nvim' })
        -- TypeScript 增强
        use({ 'jose-elias-alvarez/nvim-lsp-ts-utils', requires = 'nvim-lua/plenary.nvim' })
        -- Lua 增强
        use('folke/neodev.nvim')
        -- JSON 增强
        use('b0o/schemastore.nvim')
        -- Rust 增强
        use('simrat39/rust-tools.nvim')
        --------------------- colorschemes --------------------
        -- tokyonight
        use('folke/tokyonight.nvim')
        -- OceanicNext
        use('mhartington/oceanic-next')
        -- gruvbox
        use('ellisonleao/gruvbox.nvim')
        -- zephyr
        use('glepnir/zephyr-nvim')
        -- nord
        use('shaunsingh/nord.nvim')
        -- onedark
        use('ful1e5/onedark.nvim')
        -- nightfox
        use('EdenEast/nightfox.nvim')
        -- vscode
        use('Mofiqul/vscode.nvim')
        -- catppuccin
        use({ 'catppuccin/nvim', as = 'catppuccin' })
        --------------------主题透明---------------------------
        use('xiyaowong/nvim-transparent')
        ----------------------纯净模式-------------------------
        use('Pocco81/true-zen.nvim')
        --不同位置的终端tt
        use('akinsho/toggleterm.nvim')
        ------关键字调用hop跳转
        use('folke/which-key.nvim')
        use({
            'phaazon/hop.nvim', -- like easymotion, but more powerful
            branch = 'v2', -- optional but strongly recommended
        })
        -- surround
        use('kylechui/nvim-surround')
        -- Comment
        use('numToStr/Comment.nvim')
        -- nvim-autopairs括号补全
        use('windwp/nvim-autopairs')
        -- git
        use({ 'lewis6991/gitsigns.nvim' })
        -- vimspector
        --use('puremourning/vimspector')
        ---------------------------dap调试--------------
        use('mfussenegger/nvim-dap')
        use('theHamsta/nvim-dap-virtual-text')
        use({
            'rcarriga/nvim-dap-ui',
            requires = { 'mfussenegger/nvim-dap' },
        })
        -------------lf插件----------
        use({
            'ptzz/lf.vim',
            requires = { 'voldikss/vim-floaterm' },
        })
        -----翻译插件
        use('voldikss/vim-translator')
        --------高亮
        use('mtdl9/vim-log-highlighting')
        --------显示lsp状态
        use('j-hui/fidget.nvim')
        ----------------测试代码片段
        -- use('vim-test/vim-test')
        -- use('nvim-neotest/neotest')
        --------------自动保存
        -- use("Pocco81/AutoSave.nvim")
        -- use('djoshea/vim-autoread')
        -----------j，k加速
        -- use('rhysd/accelerated-jk')
        ------------导航栏
        -- use('aserowy/tmux.nvim')

        if paccker_bootstrap then
            packer.sync()
        end
    end,
    config = {
        -- profile = {
        --   enable = true,
        --   threshold = 1,
        -- },
        compile_on_sync = true,
        -- profile = {
        --   enable = false,
        --   threshold = 1
        -- },
        -- 锁定插件版本在snapshots目录
        --snapshot_path = require("packer.util").join_paths(vim.fn.stdpath("config"), "snapshots"),
        -- 这里锁定插件版本在v1，不会继续更新插件
        --snapshot = "v1",

        -- 最大并发数
        max_jobs = 16,
        -- 自定义源
        git = {
            -- default_url_format = "https://hub.fastgit.xyz/%s",
            -- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
            -- default_url_format = "https://gitcode.net/mirrors/%s",
            -- default_url_format = "https://gitclone.com/github.com/%s",
        },
        display = {
            -- 使用浮动窗口显示
            open_fn = function()
                return require('packer.util').float({ border = 'single' })
            end,
        },
    },
})

-- 每次保存 plugins.lua 自动安装插件
-- pcall(
--   vim.cmd,
--   [[
-- augroup packer_user_config
-- autocmd!
-- autocmd BufWritePost plugins.lua source <afile> | PackerSync
-- augroup end
-- ]]
-- )
