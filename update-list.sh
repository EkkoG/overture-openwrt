#!/bin/bash -e
set -o pipefail

wget https://raw.githubusercontent.com/pexcn/daily/gh-pages/chnroute/chnroute.txt -nv -O files/overture/ip_network_primary_sample
wget https://raw.githubusercontent.com/pexcn/daily/gh-pages/chnroute/chnroute-v6.txt -nv -O files/overture/ip_network_primary_sample6
cat files/overture/ip_network_primary_sample6 >> files/overture/ip_network_primary_sample
rm files/overture/ip_network_primary_sample6
wget https://raw.githubusercontent.com/pexcn/daily/gh-pages/gfwlist/gfwlist.txt -nv -O files/overture/domain_alternative_sample
wget https://raw.githubusercontent.com/pexcn/daily/gh-pages/chinalist/chinalist.txt -nv -O files/overture/domain_primary_sample
