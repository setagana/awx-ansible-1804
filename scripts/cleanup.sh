#!/bin/bash -eux

# Apt cleanup.
apt autoremove
apt update

# Add `sync` so Packer doesn't quit too early, before the large file is deleted.
sync

# Run waagent to deprovision the image - required for Azure
/usr/sbin/waagent -force -deprovision+user && export HISTSIZE=0 && sync