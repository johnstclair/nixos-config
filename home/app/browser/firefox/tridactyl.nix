{ inputs, lib, userSettings, pkgs, ... }:

let
  extensions = inputs.firefox-addons.packages.${pkgs.system};

  tridactyl = extensions.tridactyl;
in
{
  programs.firefox =
  {
    profiles.default.extensions.packages = lib.singleton tridactyl;
    nativeMessagingHosts = lib.singleton pkgs.tridactyl-native;
  };

  programs.firefox.policies.Preferences =
  {
    "browser.autofocus" = false;
  };


  xdg.configFile."tridactyl/tridactylrc" =
  {
    force = true;
    text =
    ''
" reset something if it is unset
sanitise tridactyllocal tridactylsync

set newtab about:blank

set modeindicatorshowkeys true
set hintnames short
set tabopenpos last
alias sort tabsort

" use firefox's control+f functionality
unbind <C-f> 

bind > tabmove +1
bind < tabmove -1

bind <Tab> tabnext
bind <S-Tab> tabprev

bind <ArrowLeft> tabprev
bind <ArrowRight> tabnext

bind <S-ArrowLeft> back
bind <S-ArrowRight> forward

" interesting hint mode
" set hintfiltermode vimperator-reflow
" colemakdh
set hintchars tnseridhao

" default 300ms
set hintdelay 100

set editorcmd ${pkgs.${userSettings.term}}/bin/${userSettings.term} --class=tridactyl.tridactyl.tridactyl --title=tridactyl -e nvim

set colors midnight

set searchurls {"searxng": "0.0.0.0:9999/search?q=%s"}
    '';
  };
 }
