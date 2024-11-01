{ pkgs, ... }:
{
  services.printing = {
    drivers = [ pkgs.hplipWithPlugin ];
  };
}
