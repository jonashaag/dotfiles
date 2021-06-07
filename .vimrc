set shell=fish

source $HOME/.vim/conf/basics.vim

source $HOME/.vim/conf/ack.vim
source $HOME/.vim/conf/ale.vim
source $HOME/.vim/conf/anzu.vim
source $HOME/.vim/conf/fzf.vim
source $HOME/.vim/conf/highlightedyank.vim
source $HOME/.vim/conf/litecorrect.vim
source $HOME/.vim/conf/sideways.vim
"source $HOME/.vim/conf/ctags.vim

source $HOME/.vim/conf/css.vim
source $HOME/.vim/conf/c.vim
source $HOME/.vim/conf/python.vim
source $HOME/.vim/conf/html.vim
source $HOME/.vim/conf/markdown.vim
source $HOME/.vim/conf/php.vim
"source $HOME/.vim/conf/elm.vim
source $HOME/.vim/conf/javascript.vim
source $HOME/.vim/conf/markdown.vim
source $HOME/.vim/conf/mathematica.vim
source $HOME/.vim/conf/nginx.vim
source $HOME/.vim/conf/php.vim
source $HOME/.vim/conf/python.vim

"let g:gutentags_ctags_extra_args = ['-n']

execute pathogen#infect()
