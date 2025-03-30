{
  description = "johnstclair's NixOS Configuration Files";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-unstable = { url = "github:nixos/nixpkgs/nixos-unstable"; };
    nixpkgs-stable = { url = "github:nixos/nixpkgs/nixos-24.11"; };

    home-manager-unstable = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";

    ags = {
      url = "github:Aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hypr-contrib.url = "github:hyprwm/contrib";
    hyprpicker.url = "github:hyprwm/hyprpicker";
    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
    };

    ghostty.url = "github:ghostty-org/ghostty";
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
        ./profiles/updater.nix
      ];

 	    specialArgs = {
	      inherit systemSettings;
	      inherit userSettings;
        inherit inputs;
	    };
      };

      iso = lib.nixosSystem {
        specialArgs = { 
          inherit inputs;
          inherit userSettings;
          inherit systemSettings;
       };

        modules = [
          ./profiles/iso/configuration.nix
        ];
        };
    };

    homeConfigurations = {
      user = home-manager.lib.homeManagerConfiguration {
    	inherit pkgs;

        modules = [
    	    (./. + "/profiles" + ("/" + systemSettings.profile) + "/home.nix")
          ./profiles/updater.nix
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
