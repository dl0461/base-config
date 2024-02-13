function! RawPasteFromAnyRegister()
	set paste
    let l:char = input("Enter a register: ")
    " echo "Got char: " . l:char . " with UTF-8 code: " . char2nr(l:char)
    let l:register = l:char[0]
    call feedkeys('"' . l:register . 'p')
	set nopaste
endfunction

function! TrimSelection()
	try
		'<,'>s,^\n,,
	catch /.*/
	endtry
	try
		'<,'>s,^\s\+,,
	catch /.*/
	endtry
endfunction

function! ToggleRelativeNumber()
	if &relativenumber
		set norelativenumber
		set nonumber
	else
		set relativenumber
		set number
	endif
endfunction

function! JobPostToMarkdown()
	" escape '\' if attempt to make this work with :exe
	" broke AF
	"let Silence = {c -> "try | '<,'>" . c . " | catch /E486/ | endtry"}
	try
		'<,'>g,^\n,d
	catch /E486/
	endtry
	try
		'<,'>s,^\([A-Za-z0-9]\),- \1,
	catch /E486/
	endtry
	try
		'<,'>s,^[ ][ ]*\([A-Za-z0-9]\),\t- \1,
	catch /E486/
	endtry
endfunction
