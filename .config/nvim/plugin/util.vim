function! ToggleRelativeNumber()
	if &relativenumber
		set norelativenumber
		set nonumber
	else
		set relativenumber
		set number
	endif
endfunction

function! ListingToMarkdown()
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
