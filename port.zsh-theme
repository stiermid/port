# port.zsh-theme — robbyrussell layout + gentoo git workflow
# Base: robbyrussell (cyan %c path, no leading arrow)
# Git: gentoo vcs_info (* unstaged, + staged, ? untracked, |ACTION), styled as git:(branch...)

autoload -Uz colors && colors

autoload -Uz vcs_info
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '%F{red}*'
zstyle ':vcs_info:*' stagedstr '%F{yellow}+'
zstyle ':vcs_info:*' actionformats '%B%F{blue}git:(%F{red}%b%F{yellow}|%F{red}%a%c%u%m%F{blue})%f%%b '
zstyle ':vcs_info:*' formats '%B%F{blue}git:(%F{red}%b%c%u%m%F{blue})%f%%b '
zstyle ':vcs_info:svn:*' branchformat '%b'
zstyle ':vcs_info:svn:*' actionformats '%B%F{blue}git:(%F{red}%b%F{yellow}:%F{red}%i%F{yellow}|%F{red}%a%c%u%m%F{blue})%f%%b '
zstyle ':vcs_info:svn:*' formats '%B%F{blue}git:(%F{red}%b%F{yellow}:%F{red}%i%c%u%m%F{blue})%f%%b '
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:git*+set-message:*' hooks untracked-git

+vi-untracked-git() {
  if command git status --porcelain 2>/dev/null | command grep -q '??'; then
    hook_com[misc]='%F{red}?'
  else
    hook_com[misc]=''
  fi
}

port_precmd() {
  vcs_info
}

autoload -U add-zsh-hook
add-zsh-hook precmd port_precmd

PROMPT='%{$fg_bold[cyan]%}%c%{$reset_color%} ${vcs_info_msg_0_}%(?:%{$fg_bold[green]%}%(!.#.$):%{$fg_bold[red]%}%(!.#.$))%{$reset_color%} '
