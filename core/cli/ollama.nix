{ pkgs, ... }:
{
  services.ollama = {
    enable = true;
    acceleration = "cuda";
    host="0.0.0.0";
    environmentVariables = {
      OLLAMA_ORIGINS="*";
    };
  };
}
