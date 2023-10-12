let mapleader = ","

nnoremap <F3> :silent exec
			\ "while !search(@/, \"W\") \| bn \| 0 \| endwhile"<CR>

noremap <leader>m :call ToggleRelativeNumber()<CR>
"noremap <leader>m :call ListingToMarkdown()<CR>q

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nnoremap <leader>0 :b10<CR>
nnoremap <leader>1 :b1<CR>
nnoremap <leader>2 :b2<CR>
nnoremap <leader>3 :b3<CR>
nnoremap <leader>4 :b4<CR>
nnoremap <leader>5 :b5<CR>
nnoremap <leader>6 :b6<CR>
nnoremap <leader>7 :b7<CR>
nnoremap <leader>8 :b8<CR>
nnoremap <leader>9 :b9<CR>
"nnoremap <leader>s :ls<CR>:sb<Space>
"nnoremap <leader>b :ls<CR>:b<Space>
nnoremap <leader>s :sb<Space><Tab>
nnoremap <leader>b :b<Space><Tab>
nnoremap <leader>e :b#<CR>
nnoremap <leader>f :bf<CR>
nnoremap <leader>l :bl<CR>
nnoremap <leader>o :on<CR>
nnoremap <leader>q :bp<CR>
nnoremap <leader>w :bn<CR>

nnoremap <leader>t :bel new<CR>:te<CR>
nnoremap <Esc> :noh<CR>
nnoremap Y y$
tmap <leader><Esc> <C-\><C-N>

dig \< 10216 \> 10217
