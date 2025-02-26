{pkgs, ...}:
let
	tmuxPlugins = pkgs.tmuxPlugins;
in
{
	programs.tmux = {
		enable = true;
		plugins = with tmuxPlugins; [
			sensible
			catppuccin
			vim-tmux-navigator
		];
	};
}
