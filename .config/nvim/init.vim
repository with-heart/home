runtime plugins.vim
runtime config.vim
runtime mappings.vim
runtime coc.vim
so ~/.config/nvim/settings.vim

if (has("termguicolors"))
 set termguicolors
endif

let ayucolor="mirage"
colorscheme ayu

set t_8f=^[[38;2;%lu;%lu;%lum
set t_8b=^[[48;2;%lu;%lu;%lum

