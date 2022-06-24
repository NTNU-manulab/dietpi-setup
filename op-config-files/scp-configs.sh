# Utility to SCP OP config, keys and users files to OP instances on network.
# Usage: place OP config files in the correct directory structure:
# op-config-files
# └─ octoprint
#    ├── config.yaml
#    ├── data
#    │   └── appkeys
#    │       └── keys.yaml
#    └── users.yaml

# define the range of IP addresses to run script on.
# [192.168.1.$IPSTART - 192.168.1.$IPEND]
IPSTART=50
IPEND=55

# Run script from op-config-files directory

for i in $( seq $IPSTART $IPEND )
do
  scp -r ./octoprint/* root@192.168.1.$i:/mnt/dietpi_userdata/octoprint/.octoprint/
  ssh root@192.168.1.$i 'sudo chown -R octoprint:octoprint /mnt/dietpi_userdata/octoprint/.octoprint/*'
  ssh root@192.168.1.$i '/boot/dietpi/dietpi-services restart octoprint'
done
