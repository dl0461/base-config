au BufWritePre *
			\ try | %s,\s\+$,,g | catch /E486/ | endtry
			\ | lua vim.lsp.buf.format()
au BufRead *.sql,*.md,*.out.c,*.tex,*[^.][a-zA-Z0-9_\-]\\\{1,9\}
			\ set wrap linebreak
au Syntax *.c,*.h,*.cxx,*.hxx,*.cpp,*.hpp " hack fix to syntax hl breaking
			\ syntax enable

function Nomodifiable()
	if &readonly | setlocal nomodifiable | endif
endfunction
au BufReadPost * call Nomodifiable()
au ChanOpen * call Nomodifiable()

filetype plugin on
set completeopt-=preview
set formatoptions="t"
set hidden

set iskeyword+=.,-,$
au CmdlineEnter : setl iskeyword-=.,-,$
au CmdlineLeave : setl iskeyword+=.,-,$

set matchpairs+=<:>
set nowrap
set sidescrolloff=1 so=0
set virtualedit=""

set breakindent
set expandtab
set nosmarttab
set shiftwidth=4
set softtabstop=0
set tabstop=4

let g:netrw_bufsettings="relativenumber noma nomod nonu nowrap nobl"
let g:netrw_liststyle=0
