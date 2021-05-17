# qubes-random-wg-mullvad-conf
Simple script I use to select a random wireguard conf and connect to it when starting a qube, also additional script to switch country of already running qube, and another to start a wireguard connection if one isn't present (in an appVM with wg configs).

I'm a totally new member of github, and very enthuastic about qubes, linux in general and network security.  This code is by no means finished, as I'm sure some of it can be achieved in a more unified way.

One very nice thing about it is that it works in disposable vm's, so if an appVM has been set up with, for example an arkenfox configured firefox, and then been set to be its own DVM, it will connect to a different wireguard connection on every instance.

Pre-requisites:
must download wireguard configuration files from mullvad of countries you wish to connect to (or ideally, ALL of their wireguard confs in one zip - then remove any that are not wanted) and extract them to /rw/usrconfig/etc/wireguard.  I do chmod 640 ./wireguard after this.

You then need to edit the wg-quick (in fedora templateVM [ sudo nano /usr/bin/wg-quick ] asssuming that this template is where you installed wireguard-tools and change the line in the "parse_options()" function:

[[ $CONFIG_FILE =~ ^[a-zA-Z0-9_=+.-]{1,15}$ ]] && CONFIG_FILE="/etc/wireguard/$CONFIG_FILE.conf"

to

[[ $CONFIG_FILE =~ ^[a-zA-Z0-9_=+.-]{1,15}$ ]] && CONFIG_FILE="/rw/usrlocal/etc/wireguard/$CONFIG_FILE.conf"


this will allow you to store any sets of wireguard configs in any appVM /rw folder
