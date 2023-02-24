{ config, pkgs, ... }:
{

  programs.newsboat = rec{
    enable = true;
    browser = "\${pkgs.xdg-utils}/bin/xdg-open"; 
    extraConfig = ''
      macro m set browser "mpv %u" ; open-in-browser ; set browser "${browser}"
    '';

    urls = [
      {
        tags = ["podcast"];
        url = "https://feeds.soundcloud.com/users/soundcloud:users:672423809/sounds.rss";
      }
      {
        tags = ["youtube"];
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCb4pvsyqNrmBIGJFQxEukUA";
      }
      {
        tags = ["youtube"];
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC2eYFnH61tmytImy1mTYvhA";
        title = null;
      }
      {
        tags = ["youtube"];
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC7YOGHUfC1Tb6E4pudI9STA";
        title = null;
      }
      {
        tags = ["youtube"];
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCOWcZ6Wicl-1N34H0zZe38w";
        title = null;
      }
      {
        tags = ["youtube"];
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCeJrRK_Pt1m23l5zgSytVUA";
        title = null;
      }
      {
        tags = ["youtube"];
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCCCmapQ-VnHWNZlK1Jdnalg";
        title = null;
      }
      {
        tags = ["youtube"];
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCD6VugMZKRhSyzWEWA9W2fg";
        title = null;
      }
      {
        tags = ["youtube"];
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCSIFu39z2Dy3vLVS_hlxsdQ";
        title = null;
      }
      {
        tags = ["youtube"];
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCOujgO5S-Zn8DqpFrvzeIqA";
        title = null;
      }
      {
        tags = ["youtube"];
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCFtOX-21N1earf-K58C7HjQ";
        title = null;
      }
      {
        tags = ["youtube"];
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UClo6j1DhtvHIKBPcsmCgWlg";
        title = null;
      }
      {
        tags = ["youtube"];
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCTf-ZxPwhdDu-cCC_l3ehIw";
        title = null;
      }
      {
        tags = ["youtube"];
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCNSMdQtn1SuFzCZjfK2C7dQ";
        title = null;
      }
      {
        tags = ["youtube"];
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC8gjEaNWpu6IMazDwph7cpA";
        title = null;
      }
      {
        tags = ["youtube"];
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC8EYr_ArKMKaxfgRq-iCKzA";
        title = null;
      }
      {
        tags = ["youtube"];
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC_vUfm0QoNfsfnuFc0xIrRg";
        title = null;
      }
      {
        tags = ["youtube"];
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCWsslCoN3b_wBaFVWK_ye_A";
        title = null;
      }
      {
        tags = ["youtube"];
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCiRiQGCHGjDLT9FQXFW0I3A";
        title = null;
      }
      {
        tags = ["youtube"];
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCjDQKxiTVpXutZc2Ra9wCAg";
        title = null;
      }
    ];

  };

}
