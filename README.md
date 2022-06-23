# How to
This repo contains scripts and templates for configuring a DietPi image for use as an OctoPrint device in the printer farm.

- Paste your SSH pubkey after `AUTO_SETUP_SSH_PUBKEY=` in dietpi-template.txt 
- The `custom-dietpi.sh` script takes 3 parameters, in order:
  - Printer number, used for naming (`printerXX`) and final octet of IP address (`192.168.1.XX`).
  - UNIX password, for root and dietpi user accounts (will be salted, hashed and removed from the config file after first boot)
  - Path to template dietpi.txt file (use the included `dietpi-template.txt` unless you want to make your own) 

Example:

`custom-dietpi.sh 0 mypassword dietpi-template.txt`

This produces `0-dietpi.txt`, with hostname `printer00`, ip `192.168.1.50` and user password `mypassword`.


This file must be placed in `/boot` of the flashed dietpi SD card, and renamed to `dietpi.txt`.
