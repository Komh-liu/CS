local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- 如果没有找到将自动安装 layz.nvim
if not vim.loop.fs_stat(lazypath) then
  print("Installing lazy.nvim....")
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
  print("Done.")
end

vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
-- 所有插件的安装都在这里

    -- 颜色主题插件，这个看个人爱好
    -- Embark 主题是我个人用了很久觉得很好看也实用的一个主题
    -- https://embark-theme.github.io/
  {
    "embark-theme/vim",
    config = function()
      vim.cmd("colorscheme embark")
    end,
  },

    -- 让Neovim背景变透明，如果你需要透明的UI或者模糊背景的效果，就需要用上这个插件
  { "xiyaowong/nvim-transparent" },

    -- 一个超快(Blazingly Fast!)的状态栏美化插件
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

    -- 文件管理器
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },

    -- Buffer（文件）Tab 显示插件
  {
    "willothy/nvim-cokeline",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },

    -- 代码语法高亮，支持多种语言
    { "nvim-treesitter/nvim-treesitter" },

    -- 代码块缩进显示插件
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("ibl").setup {}
    end,
  },

    -- 平滑滚动插件
  { "karb94/neoscroll.nvim" },

    -- 显示git里增加，删除，编辑地方
  { "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },

    -- 一个超快的显示hex颜色的插件
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },

    -- 在文件顶部显示目前函数名
  { 'nvim-treesitter/nvim-treesitter-context' },

    -- 光标位于一个词语时，页面上其他同一个词语加下划线
  { 'RRethy/vim-illuminate' },

    -- 给成对括号、花括号等添加不同的颜色 会造成一些卡顿
 -- {
 --   "HiPhish/rainbow-delimiters.nvim",
 --   dependencies = { "nvim-treesitter/nvim-treesitter" },
 -- },
 -- 
  --  LSP 设置
  -- lsp-zero 是一个已经配置好的基础 lsp 功能的合集插件
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    lazy = true,
    config = false,
  },

  -- 以下是 lsp-zero 的依赖插件
  {
   "neovim/nvim-lspconfig",
   dependencies = {
     { 'hrsh7th/cmp-nvim-lsp' },
   }
  },

  -- 提供 GUI 安装LSP的插件
  {
    "williamboman/mason.nvim",
    build = function()
      vim.cmd("MasonUpdate")
    end,
    config = function()
      require("mason").setup()
    end,

  },
  { "williamboman/mason-lspconfig.nvim" },

  -- 代码补全
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { 'saadparwaiz1/cmp_luasnip' },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-nvim-lua" },

  -- 提示窗口引擎插件
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },

  -- 补全提示中 VScode 式样的图标
  { "onsails/lspkind-nvim" },


   -- 利用 treesitter 自动补全 html tag
   { "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
    },

   -- 保存时自动代码格式化
   { "elentok/format-on-save.nvim" },

   -- typescript LSP，替代 Mason 里的 tsserver，tsserver 相对比较卡顿，还有错误提示不够清楚
   {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
    event = "VeryLazy",
  },

   -- 自动补全提示 tailwindcss 颜色
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    -- optionally, override the default options:
    config = function()
      require("tailwindcss-colorizer-cmp").setup({
        color_square_width = 2,
      })
    end,
  },

    -- 提供用于显示诊断等信息的列表
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
   },
  },

    -- 高亮TODO和FIX等注释
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
    },
  },
    -- php自动格式化
  {
    "yuchanns/phpfmt.nvim",
     config = function()
       require("phpfmt").setup({
         -- Default configs
         cmd = "phpcbf", -- 需要在系统安装 phpcbf
         standard = "PSR12",
         auto_format = true,
       })
     end
   },
   { "nvim-telescope/telescope.nvim" },

   {
    "nvim-tree/nvim-tree.lua",
     version = "*",
     lazy = false,
     dependencies = { "nvim-tree/nvim-web-devicons",},
     config = function()
      require("nvim-tree").setup {}
     end,
   }
})
