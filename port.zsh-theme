# port.zsh-theme — robbyrussell layout + gentoo git workflow

autoload -Uz colors && colors

autoload -Uz vcs_info
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '%F{red}*'
zstyle ':vcs_info:*' stagedstr '%F{yellow}+'
# NOTE: %%b is intentional — vcs_info collapses %% to % so the prompt sees %b (bold-off).
# A bare %b here would be consumed as branch name by vcs_info.
zstyle ':vcs_info:*' actionformats '%B%F{blue}git:(%F{green}%b%F{yellow}|%F{red}%a%c%u%m%F{blue})%f%%b '
zstyle ':vcs_info:*' formats '%B%F{blue}git:(%F{green}%b%c%u%m%F{blue})%f%%b '
zstyle ':vcs_info:svn:*' branchformat '%b'
zstyle ':vcs_info:svn:*' actionformats '%B%F{blue}svn:(%F{green}%b%F{yellow}:%F{red}%i%F{yellow}|%F{red}%a%c%u%m%F{blue})%f%%b '
zstyle ':vcs_info:svn:*' formats '%B%F{blue}svn:(%F{green}%b%F{yellow}:%F{red}%i%c%u%m%F{blue})%f%%b '
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:git*+set-message:*' hooks untracked-git

+vi-untracked-git() {
  # Fast untracked check: single git invocation, no grep fork.
  # --directory --no-empty-directory collapses an untracked dir to one hit without descending.
  if command git ls-files --others --exclude-standard --directory --no-empty-directory --error-unmatch -- ':/*' >/dev/null 2>&1; then
    hook_com[misc]='%F{magenta}?'
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
