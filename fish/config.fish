# suppress greeting
set fish_greeting

# set machine specific settings
if test -e ~/.config/fish/local_config.fish
	source ~/.config/fish/local_config.fish
end
