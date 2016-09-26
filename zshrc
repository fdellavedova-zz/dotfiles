
# Base16 Shell
BASE16_SCHEME="bespin"
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# Antigen plugin manager
source $HOME/.antigen/antigen.zsh

antigen-use oh-my-zsh
antigen-bundle git
antigen bundle pyenv
antigen bundle python
antigen bundle pip
antigen bundle celery
antigen bundle virtualenv
antigen bundle virtualenvwrapper
antigen bundle docker
antigen-bundle zsh-users/zsh-syntax-highlighting
antigen-bundle zsh-users/zsh-history-substring-search
antigen bundle redis-cli
antigen bundle tmuxinator
antigen bundle vundle
antigen bundle colored-man-pages
antigen bundle command-not-found
antigen bundle sroze/docker-compose-zsh-plugin
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions src
antigen bundle rupa/z
antigen bundle nyan
antigen bundle taskwarrior
antigen bundle chrissicool/zsh-256color
antigen-bundle arialdomartini/oh-my-git

antigen theme jnrowe
antigen apply
antigen selfupdate

# https://github.com/nvbn/thefuck
alias fuck='eval $(thefuck $(fc -ln -1 | tail -n 1)); fc -R'
 
# Anaconda
export PATH=$PATH:/opt/anaconda3/bin
# Viratualenvwrapper environments directory
# set to conda envs
export WORKON_HOME=~/.venvs
source '/home/francesco/google-cloud-sdk/completion.bash.inc'
