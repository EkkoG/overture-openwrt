#!/bin/bash -e
set -o pipefail

wget https://raw.githubusercontent.com/pexcn/daily/gh-pages/chnroute/chnroute.txt -nv -O ip_network_primary
wget https://raw.githubusercontent.com/pexcn/daily/gh-pages/chnroute/chnroute-v6.txt -nv -O ip_network_primary6
cat ip_network_primary6 >> ip_network_primary
rm ip_network_primary6
wget https://raw.githubusercontent.com/pexcn/daily/gh-pages/gfwlist/gfwlist.txt -nv -O domain_alternative
wget https://raw.githubusercontent.com/pexcn/daily/gh-pages/chinalist/chinalist.txt -nv -O domain_primary
