{ pkgs, lib, scripts, ...}:
let
	python = "${pkgs.python3}/bin/python3";
	s = "${scripts.dir}/qtile_check.py";
in
{
	imports = [ ./programs ./qtile];

	home.username = "ruben";
	home.homeDirectory = "/home/ruben";
	
	home.packages = with pkgs; [];

	home.shellAliases = {
		u = "sudo nixos-rebuild switch --flake ~/.dotfiles";
		uh = "home-manager switch --flake ~/.dotfiles";
	};

	programs.zsh.enable = true;

	home.activation = {
		qtile_check_file_system = lib.hm.dag.entryAfter ["writeBoundary"] ''
			${python} "${s}"
		'';
	};
	
	home.stateVersion = "24.11";
	home.enableNixpkgsReleaseCheck = false;
}
