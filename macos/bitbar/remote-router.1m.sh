#!/usr/bin/env bash
export PATH=/usr/local/bin:$PATH
ssh voyager hostname
echo '---'
echo 'HDCP'
ssh voyager cat /var/lib/misc/dnsmasq.leases | sed -e 's/^/--/'
echo 'Current proxy'
name=$(curl -s -H 'Authorization: Bearer little@pple' http://10.0.0.1:9090/proxies | jq -r '.proxies["@Auto HK"].now')
delay=$(curl -s -H 'Authorization: Bearer little@pple' http://10.0.0.1:9090/proxies | jq -r ".proxies[\"${name}\"].history[0].delay")
echo "--${name}"
echo "--${delay} ms"
echo 'Clash logs'
ssh voyager journalctl -rn 30 --no-hostname -u clash | sed -e 's/^/--/'
echo 'uptime'
ssh voyager uptime | sed -e 's/^/--/'
echo 'Network interfaces'
ssh voyager ip addr | sed -e 's/^/--/' | sed -e 's/$/|trim=false/'
echo 'Iptables NAT'
ssh voyager iptables -nv -t nat -L | sed -e 's/^/--/' | sed -e 's/$/|trim=false/'
echo 'networkctl'
ssh voyager networkctl | sed -e 's/^/--/' | sed -e 's/$/|trim=false/'
