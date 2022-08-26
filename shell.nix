{ pkgs, ... }:
with pkgs;
mkShell {
  name = "tools shell";
  buildInputs = with pkgs; [ fd ripgrep fzf du-dust procs bottom xh jq ];
  shellHook = ''
    export PS1="\n\[\033[1;32m\][nix-shell:\w]\$\[\033[0m\] "
  '';
}
