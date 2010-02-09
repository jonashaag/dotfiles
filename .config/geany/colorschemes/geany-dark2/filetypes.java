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

[keywords]
primary=abstract assert break case catch class const continue default do else extends final finally for future generic goto if implements import inner instanceof interface native new outer package private protected public rest return static super switch synchronized this throw throws transient try var volatile while true false null
secondary=boolean byte char double float int long null short void
# documentation keywords for javadoc
doccomment=author deprecated exception param return see serial serialData serialField since throws todo version
typedefs=


[settings]
# default extension used when saving files
#extension=java

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
comment_open=/*
comment_close=*/

# set to false if a comment character/string should start at column 0 of a line, true uses any
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
compiler=javac "%f"
run_cmd=java "%e"
