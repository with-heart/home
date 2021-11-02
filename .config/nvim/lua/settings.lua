local opt = vim.opt

opt.wildmode = { "longest", "list", "full" }
opt.pumblend = 17
opt.wildoptions = "pum"

opt.completeopt = "menuone,noselect"

opt.showmode = false
opt.showcmd = true
opt.cmdheight = 1
opt.incsearch = true
opt.showmatch = true
opt.number = true
opt.ignorecase = true
opt.smartcase = true
opt.hidden = true
opt.cursorline = true
opt.equalalways = true
opt.splitright = true
opt.splitbelow = true
opt.updatetime = 1000
opt.scrolloff = 10
opt.grepprg = "rg --vimgrep"
opt.undofile = true
opt.colorcolumn = "80"

-- tabs
opt.autoindent = true
opt.smartindent = true
opt.cindent = true
opt.wrap = false
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true

opt.breakindent = true
opt.showbreak = string.rep(" ", 3)
opt.linebreak = true

opt.foldmethod = "manual"
opt.foldlevel = 0
opt.modelines = 1

opt.belloff = "all"

opt.inccommand = "split"
opt.swapfile = false
opt.shada = { "!", "'1000", "<50", "s10", "h" }

opt.mouse = ""

opt.joinspaces = false

opt.fillchars = { eob = "~" }
