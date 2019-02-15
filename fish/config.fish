# suppress greeting
set fish_greeting

# run only "fish -l"
if status --is-login
	# echo "I'm fish login"
	# set machine specific settings
	if test -e ~/.config/fish/local_config.fish
		source ~/.config/fish/local_config.fish
	end
end
