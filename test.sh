#!/usr/bin/env bash

iptables -t nat -A PREROUTING -p tcp --dport $2 -j DNAT --to-destination $1:$2
iptables -t nat -A PREROUTING -p udp --dport $2 -j DNAT --to-destination $1:$2
iptables -t filter -A INPUT -p tcp -d $1 --dport $2 -j ACCEPT
iptables -t filter -A INPUT -p udp -d $1 --dport $2 -j ACCEPT

echo "Port foward: Sucess"
