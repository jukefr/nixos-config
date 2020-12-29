# Desktop
![screen](https://i.ibb.co/1mN6KWy/2020-12-24-23-28-401.png)
```
$ sudo ln -sf $PWD/nixos/configuration.nix /etc/nixos/configuration.nix

$ sudo nixos-rebuild switch

# Install home-manager at this point 

$ ln -sf $PWD/home-manager/home.nix $HOME/.config/nixpgs/home.nix

$ home-manager switch
```


# Surface
![screen](https://i.imgur.com/6Sjgufq.png)

You will also need my fork of [ nixos-surface ]( https://github.com/jukefr/nixos-surface ).

Builds are distributed to the `builder` host.

```
$ sudo ln -sf $PWD/nixos/configuration-surface.nix /etc/nixos/configuration.nix

$ sudo nixos-rebuild switch

# Install home-manager at this point 

$ ln -sf $PWD/home-manager/home.nix $HOME/.config/nixpgs/home.nix

$ env CURRENT_HOST=surface home-manager switch
```

# VFIO
![screen](https://i.imgur.com/apytNk7.png)
![screen](https://i.imgur.com/rZmSGa2.png)

Use the Desktop machine as a Parsec host to stream games to the Surface machine via a KVM Windows VM with VFIO GPU passthrough.

Sample virt-manager XML included in `virt-manager/vfio-windows.xml`. Works perfect with latest nvidia drivers and Parsec host.

```
$ sudo ln -sf $PWD/nixos/configuration-vfio.nix /etc/nixos/configuration.nix

$ sudo nixos-rebuild switch # and probably reboot at this point

# Install home-manager at this point

$ ln -sf $PWD/home-manager/home.nix $HOME/nixpgs/home.nix

$ home-manager switch
```

# TODOs
- [ ] update nixos-surface
  - [ ] kernel
  - [ ] libwacom
  - [ ] ipts firmware
- [ ] DRY up
  - [ ] X/noX module
  - [ ] better way than env var deal with different hosts
- [ ] create a module for 2x scaled wallpapers and only include x1 assets in repo and compile 2x assets at build on HiDPI screens
- [ ] create a module to bootstrap win10 vfio qemu vm with virsh
  - [ ] win 10 iso dl
  - [ ] proxmox latest virtio drivers iso download
  - [ ] auto dump/patch gpu rom

