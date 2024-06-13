-- 到时候插件要安装文件管理器 nvim-tree，所以需要在文件的开头禁用 netrw
-- = 1 是告诉Neovim netrw 已经载入了，不需要再载入
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- 清除所有之前定义的 autocmd 并从干净的状态开始
vim.cmd('autocmd!')

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- 仅在当前窗口显示行号
vim.wo.number = true
vim.opt.title = true

-- Neovim 会自动在新行添加空格或制表符以匹配现有的缩进级别
vim.opt.autoindent = true
-- 高亮所有匹配的搜索模式
vim.opt.hlsearch = true

-- 禁止Neovim自动生成备份文件
vim.opt.backup = false

-- 显示命令行渐入的命令
vim.opt.showcmd = true

-- 设置命令行高度为 1
vim.opt.cmdheight = 1

-- 每个分割窗口都有单独的状态行
vim.opt.laststatus = 2

-- 使用空格而不是真实的制表符
vim.opt.expandtab = true

-- 光标以上和以下保持的最小屏幕行数
vim.opt.scrolloff = 10

vim.opt.shell = 'zsh'
vim.opt.backupskip = { "*.bak", "*/tmp/*" }

-- 设置光标为块状
vim.o.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr-o:hor20"

-- 设置光标颜色为白色
vim.cmd([[hi Cursor ctermfg=15 guifg=White]])

-- 在分割窗口中进行增量搜索
vim.opt.inccommand = 'split'
-- 在搜索模式下忽略大小写
vim.opt.ignorecase = true
-- Vim 将根据当前上下文自动使用空格和制表符的混合进行缩进。
vim.opt.smarttab = true
-- 在 Vim 中显示换行线的可视指示
vim.opt.breakindent = true
-- 设置每个缩进级别使用的空格数
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
-- 自动缩进
vim.opt.ai = true
-- 智能缩进
vim.opt.si = true
-- 不换行
vim.opt.wrap = false
-- vim.opt.backspace = 'start,eol,indent'
vim.opt.path:append { '**' } -- 查找文件 - 向下搜索子文件夹
vim.opt.wildignore:append { '*/node_modules/*' }

-- vim.opt.background = "trans"

-- 下划线
-- "\e[4:3m" 是用于下划线文本的 ANSI 转义序列，宽度为1像素
   vim.cmd([[let &t_Cs = "\e[4:3m"]])
   vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- 离开插入模式时取消粘贴模式
   vim.api.nvim_create_autocmd("InsertLeave", {
   pattern = "*",
   command = "set nopaste"
   })

-- 在注释行回车时自动插入注释符号
   vim.opt.formatoptions:append { 'r' }

-- 启用 'splitright' 选项，以便在右侧分割窗口
   vim.opt.splitright = true

-- 启动   
require('base')
require('highlights')
require('plugins')
require("nvim-tree").setup()
