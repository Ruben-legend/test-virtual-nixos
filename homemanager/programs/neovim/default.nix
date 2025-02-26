{ pkgs, lib, scripts, ... }:
let 
  check = "${../../../scripts/neovim_check.py}";
  python = "${pkgs.python3}/bin/python3";
in
{
  programs.neovim = {
	  enable = true;

	  viAlias = true;
	  vimAlias = true;
	  vimdiffAlias = true;
	
	  extraLuaConfig = "
		  ${builtins.readFile ./init.lua}  
	  ";
  };

  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    typescript
    typescript-language-server
    emmet-language-server
    stylua
    nil

    cargo
    python3
    nodejs
    gcc
    gnumake
    cmake
    zip
    unzip
    openssl
  ];

  home.activation.check_neovim_file_system = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${python} ${check}
    '';
}
