{ config, ...}: 
let
  colors = import ./colors.nix;
in
{

  programs.foot.enable = true;
  programs.foot.settings = {
    main = { 
     term = "xterm-256color";
     font = "monospace:size=12";
    };
    cursor = {
      color = "${colors.base} ${colors.text}"; # text
    };
    colors = {
      alpha = "0.8";
      background = "${colors.base}"; # base
      foreground = "${colors.text}"; # text

      regular0="${colors.overlay}";  # black (Overlay)
      regular1="${colors.love}";  # red (Love)
      regular2="${colors.pine}";  # green (Pine)
      regular3="${colors.gold}";  # yellow (Gold)
      regular4="${colors.foam}";  # blue (Foam)
      regular5="${colors.iris}";  # magenta (Iris)
      regular6="${colors.rose}";  # cyan (Rose)
      regular7="${colors.text}";  # white (Text)
      
      bright0="${colors.overlay}";   # bright black (Overlay)
      bright1="${colors.love}";   # bright red (Love)
      bright2="${colors.pine}";   # bright green (Pine)
      bright3="${colors.gold}";   # bright yellow (Gold)
      bright4="${colors.foam}";   # bright blue (Foam)
      bright5="${colors.iris}";   # bright magenta (Iris)
      bright6="${colors.rose}";   # bright cyan (Rose)
      bright7="${colors.text}";   # bright white (Text)
    };
  }; 

}
