From: Yan Seiner <yan@seiner.com>
Subject: quota sometimes doesn't work
Date: Sat, 23 May 2015 04:52:39 -0700
Message-ID: <55606A07.2040208@seiner.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I'm trying to track down a problem in my ipchains rules.  I use a quota 
for some MACs.

When someone connects on the guest network, dnsmasq adds the following 
rules:

# first allow outbound connections for this MAC
                 iptables -A FORWARD -i $guest_if -o $outside_if -m mac 
--mac-source $mac -m quota --quota $quota -j ACCEPT
# now limit inbound quota
                 iptables -A FORWARD -i $outside_if -o $guest_if -d $ip 
-m state --state ESTABLISHED,RELATED -m quota --quota $quota -j ACCEPT

This works - sometimes.  At other times, users can download past the quota.

I've tried to test this but the quota always works for me, even if I 
disconnect and reconnect.  I'm not sure why or how these users are 
bypassing the quota.

Chain FORWARD (policy DROP 1130 packets, 267K bytes)
  pkts bytes target     prot opt in     out     source destination
....

  156K   13M ACCEPT     all  --  eth1.5 eth0    anywhere 
anywhere             MAC A4:67:06:53:1B:47 quota: 52428800 bytes
  134K  212M ACCEPT     all  --  eth0   eth1.5  anywhere 
192.168.5.177        state RELATED,ESTABLISHED quota: 52428800 bytes

38440 3688K ACCEPT     all  --  eth1.5 eth0    anywhere 
anywhere             MAC 30:F7:C5:C5:51:85 quota: 52428800 bytes
40151   67M ACCEPT     all  --  eth0   eth1.5  anywhere 
Captain-161.guest.lan  state RELATED,ESTABLISHED quota: 52428800 bytes

54671 4106K ACCEPT     all  --  eth1.5 eth0    anywhere 
anywhere             MAC F4:09:D8:80:11:5E quota: 52428800 bytes
65041  105M ACCEPT     all  --  eth0   eth1.5  anywhere 
192.168.5.152        state RELATED,ESTABLISHED quota: 52428800 bytes

50758   60M ACCEPT     all  --  eth1.5 eth0    anywhere 
anywhere             MAC 78:31:C1:14:3D:41 quota: 52428800 bytes
30650 4291K ACCEPT     all  --  eth0   eth1.5  anywhere 
iPhone.guest.lan     state RELATED,ESTABLISHED quota: 52428800 bytes

My entire firewall followed by the dnsmasq script that adds the quota 
rules per user

# set up our interfaces
# eth0 is for outgoing throttling
# eth1 is for inbound throttling
# this works even though we have vlans on eth1
# we don't want to use the vlan interfaces as we lose the ability to 
share bandwidth
# each nterface should have 3 classes, one for each network/vlan

bandwidth_down=10000
bandwidth_up=10000
auth_down=$(( $bandwidth_down / 2 ))
auth_up=$(( $bandwidth_up / 2 ))
tenant_down=$(( $bandwidth_down / 4 ))
tenant_up=$(( $bandwidth_up / 4 ))
guest_down=$(( $bandwidth_down / 8 ))
guest_up=$(( $bandwidth_up / 8 ))

# Subnets and interfaces
# dmz provides servers from outside
# only auth network is allowed access to the dmz from the inside

dmz='192.168.3.0/24'
dmz_ip='192.168.3.1'
dmz_if='eth2'

# auth network
# has access to dmz, outside, and firewall

auth='192.168.4.0/24'
auth_ip='192.168.4.1'
auth_if='eth1.4'

# guest network
# has no access to dmz, other networks, or anyone else in the guest network
# has limited download bandwidth

guest='192.168.5.0/24'
guest_ip='192.168.5.1'
guest_if='eth1.5'

# tenant network
# has access to outside and others on same network but not dmz or firewall

tenant='192.168.6.0/24'
tenant_ip='192.168.6.1'
tenant_if='eth1.6'

outside='!192.168.0.0/16'
outside_if='eth0'

inside_if='eth1'

server_mail="192.168.3.2"
server_http="192.168.3.2"
server_vpn="192.168.3.2"
server_rsync="192.168.3.2"
server_ssh="192.168.3.2"
server_japan="192.168.3.2"

# delete and flush all existing rules

iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -t mangle -X
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# delete all qdisc

tc qdisc del root dev ${outside_if}
tc qdisc del root dev ${inside_if}

# always accept loopback traffic

iptables -A INPUT -i lo -j ACCEPT

# set up for qdisc

# mark our packets
# we use the FORWARD chain so we have access to both inbound and 
outbound info for the packet
# we must restore the connection mark before NAT
# and set it when the packet is all the way through

iptables -t mangle -A PREROUTING -j CONNMARK --restore-mark
iptables -t mangle -A FORWARD -s $auth -o ${outside_if} -j MARK 
--set-mark 0x04
iptables -t mangle -A FORWARD -s $guest -o ${outside_if} -j MARK 
--set-mark 0x05
iptables -t mangle -A FORWARD -s $tenant -o ${outside_if} -j MARK 
--set-mark 0x06
iptables -t mangle -A POSTROUTING -j CONNMARK --save-mark

# HTB classes on interfaces with rate limiting
# we limit uploads on the common outside interface

tc qdisc add dev ${outside_if} root handle 1: htb default 30
tc class add dev ${outside_if} parent 1: classid 1:1 htb rate 
${bandwidth_up}kbit
tc class add dev ${outside_if} parent 1:1 classid 1:14 htb rate 
${auth_up}kbit ceil ${bandwidth_up}kbit
tc class add dev ${outside_if} parent 1:1 classid 1:15 htb rate 
${guest_up}kbit ceil ${bandwidth_up}kbit
tc class add dev ${outside_if} parent 1:1 classid 1:16 htb rate 
${tenant_up}kbit ceil ${bandwidth_up}kbit

tc filter add dev ${outside_if} parent 1:0 protocol ip handle 0x04 fw 
flowid 1:14
tc filter add dev ${outside_if} parent 1:0 protocol ip handle 0x05 fw 
flowid 1:15
tc filter add dev ${outside_if} parent 1:0 protocol ip handle 0x06 fw 
flowid 1:16

# for downloads we limit on common inside interface, the one with the vlans

tc qdisc add dev ${inside_if} root handle 1: htb default 30
tc class add dev ${inside_if} parent 1: classid 1:1 htb rate 
${bandwidth_down}kbit
tc class add dev ${inside_if} parent 1:1 classid 1:14 htb rate 
${auth_down}kbit ceil ${bandwidth_down}kbit
tc class add dev ${inside_if} parent 1:1 classid 1:15 htb rate 
${guest_down}kbit ceil ${bandwidth_down}kbit
tc class add dev ${inside_if} parent 1:1 classid 1:16 htb rate 
${tenant_down}kbit ceil ${bandwidth_down}kbit

tc filter add dev ${inside_if} parent 1:0 protocol ip handle 0x04 fw 
flowid 1:14
tc filter add dev ${inside_if} parent 1:0 protocol ip handle 0x05 fw 
flowid 1:15
tc filter add dev ${inside_if} parent 1:0 protocol ip handle 0x06 fw 
flowid 1:16

# general rules


iptables -t nat -A POSTROUTING -o $outside_if -j MASQUERADE

# allow unlmited return connections to the firewall
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Since we're limiting what guests can do, we only allow forwarding for 
auth and tenant
# guest is handled by a dnsmasq script with quotas
iptables -A FORWARD -i $outside_if -o $auth_if -m state --state 
ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i $outside_if -o $tenant_if -m state --state 
ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i $auth_if -o $outside_if -j ACCEPT
iptables -A FORWARD -i $tenant_if -o $outside_if -j ACCEPT

# allow access to DMZ only from our authorized network

iptables -A FORWARD -i $auth_if -o $dmz_if -j ACCEPT

# allow access to the router/firewall only from authorized network

iptables -A INPUT -s $auth -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -s $auth -p tcp --dport 443 -j ACCEPT

# everyone has access to the proxy

iptables -A INPUT -s $auth -p tcp --dport 3128 -j ACCEPT
iptables -A INPUT -s $guest -p tcp --dport 3128 -j ACCEPT
iptables -A INPUT -s $tenant -p tcp --dport 3128 -j ACCEPT

# allow dhcp traffic

iptables -A INPUT -i $auth_if -p udp --dport 67:68 -j ACCEPT
iptables -A INPUT -i $guest_if -p udp --dport 67:68 -j ACCEPT
iptables -A INPUT -i $tenant_if -p udp --dport 67:68 -j ACCEPT

# allow dns traffic

iptables -A INPUT -i $auth_if -p udp --dport 53 -j ACCEPT
iptables -A INPUT -i $auth_if -p tcp --dport 53 -j ACCEPT
iptables -A INPUT -i $guest_if -p udp --dport 53 -j ACCEPT
iptables -A INPUT -i $guest_if -p tcp --dport 53 -j ACCEPT
iptables -A INPUT -i $tenant_if -p udp --dport 53 -j ACCEPT
iptables -A INPUT -i $tenant_if -p tcp --dport 53 -j ACCEPT
iptables -A INPUT -i $dmz_if -p udp --dport 53 -j ACCEPT
iptables -A INPUT -i $dmz_if -p tcp --dport 53 -j ACCEPT

# allow access to the firewall from the outside with ssh
# TAKE THIS DOWN
# BEFORE WE GO LIVE

iptables -A INPUT -i $outside_if -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -i $outside_if -p tcp --dport 80 -j ACCEPT

# drop any traffic from unauthorized interfaces
# unless it's headed outside
# unnecessary as long as the default policy is DROP or REJECT
# iptables -A FORWARD -i $tenant_if -o !$outside_if -j DROP
# iptables -A FORWARD -i $guest_if -o !$outside_if -j DROP

# now dmz forwarding rules from the outside

# www
for p in 80 443 ; do
         iptables -t nat -A PREROUTING -i $outside_if -p tcp --dport $p 
-j DNAT --to $server_http:$p
         iptables -A FORWARD -i $outside_if -o $dmz_if -d $server_http 
-p tcp --dport $p -j ACCEPT
         done

# openvpn
iptables -t nat -A PREROUTING -i $outside_if -p udp -m multiport 
--dports 1194,80,81,8080,33434 -j DNAT --to $server_vpn:1194
iptables -A FORWARD -i $outside_if -o $dmz_if -p udp --dport 1194 -j ACCEPT

# mail
# for p in 993 465 587 25 ; do
#       iptables -t nat -A PREROUTING -i $outside_if -p tcp --dport $p 
-j DNAT --to $server_mail:$p
#       iptables -A FORWARD -i $outside_if -o $dmz_if -d $server_mail -p 
tcp --dport $p -j ACCEPT
#       done
# japan
for p in 8001 8002 8003 8004 ; do
         iptables -t nat -A PREROUTING -i $outside_if -p tcp --dport $p 
-j DNAT --to $server_japan:$p
         iptables -A FORWARD -i $outside_if -o $dmz_if -d $server_japan 
-p tcp --dport $p -j ACCEPT
         done

# rsync
iptables -t nat -A PREROUTING -i $outside_if -p tcp --dport 873 -j DNAT 
--to $server_rsync:873
iptables -A FORWARD -i $outside_if -o $dmz_if -d  $server_rsync -p tcp 
--dport 873 -j ACCEPT

# ssh
# ENABLE THIS BEFORE WE GO LIVE
# iptables -t nat -A PREROUTING -i $outside_if -p tcp --dport 22 -j DNAT 
--to $server_ssh:22
# iptables -A FORWARD -i $outside_if -o $dmz_if -d $server_ssh -p tcp 
--dport 22 -j ACCEPT

*******************************************
dnsmasq script run every time a guest connects

#!/bin/sh

guest_if=eth1.5
outside_if=eth0

interval=1
quota=52428800

# DO NOT hande 'del' events.  We don't want to delete these rules as 
that resets the counter.
# Fflush the rules at midnight.

case "$1" in
         'add' )
                 echo $DNSMASQ_TAGS | grep 'guest' || exit
                 mac=$2
                 iptables -L FORWARD -v | grep -i $mac && exit
                 ip=$3
#               starttime=`date -u +%H:%M`
#               stoptime=$(( ( `date -u +%H ` + $interval ) % 24 
)):`date +%M`
#               iptables -A FORWARD -i $guest_if -o $outside_if -m mac 
--mac-source $mac -m time --timestart $starttime --timestop $stoptime -j 
ACCEPT
#
# we want to limit incoming data; we don't care how much they send out 
as it's typically much less
# this should limit guests to 50MB down every 12 hours

# first allow outbound connections for this MAC
                 iptables -A FORWARD -i $guest_if -o $outside_if -m mac 
--mac-source $mac -m quota --quota $quota -j ACCEPT
# now limit inbound quota
                 iptables -A FORWARD -i $outside_if -o $guest_if -d $ip 
-m state --state ESTABLISHED,RELATED -m quota --quota $quota -j ACCEPT

         ;;
         esac

