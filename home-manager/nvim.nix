{ inputs, pkgs, ...}: {

 programs.neovim = {
  enable = true;
  viAlias = true;
  vimAlias = true;
  defaultEditor = true;
  plugins = [
   pkgs.vimPlugins.nvim-treesitter.withAllGrammars
   #pkgs.vimPlugins.nvim-treesitter
   pkgs.vimPlugins.vim-nix
   pkgs.vimPlugins.rose-pine
   pkgs.vimPlugins.nvim-tree-lua
  ];
  extraConfig = ''
    set undofile
    set undolevels=1000
    set undoreload=10000
  '';
 };
 
}
