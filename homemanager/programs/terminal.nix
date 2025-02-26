{...}:
{
	programs.kitty = {
		enable = true;
		extraConfig = " background_opacity 0.5";
	};

	programs.zsh = {
		enable = true;
		enableCompletion = true;
		oh-my-zsh = {
			enable = true;
			theme = "xiong-chiamiov-plus";
			plugins = [ "git" "python" "man" "z"];
		};
	};
}
