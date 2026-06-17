{
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-26.05";
    };
    systems = {
      url = "github:nix-systems/default";
    };
  };

  outputs = { 
    self,
    nixpkgs,
    systems,
  }: {
    devShells = nixpkgs.lib.genAttrs (import systems) (system: let
      pkgs = import nixpkgs { inherit system; };
    in {
      default = pkgs.mkShellNoCC {
        packages = with pkgs; [
          git
          git-lfs
          vim
          k9s
          k3d
          go-task
          kubectl
          kustomize 
          kubernetes-helm
          helm-docs
        ];
      };
    });
  };
}