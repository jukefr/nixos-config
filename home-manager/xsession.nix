{ config, pkgs, ... }:

{
  xsession =
    let
      cfg =
        if builtins.getEnv "CURRENT_HOST" == "surface"
        then {
          cursorSize = 64;
        }
        else {
          cursorSize = 32;
        };
    in
    { enable = true; pointerCursor.size = cfg.cursorSize; pointerCursor.name = "Vanilla-DMZ"; pointerCursor.package = pkgs.vanilla-dmz; };
}
