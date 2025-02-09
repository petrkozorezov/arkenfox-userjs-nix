{
  description = "arkenfox/user.js nix";
  inputs = {};

  outputs = { ... }: {
    lib.userjs = builtins.fromJSON (builtins.readFile ./arkenfox-userjs.json);
  };
}
