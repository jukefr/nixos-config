# Desktop
![screen](https://i.imgur.com/mw2q4ZD.png)
```
$ ln -sf $PWD/configuration.nix /etc/nixos/configuration.nix

$ sudo nixos-rebuild --upgrade switch

# Install home-manager at this point 

$ ln -sf $PWD/home-manager/home.nix $HOME/.config/nixpgs/home.nix

$ nix-channel --update && home-manager switch
```


# Surface
![screen](https://i.imgur.com/6Sjgufq.png)
```
$ ln -sf $PWD/configuration-surface.nix /etc/nixos/configuration.nix

$ sudo nixos-rebuild --upgrade switch

# Install home-manager at this point 

$ ln -sf $PWD/home-manager/home.nix $HOME/.config/nixpgs/home.nix

$ nix-channel --update && env CURRENT_HOST=surface home-manager switch
```

