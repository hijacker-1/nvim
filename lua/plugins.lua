local packer = require("packer")
packer.startup({
    function(use)
        use 'wbthomason/packer.nvim'

        -- all plugins just use
        use('ellisonleao/gruvbox.nvim')
        use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
        use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})
        use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
        use("arkav/lualine-lsp-progress")
        use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim'}}
        use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
        use {'nvim-telescope/telescope-ui-select.nvim' }
        use("glepnir/dashboard-nvim")
        use("ahmedkhalf/project.nvim")
        use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
        use({ "williamboman/nvim-lsp-installer", commit = "36b44679f7cc73968dbb3b09246798a19f7c14e0" })
        use({ "neovim/nvim-lspconfig" })
        use {"Pocco81/AutoSave.nvim"}
        use {"windwp/nvim-autopairs"}
        -- LSP 进度提示
        use {"j-hui/fidget.nvim"}
        -- LSP UI 美化
        use {"tami5/lspsaga.nvim"}
        -- 插入模式获得函数签名
        use {"ray-x/lsp_signature.nvim"}
        -- 自动代码补全系列插件
        use {
            "hrsh7th/nvim-cmp",  -- 代码补全核心插件，下面都是增强补全的体验插件
            requires = {
                {"onsails/lspkind-nvim"}, -- 为补全添加类似 vscode 的图标
                {"hrsh7th/vim-vsnip"}, -- vsnip 引擎，用于获得代码片段支持
                {"hrsh7th/cmp-vsnip"}, -- 适用于 vsnip 的代码片段源
                {"hrsh7th/cmp-nvim-lsp"}, -- 替换内置 omnifunc，获得更多补全
                {"hrsh7th/cmp-path"}, -- 路径补全
                {"hrsh7th/cmp-buffer"}, -- 缓冲区补全
                {"hrsh7th/cmp-cmdline"}, -- 命令补全
                {"rafamadriz/friendly-snippets"}, -- 提供多种语言的代码片段
                {"lukas-reineke/cmp-under-comparator"}, -- 让补全结果的排序更加智能
            },
        }


    end,

    config = {
        display = {
            open_fn = function()
                return require("packer.util").float({ border = "single" })
            end,
        },
    },
})

-- auto install all plugins
pcall(
    vim.cmd,
    [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
