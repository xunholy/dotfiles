# Dotfiles

Cross-platform dotfiles managed with [chezmoi](https://www.chezmoi.io/), targeting **macOS** (work), **Windows/WSL2** (personal) and a **headless Linux devbox** (EC2, Debian arm64).

## What's Managed

| File | Description |
|------|-------------|
| `.zshrc` | Primary shell config — Powerlevel10k, plugins, lazy-loaded completions |
| `.zshenv` | Granted (AWS credential management) alias |
| `.gitconfig` | SSH commit signing, LFS, URL rewrites |
| `.ssh/config` | Per-host identity, macOS Keychain integration |
| `.p10k.zsh` | Powerlevel10k theme configuration |
| `.docker/config.json` | Registry auth, credential store |
| `.bashrc` / `.bash_profile` | Minimal — brew and cargo only |
| `.vimrc` | Vim configuration |

## Architecture

```
~/.local/share/chezmoi/
├── home/                          # .chezmoiroot = home
│   ├── .chezmoi.yaml.tmpl        # Auto-detects OS, sets SSH key name
│   ├── .chezmoiexternal.toml     # Downloads plugins + theme archives
│   ├── .chezmoiignore            # OS-specific file filtering
│   ├── .chezmoidata/packages.yaml # Homebrew packages per OS
│   ├── .chezmoiscripts/          # Package install scripts
│   └── dot_zshrc.tmpl            # ... and other dotfile templates
└── README.md
```

**Auto-detection** — the config template detects the OS and derives settings automatically. No interactive prompts are needed:

- **macOS**: SSH key = `github_ed25519`, Homebrew at `/opt/homebrew`, Android Studio JDK
- **WSL2**: SSH key = `id_ed25519`, Homebrew at `/home/linuxbrew/.linuxbrew`, keychain SSH agent, X11 display, clipboard aliases
- **Headless Linux** (any Linux that isn't WSL2, see `.chezmoitemplates/headless`): Homebrew at `/home/linuxbrew/.linuxbrew`, zsh set as the login shell, vim as the chezmoi editor, no auto-commit or auto-push

## Headless devbox

The devbox has no SSH agent forwarding and no GitHub SSH key, so a few things differ from the PCs:

- Git talks to GitHub over HTTPS through `gh auth git-credential` instead of rewriting to SSH. Run `gh auth login` once with a fine-grained token.
- Commits are signed with a box-local key, `~/.ssh/devbox_signing`, generated on first apply. Add the printed public key at https://github.com/settings/ssh/new as a **Signing Key** so GitHub shows commits as verified.
- Claude Code is installed with its native installer on every machine that doesn't already have it; run `claude` once to log in.
- `~/.claude` is a clone of claude-config, pulled over SSH with a read-only deploy key (`~/.ssh/claude_config_deploy`, host alias `github-claude-config`). On a new box the first apply prints the key; add it with `gh repo deploy-key add <file> --repo xunholy/claude-config` and apply again. Every `chezmoi apply` fast-forwards it. Hooks come from its `setup/install.sh`, except the SessionEnd sync, which pushes and so stays off a read-only box.
- `apt` installs Homebrew's build prerequisites, `zsh` and `git-lfs` before the Homebrew scripts run.
- AWS: the org's SSO IP-lock SCP only accepts WARP/office source IPs, so the box can't call AWS from its own IP. The laptop opens a reverse SOCKS proxy over SSH (port 443 only), and the `devbox-aws-proxy` service (gost on `127.0.0.1:3128`, set as `HTTPS_PROXY` in `.zshenv`) sends only `*.amazonaws.com` through it; everything else, Claude's API included, goes direct. Log in once with `granted sso populate --sso-region ap-southeast-2 https://kickstreaming.awsapps.com/start`, then `assume` as usual. The SSO token sits in granted's file keyring inside the encrypted home.

Bootstrap on a fresh box:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b ~/.local/bin init --apply xunholy
```

## Shell Plugins

Plugins are downloaded as archives via `.chezmoiexternal.toml` (no framework needed):

- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k) (v1.20.0)

## Setup

### New Machine

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply xunholy
```

### Existing Machine

```bash
chezmoi init --apply xunholy
```

### Prerequisites

- [Homebrew](https://brew.sh/) — packages are installed automatically via chezmoi scripts
- GPG key `095E47AA0B13BA84E7A4E8FB4D5665820FF1D266` imported (for encrypted files)
- SSH key in `~/.ssh/` matching the OS default (`github_ed25519` on macOS, `id_ed25519` on WSL2)

## Day-to-Day Usage

```bash
chezmoi edit ~/.zshrc       # Edit via template
chezmoi diff                # Preview changes
chezmoi apply               # Apply changes
chezmoi update              # Pull + apply latest from remote
```

Changes are auto-committed and auto-pushed (configured in `.chezmoi.yaml.tmpl`).
