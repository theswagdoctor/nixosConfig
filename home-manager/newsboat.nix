{ config, pkgs, ... }:
{

  programs.newsboat = {
    enable = true;

    urls = [
      {url = "https://feeds.soundcloud.com/users/soundcloud:users:672423809/sounds.rss"}
    ];

  };

}
