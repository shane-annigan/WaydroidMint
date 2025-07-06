#!/bin/bash

apt install weston
apt install curl
mkdir ~/waydroid
cp ./android.sh ~/waydroid
cd ~/waydroid
chmox +x android.sh
curl -s https://repo.waydro.id/ | bash
