#!/usr/bin/env bash

# script is originally from kikitux https://github.com/kikitux/curl-bash

which netdata 2>/dev/null || {
  curl -s https://packagecloud.io/install/repositories/netdata/netdata/script.deb.sh | sudo bash
  apt-get update
  apt-get install -y netdata
  sed -i -e 's/localhost/0.0.0.0/g' /etc/netdata/netdata.conf
  sed -i -e 's/\[global\]/\[global\]\n    update every = 2/' /etc/netdata/netdata.conf

  systemctl enable netdata.service
  systemctl restart netdata.service
}
