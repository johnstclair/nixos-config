{ pkgs, ... } : {
  home.packages = with pkgs; [
    dyalog
    gnuapl
  ];

  nixpkgs.config.packageOverrides = pkgs: {
    dyalog = pkgs.dyalog.override {
      acceptLicense = true;
    };
  };
}
