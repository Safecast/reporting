#!/usr/bin/env bash

set -e

if rpm -q grafana; then
  echo "Grafana already installed."
  exit 0
fi

wget https://dl.grafana.com/oss/release/grafana-6.7.1-1.x86_64.rpm
sudo yum install grafana-6.7.1-1.x86_64.rpm

/usr/sbin/grafana-cli plugins install petrslavotinek-carpetplot-panel
/usr/sbin/grafana-cli plugins install grafana-worldmap-panel
/usr/sbin/grafana-cli plugins install grafana-googlesheets-datasource

/usr/sbin/grafana-cli --pluginUrl https://github.com/panodata/grafana-map-panel/releases/download/0.9.0/grafana-map-panel-0.9.0.zip plugins install grafana-worldmap-panel-ng

/sbin/chkconfig --add grafana-server
/sbin/service grafana-server start
