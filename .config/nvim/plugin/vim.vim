set equalalways
set laststatus=2
set noruler
set shada="!,:500,'100,h,no %"
set shadafile=$XDG_STATE_HOME/nvim/main.shada
set shellcmdflag=-c
set shortmess+=I
set wildcharm=<Tab>
set wildmode=list,full
set wildoptions=pum

set statusline=%-f\ %-h%-w%-q%-r%-m

function SimpleTabLine()
	let s = ''
	for i in range(tabpagenr('$'))
		if i + 1 == tabpagenr()
			let s .= '%#TabLineSel#'
		else
			let s .= '%#TabLine#'
		endif
		let s .= '%{' . (i + 1) . '} '
	endfor
	let s .= '%#TabLineFill#%T'
	if tabpagenr('$') > 1
		let s .= '%=%#TabLine#%999X×'
	endif
	return s
endfunction
set tabline=%!SimpleTabLine()

set cursorline
set number relativenumber
au FileType help setl number relativenumber
au TermOpen * setl number relativenumber wrap

set browsedir="last"
let g:netrw_banner=0
let g:netrw_browse_split=0
let g:netrw_browsex_viewer=""
let g:netrw_home="$XDG_STATE_HOME/nvim"
let g:netrw_keepdir=0

syntax enable
if filereadable(expand('~/.config/nvim/colors/gradient.vim'))
	colorscheme gradient
endif
