### Buy me covfefe ❤️
```
BTC     bc1qjqzkrfupcrgtzpeu0pmut24vq8tfzs9rqe6458
ETH     0x799b3b5520525CDd95d1D5C7Ba1a2Ee6037B1bFE
ADA     addr1q8mz3z7cw4jz9dacvpz6dpw2c6xke6nv8vk6rfnt7mkaat8vgnu796g5vrarn4pjgpdqkare9zryx645e25wcae8636q97typg
XRP     r3Bpcyp8zVNkaDzpppdRTuSXSvxAUJXAVj
LTC     ltc1qpja2nr6x9nz3q3ya3ec6ec5hxvm8dz52urn39z
BCH     1NAteBJF7wKw8BdzLJ6YE65ja1ZAHf68jf
DOGE    DL4VNBx6EGuPcgnJrfgxok9tTvcbVGKx3R
XMR     89S6qYdMJyZZ8ddKtFqTzGhuDZxJkNcmL9L6KzTSw7AeQos1uku2GBhBaHLUYtgv4TQRRQuNF4FixAu6geKC2r25NyWZj2Q
DASH    XtffD9gZFDKWWpabMyAi8sF9EeDREH5dUy
DCR     DsSAqeDekTCvbd84GkAofHyutrFrFDX1EnD
ZEC     t1P336iRRMM6Yu2wTzXJmjm6p4RgNAQkgsM
STRAX   SVfFcCZtQ8yMSMxc2K8xzFr4psHpGpnKNT 
```

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

