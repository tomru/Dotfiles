# ignore globals because of bug 
# http://ubuntuforums.org/showthread.php?t=240782

setopt noglobalrcs

# copied from globals
if [[ -z "$PATH" || "$PATH" == "/bin:/usr/bin" ]]
then
	export PATH="/usr/local/bin:/usr/bin:/bin:/usr/games"
fi

# own environment adjustments
export PATH=$PATH:$HOME/bin

export EDITOR="/usr/bin/vim"
export PAGER="/usr/bin/less"

# add texlive path, so no confilicts with install-info

PATH=/usr/local/texlive/2008/bin/i386-linux:$PATH; export PATH
MANPATH=/usr/local/texlive/2008/texmf/doc/man:$MANPATH; export MANPATH
INFOPATH=/usr/local/texlive/2008/texmf/doc/info:$INFOPATH; export  INFOPATH

fpath=($fpath $HOME/.zsh/func)
typeset -U fpath
