# Dotfiles

Managing my personal Dotfiles using [Chezmoi](https://www.chezmoi.io/).

## Configuration

### Templating

Chezmoi supports [templating](https://www.chezmoi.io/docs/templating/) and is highly recommended.

### Oh-My-ZZH

Adding Oh-My-ZZH to Chezmoi requires some additional [configuration](https://www.chezmoi.io/docs/how-to/#include-dotfiles-from-elsewhere).

Configure Oh-My-ZZH with Chezmoi using [Taskfile](https://taskfile.dev/).

```bash
$ task oh-my-zzh
```
