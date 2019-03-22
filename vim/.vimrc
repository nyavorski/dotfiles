filetype on
set number
syntax enable

set background=dark
"let base16colorspace=256 " Access colors present in 256 colorspace

colorscheme base16-default-dark
"let g:base16_shell_path=base16-builder/output/shell/

set tabstop=4
set shiftwidth=4

set expandtab

set smarttab

set autoindent

"dont copy selected after pasting
xnoremap p pgvy

"Git Commits - line at 50 chars, hard break at 72 chars, enables spell check
au FileType gitcommit set tw=72 | set spell | set colorcolumn=50
