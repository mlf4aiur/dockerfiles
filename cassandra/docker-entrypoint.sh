#!/bin/bash
set -e

# ip=$(ip addr show eth0 | awk '{if ($1 == "inet") {ip=$2; sub("/.*", "", ip); print ip; exit}}')
ip=$(hostname -I | sed 's/ //g')

[ "${SEED_IP}" == "127.0.0.1" ] && SEED_IP=${ip}

sed -i \
    -e "s/^listen_address:.*/listen_address: ${ip}/" \
    -e 's/^rpc_address:.*/rpc_address: 0.0.0.0/' \
    -e "s/# broadcast_rpc_address:.*/broadcast_rpc_address: ${ip}/" \
    -e "s/\(.* - seeds: \).*/\1\"${SEED_IP}\"/" \
    /etc/cassandra/cassandra.yaml

exec "$@"
