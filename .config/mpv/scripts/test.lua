mp = require 'mp'
function paste()
    local clipboard = mp.command_native{
        name = 'subprocess',
	playback_only = false,
        args = {'wl-paste', '--no-newline'},
        capture_stdout = true
    }.stdout
    mp.commandv('loadfile', clipboard)
end
mp.add_key_binding('Ctrl+v', 'paste', paste)

