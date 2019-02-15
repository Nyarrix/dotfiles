# Write settings below


# Write settings above
# for debug
# echo "I AM .bash_profile"

# include .bashrc if it exists
if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
fi

# for debug
# echo "reading .bashrc complete"

# execute fish afrer reading .bashrc
exec fish -l
