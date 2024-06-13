-- 高亮显示光标所在的当前行
vim.opt.cursorline = true

-- 在终端中使用真彩色
vim.opt.termguicolors = true

-- 有补全选项时，将显示一个带有可用选择的弹出菜单
vim.opt.wildoptions = 'pum'

-- 弹出菜单的透明度，5是稍微透明，最大值100（全透明）
vim.opt.pumblend = 50

-- 背景颜色方案设置为"dark"，插件、颜色和语法高亮将针对暗背景进行优化。
vim.opt.background = 'dark'
