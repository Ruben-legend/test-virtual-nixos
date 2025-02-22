{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    qtile-flake = {
    	url = "github:qtile/qtile";
	inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, flake-utils, qtile-flake, ...} @ inputs: 
		let 
			system = "x86_64-linux";
			lib = nixpkgs.lib;
			pkgs = nixpkgs.legacyPackages.${system};
			qtile = (_: { nixpkgs.overlays = [qtile-flake.overlays.default]; });
		in{
			nixosConfigurations = {
				ruben = lib.nixosSystem{
					inherit system;
					modules = [ 
						qtile
						./nixosConfig/configuration.nix 
					];
				};
			};

			homeConfigurations = {
				ruben = home-manager.lib.homeManagerConfiguration {
					inherit pkgs;

					modules = [ ./homemanager/home.nix ];
				};
			};

		};
}
