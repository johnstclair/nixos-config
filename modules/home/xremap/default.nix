{ pkgs, config, inputs, ... }:

{
  imports = [
    inputs.xremap-flake.homeManagerModules.default
  ];

  services.xremap = {
    enable = true;
    withHypr = true;
    yamlConfig = ''
    modmap:
      - name: Global
        remap:
          CapsLock: Esc
    '';
    };
}
