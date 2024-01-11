local string = require 'string'

function ShowByteMetadata()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    local line = vim.api.nvim_get_current_line()
    local byte = line:sub(col, col)
    local byteValue = string.byte(byte)
    print("Byte:", byte, "ASCII Value:", byteValue)
end

function Which(c)
	-- which is a shell builtin else an executable
	if string.find(vim.api.nvim_command_output("echo $SHELL"), "zsh") then
		vim.api.nvim_command_output("!which " .. c .. " > /dev/null 2>&1")
	else
		vim.fn.system({ "which", c });
	end
	-- print(vim.v.shell_error .. ", " .. c)
	return vim.v.shell_error == 0;
end
