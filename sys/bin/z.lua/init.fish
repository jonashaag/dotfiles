#! /usr/bin/env fish

if test -z "$_ZL_DATA"
	if test -z "$XDG_DATA_HOME"
		set -U _ZL_DATA_DIR "$HOME/.local/share/zlua"
	else
		set -U _ZL_DATA_DIR "$XDG_DATA_HOME/zlua"
	end
	set -U _ZL_DATA "$_ZL_DATA_DIR/zlua.txt"
end

if test ! -e "$_ZL_DATA"
	if test ! -e "$_ZL_DATA_DIR"
		mkdir -p -m 700 "$_ZL_DATA_DIR"
	end
	touch "$_ZL_DATA"
end

set -x _ZL_DATA "$_ZL_DATA"

# set _zlua_dir (dirname (status --current-filename))

if type -q lua
	lua $path/z.lua --init fish enhanced once echo | source
else if type -q lua5.3
	lua5.3 $path/z.lua --init fish enhanced once echo | source
else if type -q lua5.2
	lua5.2 $path/z.lua --init fish enhanced once echo | source
else if type -q lua5.1
	lua5.1 $path/z.lua --init fish enhanced once echo | source
else
	echo "init z.lua failed, not find lua in your system"
end


alias zc='z -c'      # restrict matches to subdirs of $PWD
alias zz='z -i'      # cd with interactive selection
alias zf='z -I'      # use fzf to select in multiple matches
alias zb='z -b'      # quickly cd to the parent directory


