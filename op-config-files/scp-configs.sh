# Utility to SCP OP config, keys and users files to OP instances on network.

for i in {0..5};
do
  scp -r ./octoprint/* root@192.168.1.5$i:/mnt/dietpi_userdata/octoprint/.octoprint/
  ssh root@192.168.1.5$i 'sudo chown -R octoprint:octoprint /mnt/dietpi_userdata/octoprint/.octoprint/*'
  ssh root@192.168.1.5$i '/boot/dietpi/dietpi-services restart octoprint'
done
