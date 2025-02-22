{ pkgs, ... }:{
	home.username = "ruben";
	home.homeDirectory = "/home/ruben";

	home.shellAliases = {
		u = "sudo nixos-rebuild switch --flake ~/.dotfiles";
		uh = "home-manager switch --flake ~/.dotfiles";
	};

	programs.zsh.enable = true;

	xdg.configFile."qtile" = {
		source = ./qtile;
		recursive = true;
	};
	
	home.stateVersion = "24.11";
	home.enableNixpkgsReleaseCheck = false;
}
