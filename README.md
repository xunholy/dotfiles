# Dotfiles

Managing my personal Dotfiles using [Chezmoi](https://www.chezmoi.io/).

## Oh-My-ZZH

Adding Oh-My-ZZH to Chezmoi requires some additional [configuration](https://www.chezmoi.io/docs/how-to/#include-dotfiles-from-elsewhere).

## Local Setup

Steps:

1. Install Chezmoi
2. Install Homebrew
3. Install GO
4. Install Alpaca (Apple M1 must build from source)

```bash
chezmoi init --apply xunholy
```

```
sh -c "$(curl -fsLS git.io/chezmoi)" -- init --apply <github-username>
```