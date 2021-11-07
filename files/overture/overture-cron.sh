#!/bin/sh -e
cd "$(dirname "$0")"
set -o pipefail

wget https://ispip.clang.cn/all_cn.txt -O ip_network_primary
wget https://ispip.clang.cn/all_cn_ipv6.txt -O ip_network_primary6
cat ip_network_primary6 >> ip_network_primary
rm ip_network_primary6
wget https://raw.githubusercontent.com/pexcn/daily/gh-pages/gfwlist/gfwlist.txt -O domain_alternative
wget https://raw.githubusercontent.com/pexcn/daily/gh-pages/chinalist/chinalist.txt -O domain_primary
