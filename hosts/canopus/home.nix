{pkgs, ...}: {
  imports = [
    ../../modules/home-manager/hyprland
    ../../modules/home-manager/waybar
    ../../modules/home-manager/picom
    ../../modules/home-manager/alacritty
    ../../modules/home-manager/wezterm
    ../../modules/home-manager/rofi
    ../../modules/home-manager/barrier
    ../../modules/home-manager/firefox
    ../../modules/home-manager/kdeconnect
    ../../modules/home-manager/vs-code
  ];

  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
  };

  qt.enable = true;
  qt.platformTheme = "gtk";
  qt.style.name = "adwaita-dark";
  qt.style.package = pkgs.adwaita-qt;

  gtk = {
    enable = true;
    theme = {
      name = "Materia-dark";
      package = pkgs.materia-theme;
    };
    iconTheme = {
      package = pkgs.tela-icon-theme;
      name = "Tela-black";
    };
  };

  home.packages = with pkgs; [
    discord
    telegram-desktop
    anydesk
    rustdesk-flutter
    vlc
    darktable
    rawtherapee
    beekeeper-studio
    gimp
    obs-studio
    flameshot
    chromium
  ];
}
