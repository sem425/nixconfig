# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  networking.hostName = "black_hole"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp0s3.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
     wget     # skachivaet ssilki iz interneta
     emacs    # tekstoviy redactor
     tmux     # multiplexer
     mc       # posmotret directorii na komputere
     gitFull  # sistema kontrolya versiy
     firefox  # 
     chromium #
     evince   # prosmotr pdf filov
     djview   # prosmotr formata djview
     tdesktop # telegram dlya linux
     tcpdump  # 
     nmap     #
     telnet   #
     racket   # yazik programmirovaniya racket
     golly    # simulator kletochnih avtomatov
     maxima   # reshaet matan   
     wxmaxima # graficheskiy interfeis k maxima
     valgrind # 
     calibre  # library organizer
     nodejs   # interpretator yazika programmirovaniya javascript
     jetbrains.pycharm-community # ide lya haka na python
     binutils # 
     openssl  #
     pwgen    # generator paroley
     dstat    #
     ncdu     #
     sysstat  #
     iotop    #
     htop     # posmotret resurso komputera 
     lsof     # 
     pciutils # 
     file     #
     p7zip    #
     unrar 
     unzip 
     spectacle
     (python3.withPackages (ps: with ps;
         [ numpy jupyter matplotlib imageio scipy pandas ])) # python dlya ML
     # mpv # smotret filmi
     # gimp # fotoredactor
     # gqview # smotret fotki
     # digikam  # photo organizer
     # googleearth  # planeta Earth Google

  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh = { 
    enable = true;
    passwordAuthentication = true;
  };

  services.nginx = {
     enable = true;
     virtualHosts."192.168.8.108" = {
       root = "/home/mem/seminars";
     };
  };

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 80 8000 ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    layout = "us,ru";
    xkbOptions = "eurosign:e, grp:caps_toggle";
    
    displayManager.sddm.enable = true;
    desktopManager.plasma5.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.mem = {
     isNormalUser = true;
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.09"; # Did you read the comment?

}

