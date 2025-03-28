{pkgs, inputs, ...} :
{
  programs.hyprland = {
    enable = true;
    #package = inputs.hyprland.packages."${pkgs.system}".hyprland
    xwayland.enable = true;
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
}
