# Configs

## macOS (Homebrew)

```bash
packages=(
  # Core tools
  bat
  curl
  fzf
  git
  ghostty
  less
  neovim
  ripgrep
  starship
  stow
  tar
  tmux
  zsh

  # Git and YAML tools
  delta
  yq

  # Neovim LSP servers
  bash-language-server
  dockerfile-language-server
  helm-ls
  lua-language-server
  nixd
  terraform-ls
  yaml-language-server

  # Neovim formatters / linters
  alejandra
  ansible-lint
  deadnix
  dockfmt
  eslint
  hadolint
  prettier
  rubocop
  selene
  shellcheck
  shfmt
  statix
  stylua
  terraform
  tflint
  yamllint

  # Neovim runtime deps
  node
  npm
  ruby

  # Yazi
  chafa
  exiftool
  file
  yazi
)

brew install "${packages[@]}"
```

Stow the macOS configs (two targets):

```bash
stow --dir="/path/to/dotfiles" --target="$HOME/.config" \
  --ignore='^\.zshenv$' \
  ghostty nvim tmux git yazi zsh

stow --dir="/path/to/dotfiles" --target="$HOME" \
  --ignore='^zsh/' \
  zsh
```

## NixOS (Home Manager flake snippet)

```nix
{
  home.packages = with pkgs; [
    # Core
    bat
    curl
    fzf
    git
    less
    neovim
    ripgrep
    starship
    stow
    tar
    tmux
    zsh

    # Git and YAML tools
    delta
    yq

    # Neovim LSP servers
    bash-language-server
    dockerfile-language-server
    helm-ls
    lua-language-server
    nixd
    terraform-ls
    yaml-language-server

    # Neovim formatters/linters
    alejandra
    ansible-lint
    deadnix
    dockfmt
    eslint
    hadolint
    prettier
    rubocop
    selene
    shellcheck
    shfmt
    statix
    stylua
    terraform
    tflint
    yamllint

    # Neovim runtime deps
    nodejs
    npm
    ruby

    # Yazi
    chafa
    exiftool
    file
    yazi

    # Sway stack (Nix-only)
    btop
    ghostty
    fuzzel
    grim
    mako
    networkmanager
    pavucontrol
    slurp
    swayfx
    swaylock
    waybar
    wl-clipboard
  ];
}
```
