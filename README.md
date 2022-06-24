# How to
This repo contains scripts and templates for configuring a DietPi image for use as an OctoPrint device in the printer farm.

- Paste your SSH pubkey after `AUTO_SETUP_SSH_PUBKEY=` in dietpi-template.txt 
- The `custom-dietpi.sh` script takes 3 parameters, in order:
  - Printer number, used for naming (`printerXX`) and final octet of IP address (`192.168.1.XX`).
  - UNIX password, for root and dietpi user accounts (will be salted, hashed and removed from the config file after first boot)
  - Path to template dietpi.txt file (use the included `dietpi-template.txt` unless you want to make your own) 

### Example:

`custom-dietpi.sh 0 mypassword dietpi-template.txt`

This produces `0-dietpi.txt`, with hostname `printer00`, ip `192.168.1.50` and user password `mypassword`.


This file must be placed in `/boot` of the flashed dietpi SD card, and renamed to `dietpi.txt`.

## OctoPrint config
`op-config-files` contains the script `scp-configs.sh`, a tool for automatically copying config, user and key files to the octoprint instances running on dietpi.
Instructions are contained in the script:
```# Utility to SCP OP config, keys and users files to OP instances on network.
# Usage: place OP config files in the correct directory structure:
# op-config-files
# └─ octoprint
#    ├── config.yaml
#    ├── data
#    │   └── appkeys
#    │       └── keys.yaml
#    └── users.yaml

# define the range of IP addresses to run script on.
# [192.168.1.$IPSTART - 192.168.1.$IPEND]
```
