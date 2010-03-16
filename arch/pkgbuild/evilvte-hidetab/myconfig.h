/* Font settings */
#define     FONT                        "Monospace 9"
#define     COLOR_BACKGROUND            "#FAFAFF" /* #D3D7CF */
#define     COLOR_FOREGROUND            "#2E3436"
#define     COLOR_STYLE                 TANGO /* Options: VTE_FIXED, LINUX, RXVT, TANGO, XTERM     */

/* Tab settings */
#define     TAB                         TRUE
#define     TAB_REORDERABLE             TRUE
#define     TAB_SHOW_INFO_AT_TITLE      TRUE
#define     TABBAR_AUTOHIDE             TRUE
#define     TABBAR_SCROLLABLE           TRUE  



/* Various settings */
#define     MOUSE_CURSOR_AUTOHIDE       TRUE
#define     WINDOW_TITLE_DYNAMIC        TRUE
#define     CURSOR_BLINKS               FALSE
#define     SCROLL_LINES                4096
#define     SCROLLBAR                   RIGHT /* Options: LEFT, RIGHT               */
#define     SHOW_WINDOW_ICON            TRUE
#define     WORD_CHARS                  "-A-Za-z0-9_$.+!*(),;:@&=?/~#%"

/* Menu settings */
#define     MENU                        TRUE
#define     MENU_MATCH_STRING_EXEC      "firefox"
#define     MATCH_STRING_EXEC           "firefox" /* click to open, no menu needed  */
#define     MATCH_STRING                "((f|F)(t|T)(p|P)|((h|H)(t|T)(t|T)(p|P)(s|S)*))://[-a-zA-Z0-9.?$%&/=_~#.,:;+]*"
#define     MENU_CUSTOM                 "Copy", "Paste", "Separator", "Select all", "Separator", "Zoom in"

/* Executable settings */
#define     COMMAND_AT_ROOT_WINDOW      TRUE  /* -r option, run in root window      */
#define     COMMAND_DOCK_MODE           TRUE  /* -d option, run as a dock           */
#define     COMMAND_EXEC_PROGRAM        TRUE  /* -e option, execute program         */
#define     COMMAND_SHOW_OPTIONS        TRUE  /* -o option, show build-time options */
#define     COMMAND_SHOW_VERSION        TRUE  /* -v option, show program version    */

/* Hotkey settings */
#define     HOTKEY                      TRUE
#define     HOTKEY_COPY                 CTRL GDK_C
#define     HOTKEY_PASTE                CTRL GDK_V
#define     HOTKEY_SELECT_ALL           CTRL GDK_A
#define     HOTKEY_FONT_BIGGER          CTRL GDK_KP_Add
#define     HOTKEY_FONT_SMALLER         CTRL GDK_KP_Subtract
#define     HOTKEY_TAB_ADD              CTRL GDK_T
#define     HOTKEY_TAB_REMOVE           CTRL GDK_W
#define     HOTKEY_TAB_PREVIOUS         CTRL GDK_Page_Up
#define     HOTKEY_TAB_NEXT             CTRL GDK_Page_Down
#define     HOTKEY_TAB_FIRST            CTRL GDK_Home
#define     HOTKEY_TAB_LAST             CTRL GDK_End
#define     HOTKEY_TAB_GO_TO_NUMBER     TRUE
#define     HOTKEY_TAB_EDIT_LABEL       CTRL GDK_E
