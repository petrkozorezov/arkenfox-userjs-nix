# arkenfox/user.js nix

This is the daily auto updated nix version of [arkenfox/user.js](https://github.com/arkenfox/user.js/).

## Usage with Home-manager

1. follow the [manual](https://nix-community.github.io/home-manager/index.xhtml#ch-nix-flakes) to set up home-manager with flakes
1. add flake input
1. pass flake input to `extraSpecialArgs`
1. add settings to Firefox profile(s)

flake.nix
```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    arkenfox-userjs.url = "github:petrkozorezov/arkenfox-userjs-nix";
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }: {
    homeConfigurations.my-user = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      extraSpecialArgs = { inherit inputs; };
      modules = [
        { pkgs, inputs, ... }: {
          programs.firefox = {
            enable = true;
            profiles.myprofile.settings = inputs.arkenfox-userjs.lib.userjs // {
              # your overrides here, e.g.
              "browser.startup.page" = 3; # restore session
            };
          };
        }
      ];
    };
  };
}
```
