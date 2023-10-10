{
  description = "The synopsis";

  inputs = {
    # FIXME: Temporary local link until FlakeHub push is resolved.
    nix-env.url = "git+file:///home/getpsyched/git/nix-starter-flakes?dir=rust";
    nix-env.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, nix-env, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      nix-env-pkgs = nix-env.outputs.packages.${system};
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with nix-env-pkgs; [ default (vscode [ ]) ];
      };
    };
}
