# For complete documentation of this file, please see Geany's main documentation
[styling]
# foreground;background;bold;italic
default=0x039E03;0x262524;false;false
comment=0xA4A4A4;0x262524;false;true
commentline=0xA4A4A4;0x262524;false;true
commentdoc=0x747474;0x262524;false;true
number=0xBBBE00;0x262524;false;false
word=0x3E89DE;0x262524;false;false
word2=0x991111;0x262524;false;false
string=0xE4B778;0x262524;false;false
character=0xE4B778;0x262524;false;false
uuid=0x404080;0x262524;false;false
preprocessor=0x007F7F;0x262524;false;false
operator=0xABD1DE;0x262524;false;false
identifier=0x039E03;0x262524;false;false
stringeol=0x039E03;0xe0c0e0;false;false
verbatim=0xDBB260;0x262524;false;false
regex=0xAAFF57;0x262524;false;false
commentlinedoc=0x747474;0x262524;false;true
commentdockeyword=0x747474;0x262524;false;true
commentdockeyworderror=0x747474;0x262524;false;true
globalclass=0x8AFF96;0x262524;false;false
# whether arguments of preprocessor commands should be styled (only first argument is used)
# 1 to enable, 0 to disable
styling_within_preprocessor=1;0;false;false

[keywords]
# all items must be in one line
primary=volatile default export goto sizeof typename asm enum bool union NULL FALSE TRUE typedef struct char int float double void unsigned signed long short extern static register auto const if else switch for while do break continue return class new delete inline case
secondary=
# these are some doxygen keywords (incomplete)
docComment=attention author brief bug class code date def enum example exception file fn namespace note param remarks return see since struct throw todo typedef var version warning union

[settings]
# default extension used when saving files
#extension=c

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
comment_open=//
comment_close=
# this is an alternative way, so multiline comments are used
#comment_open=/*
#comment_close=*/

# set to false if a comment character/string should start at column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
  #command_example();
# setting to false would generate this
# command_example();
# This setting works only for single line comments
comment_use_indent=true

# context action command (please see Geany's main documentation for details)
context_action_cmd=

[build_settings]
# %f will be replaced by the complete filename
# %e will be replaced by the filename without extension
# (use only one of it at one time)
compiler=gcc -Wall -c "%f"
linker=gcc -Wall -o "%e" "%f"
run_cmd="./%e"


