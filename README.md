# port

A minimal Zsh theme combining the `robbyrussell` layout with the `gentoo` git workflow.

Built on Zsh's built-in `vcs_info` — no external dependencies, no prompt frameworks required. Shows the current directory, version-control state (Git and SVN), and command exit status in a single compact line.

## Installation

### Option A: Oh My Zsh

Copy the theme into your custom themes directory:

```sh
cp port.zsh-theme "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/port.zsh-theme"
```

Set it in `~/.zshrc`:

```sh
ZSH_THEME="port"
```

Reload the shell:

```sh
source ~/.zshrc
```

### Option B: Manual download

If you checked out this repository elsewhere, download the theme directly:

```sh
mkdir -p "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes"
curl -fLo "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/port.zsh-theme" \
  https://raw.githubusercontent.com/stiermid/port/master/port.zsh-theme
```

Then set `ZSH_THEME="port"` in `~/.zshrc` and reload with `source ~/.zshrc`.

### Option C: Standalone (without Oh My Zsh)

Source the theme from your `~/.zshrc`:

```sh
source /path/to/port.zsh-theme
```

Then reload:

```sh
source ~/.zshrc
```

No further configuration is needed.

## Prompt structure

The prompt consists of three parts:

1. **Current directory** — basename only, in bold cyan.
2. **Version-control status** — shown only inside a Git or SVN working copy.
3. **Status character** — `$` (or `#` when running as root), green after a successful command and red after a failure.

### Status symbols

| Symbol | Meaning |
| ------ | ------- |
| `*` (red) | Unstaged changes |
| `+` (yellow) | Staged changes |
| `?` (magenta) | Untracked files present |
| `\|` + name (red) | In-progress action, e.g. rebase or merge |
| `git:(branch)` | Current Git branch (green) |
| `svn:(branch:rev)` | Current SVN branch and revision |

Outside a repository, only the directory and status character are shown.

## Uninstall

Remove the theme file and revert your `ZSH_THEME` setting:

```sh
rm "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/port.zsh-theme"
```

Then set `ZSH_THEME` back to your previous theme in `~/.zshrc` and run `source ~/.zshrc`. For standalone setups, remove the `source` line instead.

## License

Released into the public domain under the Unlicense. See `UNLICENSE` for details.
