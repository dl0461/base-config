"""""""""""""
" autocmd.txt
"""""""""""""
au BufRead *.tex,*[^.]* set wrap linebreak
au BufWrite * try | %s;\s\+$;;g | catch | w! | endtry
au WinNew * :normal <C-w>_=
au BufWrite *.tex call jobstart('pdflatex ' . shellescape(expand("%")), {'detach':1})
""""""""""
" eval.txt
""""""""""
fun s:toargv()
	%bd
	for i in argv()
		exe 'e '..i
	endfor
endfun
com -nargs=0 Stoargv call s:toargv()
nmap ,a :Stoargv
" associate a (1,...,k,...,n) to a filename
" if filename_k is removed,
"		associate (k,filename_{k+1})...(n-1,filename_n), n=n-1
" if (filename,i) is added,
"		associate (n+1,filename_n)...(i+1,filename_i),(i,filename)
" if (filename_k,i) is added
"		associate (t,filename_i), associate (i,filename_k),
"			associate (k,filename_t)
"""""""""
" map.txt
"""""""""
" to get the output below into register a
" let s = '' | for i in range(1,9) |
" let s = s.."nmap ,"..i.." :b"..i.."<CR>\n" | endfor | let @a = s
nmap ,1 :b1<CR>
nmap ,2 :b2<CR>
nmap ,3 :b3<CR>
nmap ,4 :b4<CR>
nmap ,5 :b5<CR>
nmap ,6 :b6<CR>
nmap ,7 :b7<CR>
nmap ,8 :b8<CR>
nmap ,9 :b9<CR>
nmap ,0 :b10<CR>
nmap ,b11 :b11<CR>
nmap ,b12 :b12<CR>
nmap ,b13 :b13<CR>
nmap ,b14 :b14<CR>
nmap ,b15 :b15<CR>
nmap ,b16 :b16<CR>
nmap ,b17 :b17<CR>
nmap ,b18 :b18<CR>
nmap ,b19 :b19<CR>
nmap ,b20 :b20<CR>
nmap ,s :ls<CR>
nmap ,q :bp<CR>
nmap ,w :bn<CR>
nmap ,e :b#<CR>
nmap ,t :sp<CR>:te<CR>
nmap ,o :on<CR>
nmap <Esc> :noh<CR>
nmap Y y$
tmap <Esc>q <C-\><C-N>
""""""""""""""""
" options.txt
""""""""""""""""
" gj gk to move vertically in soft wrap
" :set nu nornu for normal numbers
" :h indent.txt for info on auto indenting various languages
set bri
set bsdir="last"
set fo="t"
set ls=2
set mps+=<:>
set noet
set noru " use CTRL-g instead
set nosta
set nowrap
set rnu
set shcf=-c " cannot use -i because !bash cannot be interactive in Neovim
set shm+=I
set sw=4
set titlelen=40
set ve=""
set vsts=""
set vts=4
"set list listchars=tab:↓⇥,trail:≁
""""""""""""""
" pi_netrw.txt
""""""""""""""
let g:netrw_banner=0
let g:netrw_browse_split=0
let g:netrw_bufsettings="relativenumber noma nomod nonu nowrap ro nobl"
let g:netrw_home="$HOME/.local/state/nvim"
let g:netrw_keepdir=0 " press t to open file in new tab
let g:netrw_liststyle=0
""""""""""""
" syntax.txt
""""""""""""
syntax on | colorscheme gradient
