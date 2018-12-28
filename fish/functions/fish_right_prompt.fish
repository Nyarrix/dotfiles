function fish_right_prompt
	set -l is_git_dir (git rev-parse --git-dir 2> /dev/null)
	if test -n "$is_git_dir"
		set -l branch (git branch | grep \* | cut -d ' ' -f2)
		echo (set_color green)\[$branch\](set_color normal)
	end
end
