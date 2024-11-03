{
  description = "John's NixOS Configuration Files";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-unstable = { url = "github:nixos/nixpkgs/nixos-unstable"; };
    nixpkgs-stable = { url = "github:nixos/nixpkgs/nixos-24.05"; };

    home-manager-unstable = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    xremap-flake.url = "github:xremap/nix-flake";

    stylix.url = "github:danth/stylix";

    zen-browser.url = "github:MarceColl/zen-browser-flake";

    hypr-contrib.url = "github:hyprwm/contrib";
    hyprpicker.url = "github:hyprwm/hyprpicker";
    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
    };
  };

  outputs = inputs@{ self, ... }:
  let

    settings = import ./nixos-config-settings.nix;
    
    systemSettings = settings.systemSettings;
    userSettings = settings.userSettings;

    pkgs = inputs.nixpkgs.legacyPackages.${systemSettings.system};

    lib = inputs.nixpkgs.lib;
    home-manager = inputs.home-manager-unstable;

  in
  {
    nixosConfigurations = {
      system = lib.nixosSystem {
	    system = systemSettings.system;

      modules = [
        ./profiles/default.nix
      ];

 	    specialArgs = {
	      inherit systemSettings;
	      inherit userSettings;
        inherit inputs;
	    };
      };
    };

    homeConfigurations = {
      user = home-manager.lib.homeManagerConfiguration {
    	inherit pkgs;

        modules = [
    	  (./. + "/profiles" + ("/" + systemSettings.profile) + "/home.nix")
        ];

	    extraSpecialArgs = {
	      inherit userSettings;
	      inherit systemSettings;
	      inherit inputs;
        };
      };
    };
  };
}
