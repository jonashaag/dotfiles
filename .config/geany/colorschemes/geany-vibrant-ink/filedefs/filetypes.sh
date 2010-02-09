# For complete documentation of this file, please see Geany's main documentation
[styling]
# foreground;background;bold;italic
default=0xffffff;0x000000;false;false
commentline=0x9933cc;0x000000;false;false
number=0x99cc99;0x000000;false;false
word=0xff6600;0x000000;true;false
string=0x66ff00;0x000000;false;false
character=0x66ff00;0x000000;false;false
operator=0xedf8f9;0x000000;false;false
identifier=0xffffff;0x000000;false;false
backticks=0x804040;0xe1fff3;false;false
param=0x9933cc;0x00ffff;false;false
scalar=0xff8040;0xffffd9;false;false
error=0xff0000;0x000000;false;false
here_delim=0xff6600;0xff0000;false;false
here_q=0x99cc99;0x0000ff;false;false

[keywords]
primary=break case continue do done elif else esac eval exit export fi for function goto if in integer return set shift then until while


[settings]
# default extension used when saving files
#extension=sh

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
comment_open=#
comment_close=

# set to false if a comment character/string should start a column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
	#command_example();
# setting to false would generate this
#	command_example();
# This setting works only for single line comments
comment_use_indent=true

# context action command (please see Geany's main documentation for details)
context_action_cmd=

[build_settings]
# %f will be replaced by the complete filename
# %e will be replaced by the filename without extension
# (use only one of it at one time)
run_cmd="./%f"
