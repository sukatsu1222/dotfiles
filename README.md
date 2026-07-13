# dotfiles

My dotfiles, managed with [mise](https://mise.jdx.dev/).

## Bootstrap a new machine

1. Install `git` and `mise` (see https://mise.jdx.dev/installing-mise.html)
2. `git clone <this repo> ~/.dotfiles`
3. `mise --cd ~/.dotfiles/config/mise bootstrap`

`mise bootstrap` symlinks the dotfiles (`[dotfiles]`), clones machine-local
caches (`[bootstrap.repos]`, `[bootstrap.hooks.post-repos]`), and installs the
tools in `[tools]`. The config lives at `config/mise/config.toml`, so the
`--cd` flag points mise at that directory.
