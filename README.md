# Desktop
![screen](https://i.ibb.co/1mN6KWy/2020-12-24-23-28-401.png)
```
$ sudo ln -sf $PWD/nixos/configuration.nix /etc/nixos/configuration.nix

$ sudo nixos-rebuild --upgrade switch

# Install home-manager at this point 

$ ln -sf $PWD/home-manager/home.nix $HOME/.config/nixpgs/home.nix

$ nix-channel --update && home-manager switch
```


# Surface
![screen](https://i.imgur.com/6Sjgufq.png)

Builds are distributed to the `builder` host.

```
$ sudo ln -sf $PWD/nixos/configuration-surface.nix /etc/nixos/configuration.nix

$ sudo nixos-rebuild --upgrade switch

# Install home-manager at this point 

$ ln -sf $PWD/home-manager/home.nix $HOME/.config/nixpgs/home.nix

$ nix-channel --update && env CURRENT_HOST=surface home-manager switch
```

