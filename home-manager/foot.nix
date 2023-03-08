{config, inputs, pkgs, ...}:

let 
  color = config.colors.color;
in

{  

  programs.foot.enable = true;
  programs.foot.settings = {
    main = { 
     term = "xterm-256color";
     font = "monospace:size=12";
    };
    cursor = {
      color = "${color.base} ${color.text}"; # text
    };
    colors = {
      alpha = "0.8";
      background = "${color.base}"; # base
      foreground = "${color.text}"; # text

      regular0="${color.overlay}";  # black (Overlay)
      regular1="${color.love}";  # red (Love)
      regular2="${color.pine}";  # green (Pine)
      regular3="${color.gold}";  # yellow (Gold)
      regular4="${color.foam}";  # blue (Foam)
      regular5="${color.iris}";  # magenta (Iris)
      regular6="${color.rose}";  # cyan (Rose)
      regular7="${color.text}";  # white (Text)
      
      bright0="${color.overlay}";   # bright black (Overlay)
      bright1="${color.love}";   # bright red (Love)
      bright2="${color.pine}";   # bright green (Pine)
      bright3="${color.gold}";   # bright yellow (Gold)
      bright4="${color.foam}";   # bright blue (Foam)
      bright5="${color.iris}";   # bright magenta (Iris)
      bright6="${color.rose}";   # bright cyan (Rose)
      bright7="${color.text}";   # bright white (Text)
    };
  }; 

}
