# port

A minimal Zsh theme inspired by the `robbyrussell` layout and `gentoo` Git workflow.
Built on Zsh's built-in `vcs_info`, with no additional prompt framework required.

```text
project git:(main+*?) $
```

## Requirements

- **Zsh** to run the theme.
- **Git or Subversion** to display the corresponding repository information.
- **Oh My Zsh** is optional.

## Installation

### Oh My Zsh

Install the theme using either method below.

**From a local checkout** — run from this repository's directory:

```sh
mkdir -p "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes"
cp port.zsh-theme "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/port.zsh-theme"
```

**Download directly** — no checkout required:

```sh
mkdir -p "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes"
curl -fLo "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/port.zsh-theme" \
  https://raw.githubusercontent.com/stiermid/port/master/port.zsh-theme
```

Set the theme in `~/.zshrc`, before Oh My Zsh is loaded:

```sh
ZSH_THEME="port"
```

### Standalone

Add the following to `~/.zshrc`, replacing the path with the theme's location:

```sh
source "/path/to/port.zsh-theme"
```

After either installation method, reload your configuration:

```sh
source ~/.zshrc
```

## Prompt

| Part | Display |
| --- | --- |
| Directory | Current directory name in bold cyan |
| Repository | `git:(branch)` or `svn:(branch:revision)` inside a working copy |
| Command status | `$`, or `#` for root; green on success, red on failure |

Outside a repository, only the directory and command-status character are shown.

### Git status markers

| Marker | Meaning | Color |
| --- | --- | --- |
| `+` | Staged changes | Yellow |
| `*` | Unstaged changes | Red |
| `?` | Untracked files | Magenta |
| `\|action` | In-progress operation, such as merge or rebase | Red action name |

Dirty files inside submodules are not reflected in the parent prompt.
SVN displays the branch and revision only; Git status markers do not apply.

## Uninstall

**Oh My Zsh:** restore your previous `ZSH_THEME` setting and remove the installed file:

```sh
rm "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/port.zsh-theme"
```

**Standalone:** remove the theme's `source` line from `~/.zshrc`.

Start a new shell to apply the change.

## License

Released into the public domain under the [Unlicense](UNLICENSE).
