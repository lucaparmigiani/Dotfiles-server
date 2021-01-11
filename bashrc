export TERM=xterm
export LANG=en_US.UTF-8
export LC_MESSAGES="C"
#JuNest
export PATH=~/.local/share/junest/bin:$PATH
#--------------------------------------------------------------------------------
# GENERAL
#--------------------------------------------------------------------------------
#export PATH=$HOME/.local/bin:$HOME/bin:/usr/local/bin:
export PATH=$HOME/.scripts:$PATH

# ccache to speed up yay
#export PATH=/usr/lib/ccache/bin:$PATH

# Set vim as default editor
export VISUAL=nvim
export EDITOR="$VISUAL"
export MANPAGER='nvim +Man!'

# GO
#--------------------------------------------------------------------------------
#export GOPATH=$HOME/Workspace/go
#export GOROOT=/usr/local/go
# export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
#--------------------------------------------------------------------------------
# PERL
#--------------------------------------------------------------------------------
# PATH="/home/luca/perl5/bin${PATH:+:${PATH}}"; export PATH;
#PERL5LIB="/usr/lib/perl5/5.30";
#PERL5LIB="/home/luca/Soft/bioinfo/vcftools/src/perl${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
#--------------------------------------------------------------------------------
# JAVA
#--------------------------------------------------------------------------------
#export LD_LIBRARY_PATH=/usr/lib/jvm/java-8-oracle/jre/lib/amd64/server
#--------------------------------------------------------------------------------


#================================================================================
# Bioinformatics
#================================================================================

BIOPATH=$HOME/Bioinformatics/Soft
BIOPATH=$HOME/Soft/bioinfo
export PATH=$PATH:$BIOPATH/_shortcut
HG38=/home/luca/Data/Bio/Hg38/hg38.fna

#--------------------------------------------------------------------------------
## BCFTOOLS
export BCFTOOLS_PLUGINS=/home/luca/Soft/bioinfo/bcftools/bcftools/plugins
#--------------------------------------------------------------------------------
## HISAT2
export PATH=/home/luca/Soft/bioinfo/hisat-genotype-top:/home/luca/Soft/bioinfo/hisat-genotype-top/hisatgenotype_scripts:$PATH
export PYTHONPATH=/home/luca/Soft/bioinfo/hisat-genotype-top/hisatgenotype_modules:$PYTHONPATH
#--------------------------------------------------------------------------------

# Base16 Shell
#BASE16_SHELL="$HOME/.config/base16-shell/"
#[ -n "$PS1" ] && \
#    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
#        eval "$("$BASE16_SHELL/profile_helper.sh")"

if [ "$TERM" = "xterm" ] || [ "$TERM" = "xterm-256color" ]
then
    export TERM=xterm-256color
    export HAS_256_COLORS=yes
fi
if [ "$TERM" = "screen" ] && [ "$HAS_256_COLORS" = "yes" ]
then
    export TERM=screen-256color
fi

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/Dotfiles/conf/aliasrc ] && . ~/Dotfiles/conf/aliasrc
