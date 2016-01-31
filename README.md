# Dotfiles

## bash

### Requirements

- `brew`
- `brew install git`
- `brew install git-town`
- `brew install npm`
- `brew install pandoc`
- `brew install vagrant-completion`
- `npm install -g nvm`

### Installing

- Add `source <path-to-repo>/bash_profile` to your `~/.bash_profile`

### Features

- Bash completions from `brew`
- Colors
- Redact commands starting with space from history
- Set tab name with `tabname`
- Git shortcuts

| Alias  | Expansion                                    |
|--------|----------------------------------------------|
| `g`    | `git`                                        |
| `ga`   | `git add`                                    |
| `gb`   | `git branch`                                 |
| `gc`   | `git commit`                                 |
| `gca`  | `git commit -a`                              |
| `gco`  | `git checkout`                               |
| `gd`   | `git diff`                                   |
| `gds`  | `git diff --cached`                          |
| `gf`   | `git fetch`                                  |
| `gg`   | `git log --graph --oneline --decorate --all` |
| `gh`   | `git hack`                                   |
| `gl`   | `git log`                                    |
| `gp`   | `git push`                                   |
| `gP`   | `git pull`                                   |
| `gr`   | `git rebase -i`                              |
| `gs`   | `git status`                                 |
| `gst`  | `git stash`                                  |
| `gstp` | `git stash pop`                              |
| `gtm`  | `git town main-branch`                       |

- Misc shortcuts

| Alias      | Expansion                                           |
|------------|-----------------------------------------------------|
| `grer`     | `grep -R`                                           |
| `lsa`      | `ls -ahl`                                           |
| `pandocmd` | `pandoc -V geometry:margin=1in -V fontsize=12pt -o` |


## vim

### Requirements

- `brew`
- `brew install git`
- `brew install macvim`
- Vundle `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
- [Meslo for Powerline](https://github.com/powerline/fonts/tree/master/Meslo)

### Installing

Add `source <path-to-repo>/vimrc` to your `~/.vimrc`

### Features

- Bundled plugins

| Plugin                           | Description                                 |
|----------------------------------|---------------------------------------------|
| `907th/vim-auto-save`            | Auto save                                   |
| `airblade/vim-gitgutter`         | Show line diff on side                      |
| `derekwyatt/vim-scala`           | Scala support                               |
| `dhruvasagar/vim-table-mode`     | Table editing mode                          |
| `jlanzarotta/bufexplorer`        | Buffer viewer                               |
| `kien/ctrlp.vim`                 | Fuzzy file finder                           |
| `luochen1990/rainbow`            | Syntax highlighting for matching characters |
| `matze/vim-move`                 | Move lines and blocks                       |
| `mbbill/code_complete`           | Code snippets                               |
| `nanotech/jellybeans.vim`        | Color scheme                                |
| `ricmatsui/vim-airline`          | Status bar and trailing whitespace alert    |
| `rking/ag.vim`                   | File content searcher                       |
| `rosenfeld/conque-term`          | Shell integration                           |
| `scrooloose/nerdcommenter`       | Commenting shortcuts                        |
| `scrooloose/nerdtree`            | File tree browser                           |
| `scrooloose/syntastic`           | Syntax checker and linter                   |
| `tpope/vim-fugitive`             | Git wrapper                                 |
| `tpope/vim-sleuth`               | Detect indent format                        |
| `Valloric/YouCompleteme`         | Code completion                             |
| `vim-scripts/DoxygenToolkit.vim` | Documentation stub generator                |
| `vim-scripts/a.vim`              | Switch between source and header files      |
| `vim-scripts/gdbmgr`             | GDB integration                             |
| `vim-scripts/restart.vim`        | Fast restart                                |

- Shortcuts

| Shortcut        | Description                                      |
|-----------------|--------------------------------------------------|
| `<Ctrl>-[hjkl]` | Move to split in direction                       |
| `<F2>`          | Run make                                         |
| `<Tab>`         | Switch to next open file                         |
| `\<Tab>`        | Switch to previous open file                     |
| `\A`            | Split view vertically and remain in current view |
| `\ba`           | Open bash shell                                  |
| `\cc`           | Toggle current column highlighting               |
| `\do`           | Generate documentation stub                      |
| `\f`            | Toggle folding at current level                  |
| `\gc`           | Git commit                                       |
| `\gca`          | Git commit all                                   |
| `\gd`           | Git diff                                         |
| `\gp`           | Git push                                         |
| `\gs`           | Git status                                       |
| `\jd`           | Go to definition                                 |
| `\n`            | Go to next error                                 |
| `\rt`           | Toggle rainbow matching characters highlighting  |
| `\sc`           | Run syntax check, `:Errors` to list all errors   |

## tmux

### Installing

Add `source-file <path-to-repo>/tmux.conf` to your `~/.tmux.conf`
