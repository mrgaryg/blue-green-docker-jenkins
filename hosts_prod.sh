#!/bin/bash

cat <<EOF
[swarm]
10.100.192.200 swarm_master=true consul_extra="-server -bootstrap -ui-dir /ui" docker_cfg=docker-swarm-master.service
10.100.192.20[1:2] swarm_master_ip=10.100.192.200 consul_extra="-join 10.100.192.200" consul_server_ip=10.100.192.200 docker_cfg=docker-swarm-node.service

[jenkins]
10.100.192.200

[lb]
10.100.192.200
EOF
