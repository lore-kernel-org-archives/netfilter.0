From: Jeremy Jones <jeremy@samnjack.com>
Subject: iptables rules to allow ipv6 tunnel?
Date: Fri, 07 Nov 2003 08:59:40 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1068220779.12484.5.camel@jccn-crux-linux.djc.state.id.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi folks,

Wondering if anyone around here could shed some light on what my
firewall's problem might be.  Here's the deal:  I have a dsl connection
coming into my box on eth3, with eth0 connected to my dmz.  I have a /29
block of addresses to use, so I bridge interfaces eth0 and eth3. 
Interface eth1 is connected to my home LAN.  If you were wondering where
eth2 went, it's just snorting.  Aside from this, I have an ipv6 sit
tunnel, using the local ipv4 address of br0 (the bridge interface), and
a remote of 200.1.1.1.  But for the life of me, I can't get any ipv6
traffic through.  Well, at least I can't get icmpv6 through, and I'm a
little baffled by that.  I've put rules at the beginning of my iptables
ruleset that should let through any of the necessary stuff to and from
the tunnel broker, but my ping6 never gets an answer, although the
firewall logs tell me that traffic IS going in and out to and from the
tunnel endpoint.

So here's my rules, my network startup script, and my firewall logs
while ping6ing the ipv6 address of the tunnel endpoint.

Thanks everyone,

Jeremy Jones


*******************************************

#!/bin/sh
#
# /etc/rc.d/iptables: start/stop iptables filtering & nat
#

# temporarily disable ipv4 forwarding
#
echo 0 > /proc/sys/net/ipv4/ip_forward

# export variables
#
export HOME_LAN=10.1.1.0/24
export HOME_PHYS_IF=eth1
export HOME_IF_ADDR=10.1.1.1
export DMZ_LAN=100.1.1.0/29
export DMZ_PHYS_IF=eth0
export INET_PHYS_IF=eth3
export INET_BRIDGE_IF=br0
export INET_BRIDGE_IF_ADDR=100.1.1.1
export SIT_IF=six0
export SIT_TUN_ENDPOINT=200.1.1.1
export DNS_SERVER=100.1.1.3
export SDNS_SERVER=100.1.1.4
export FTP_SERVER=100.1.1.3
export WWW_SERVER=100.1.1.3
export SMTP_SERVER=100.1.1.4
export IMAP_SERVER=100.1.1.4
export LDAP_SERVER=100.1.1.4
export H323_SERVER=100.1.1.5
export SIP_SERVER=100.1.1.5
export MGCP_SERVER=100.1.1.5

# flush all existing chains, delete user defined chains, and zero
counters
#
iptables -F
iptables -t nat -F
iptables -X
iptables -t nat -X
iptables -Z
iptables -t nat -Z

# set default policies to drop everything
#
iptables -P FORWARD DROP
iptables -P INPUT DROP
iptables -P OUTPUT DROP

# lets get the tunnel fixed right here...
#
iptables -N ipv6_tunnel
iptables -A ipv6_tunnel -j LOG --log-prefix "IPv6 Tunnel Traffic?  "
iptables -A ipv6_tunnel -j ACCEPT
iptables -A INPUT -s $SIT_TUN_ENDPOINT -j ipv6_tunnel
iptables -A OUTPUT -d $SIT_TUN_ENDPOINT -j ipv6_tunnel
iptables -A FORWARD -d $SIT_TUN_ENDPOINT -j LOG --log-prefix "Why
forward?  "
iptables -A FORWARD -d $SIT_TUN_ENDPOINT -j ACCEPT
iptables -A FORWARD -s $SIT_TUN_ENDPOINT -j LOG --log-prefix "Why
forward?  "
iptables -A FORWARD -s $SIT_TUN_ENDPOINT -j ACCEPT

# log and drop chain
#
iptables -N logdrop
iptables -A logdrop -j LOG --log-prefix "Something not right  "
iptables -A logdrop -j DROP

# deny spoofing on all interfaces
...
(are the rules relevant past here?  Everything should be caught up
above, right?)


********************************************************************************
#!/bin/sh
#
# /etc/rc.d/net: start/stop network
#

if [ "$1" = "start" ]; then
        ip link set eth0 up
        ip link set eth3 up
        brctl addbr br0
        brctl addif br0 eth0
        brctl addif br0 eth3
        ip link set br0 up
        ip addr add 100.1.1.1/29 dev br0
        ip route add 0/0 via 100.1.1.2 dev br0
        ip tunnel add six0 mode sit remote 200.1.1.1 local 100.1.1.1 ttl
255
        ip link set six0 up
        ip addr add 2001:0123:4567:89ab::123f/127 dev six0
        ip route add ::/0 dev six0
        ip addr add 2001:fedc:ba09:8765:1::1/96 dev eth0
        ip link set eth1 up
        ip addr add 10.10.10.1/24 dev eth1
        ip addr add 2001:fedc:ba09:8765:2::1/96 dev eth1
elif [ "$1" = "stop" ]; then
        ip addr del 2001:fedc:ba09:8765:2::1/96 dev eth1
        ip addr del 10.10.10.1/24 dev eth1
        ip link set eth1 down
        ip addr del 2001:fedc:ba09:8765:1::1/96 dev eth0
        ip route del ::/0 dev six0
        ip addr del 2001:0123:4567:89ab::123f/127 dev six0
        ip link set six0 down
        ip tunnel del six0
        ip route del 0/0 via 100.1.1.2 dev br0
        ip addr del 100.1.1.1/29 dev br0
        ip link set br0 down
        brctl delif br0 eth3
        brctl delif br0 eth0
        brctl delbr br0
        ip link set eth3 down
        ip link set eth0 down
else
        echo "usage: $0 start|stop"
fi

# End of file
**********************************************************************************

Nov  7 09:30:00 gw kernel: IPv6 Tunnel Traffic?  IN= OUT=br0
PHYSOUT=eth0 SRC=100.1.1.1 DST=200.1.1.1 LEN=124 TOS=0x00 PREC=0x00
TTL=255 ID=0 DF PROTO=41
Nov  7 09:30:00 gw kernel: IPv6 Tunnel Traffic?  IN=br0 OUT= PHYSIN=eth0
MAC=00:11:22:33:44:55:66:77:88:99:aa:bb:cc:dd SRC=200.1.1.1
DST=100.1.1.1 LEN=124 TOS=0x00 PREC=0x00 TTL=242 ID=803 PROTO=41
Nov  7 09:30:00 gw kernel: Why forward?  IN=br0 OUT=br0 PHYSIN=eth0
PHYSOUT=eth0 SRC=100.1.1.1 DST=200.1.1.1 LEN=124 TOS=0x00 PREC=0x00
TTL=255 ID=0 DF PROTO=41
Nov  7 09:30:00 gw kernel: Something not right  IN=br0 OUT=br0
PHYSIN=eth0 PHYSOUT=eth3 SRC=200.1.2.3 DST=224.0.0.10 LEN=60 TOS=0x00
PREC=0xC0 TTL=2 ID=0 PROTO=88
Nov  7 09:30:01 gw kernel: IPv6 Tunnel Traffic?  IN= OUT=br0
PHYSOUT=eth0 SRC=100.1.1.1 DST=200.1.1.1 LEN=124 TOS=0x00 PREC=0x00
TTL=255 ID=0 DF PROTO=41
Nov  7 09:30:01 gw kernel: IPv6 Tunnel Traffic?  IN=br0 OUT= PHYSIN=eth0
MAC=00:11:22:33:44:55:66:77:88:99:aa:bb:cc:dd SRC=200.1.1.1
DST=100.1.1.1 LEN=124 TOS=0x00 PREC=0x00 TTL=242 ID=804 PROTO=41
Nov  7 09:30:01 gw kernel: Why forward?  IN=br0 OUT=br0 PHYSIN=eth0
PHYSOUT=eth0 SRC=100.1.1.1 DST=200.1.1.1 LEN=124 TOS=0x00 PREC=0x00
TTL=255 ID=0 DF PROTO=41
Nov  7 09:30:02 gw kernel: IPv6 Tunnel Traffic?  IN= OUT=br0
PHYSOUT=eth0 SRC=100.1.1.1 DST=200.1.1.1 LEN=124 TOS=0x00 PREC=0x00
TTL=255 ID=0 DF PROTO=41
Nov  7 09:30:02 gw kernel: IPv6 Tunnel Traffic?  IN=br0 OUT= PHYSIN=eth0
MAC=00:11:22:33:44:55:66:77:88:99:aa:bb:cc:dd SRC=200.1.1.1
DST=100.1.1.1 LEN=124 TOS=0x00 PREC=0x00 TTL=242 ID=805 PROTO=41
Nov  7 09:30:02 gw kernel: Why forward?  IN=br0 OUT=br0 PHYSIN=eth0
PHYSOUT=eth0 SRC=100.1.1.1 DST=200.1.1.1 LEN=124 TOS=0x00 PREC=0x00
TTL=255 ID=0 DF PROTO=41
Nov  7 09:30:03 gw kernel: IPv6 Tunnel Traffic?  IN= OUT=br0
PHYSOUT=eth0 SRC=100.1.1.1 DST=200.1.1.1 LEN=124 TOS=0x00 PREC=0x00
TTL=255 ID=0 DF PROTO=41
Nov  7 09:30:03 gw kernel: IPv6 Tunnel Traffic?  IN=br0 OUT= PHYSIN=eth0
MAC=00:11:22:33:44:55:66:77:88:99:aa:bb:cc:dd SRC=200.1.1.1
DST=100.1.1.1 LEN=124 TOS=0x00 PREC=0x00 TTL=242 ID=806 PROTO=41
Nov  7 09:30:03 gw kernel: Why forward?  IN=br0 OUT=br0 PHYSIN=eth0
PHYSOUT=eth0 SRC=100.1.1.1 DST=200.1.1.1 LEN=124 TOS=0x00 PREC=0x00
TTL=255 ID=0 DF PROTO=41
Nov  7 09:30:03 gw kernel: NET: 1 messages suppressed.
Nov  7 09:30:03 gw kernel: icmpv6_send: no reply to icmp error
Nov  7 09:30:04 gw kernel: IPv6 Tunnel Traffic?  IN= OUT=br0
PHYSOUT=eth0 SRC=100.1.1.1 DST=200.1.1.1 LEN=124 TOS=0x00 PREC=0x00
TTL=255 ID=0 DF PROTO=41
Nov  7 09:30:04 gw kernel: IPv6 Tunnel Traffic?  IN=br0 OUT= PHYSIN=eth0
MAC=00:11:22:33:44:55:66:77:88:99:aa:bb:cc:dd SRC=200.1.1.1
DST=100.1.1.1 LEN=124 TOS=0x00 PREC=0x00 TTL=242 ID=807 PROTO=41
Nov  7 09:30:04 gw kernel: Why forward?  IN=br0 OUT=br0 PHYSIN=eth0
PHYSOUT=eth0 SRC=100.1.1.1 DST=200.1.1.1 LEN=124 TOS=0x00 PREC=0x00
TTL=255 ID=0 DF PROTO=41
Nov  7 09:30:05 gw kernel: IPv6 Tunnel Traffic?  IN= OUT=br0
PHYSOUT=eth0 SRC=100.1.1.1 DST=200.1.1.1 LEN=124 TOS=0x00 PREC=0x00
TTL=255 ID=0 DF PROTO=41
Nov  7 09:30:05 gw kernel: IPv6 Tunnel Traffic?  IN=br0 OUT= PHYSIN=eth0
MAC=00:11:22:33:44:55:66:77:88:99:aa:bb:cc:dd SRC=200.1.1.1
DST=100.1.1.1 LEN=124 TOS=0x00 PREC=0x00 TTL=242 ID=808 PROTO=41
Nov  7 09:30:05 gw kernel: Why forward?  IN=br0 OUT=br0 PHYSIN=eth0
PHYSOUT=eth0 SRC=100.1.1.1 DST=200.1.1.1 LEN=124 TOS=0x00 PREC=0x00
TTL=255 ID=0 DF PROTO=41
Nov  7 09:30:05 gw kernel: Something not right  IN=br0 OUT=br0
PHYSIN=eth0 PHYSOUT=eth3 SRC=200.1.2.3 DST=224.0.0.10 LEN=60 TOS=0x00
PREC=0xC0 TTL=2 ID=0 PROTO=88
Nov  7 09:30:06 gw kernel: IPv6 Tunnel Traffic?  IN= OUT=br0
PHYSOUT=eth0 SRC=100.1.1.1 DST=200.1.1.1 LEN=124 TOS=0x00 PREC=0x00
TTL=255 ID=0 DF PROTO=41
Nov  7 09:30:06 gw kernel: IPv6 Tunnel Traffic?  IN=br0 OUT= PHYSIN=eth0
MAC=00:11:22:33:44:55:66:77:88:99:aa:bb:cc:dd SRC=200.1.1.1
DST=100.1.1.1 LEN=124 TOS=0x00 PREC=0x00 TTL=242 ID=809 PROTO=41
Nov  7 09:30:06 gw kernel: Why forward?  IN=br0 OUT=br0 PHYSIN=eth0
PHYSOUT=eth0 SRC=100.1.1.1 DST=200.1.1.1 LEN=124 TOS=0x00 PREC=0x00
TTL=255 ID=0 DF PROTO=41
Nov  7 09:30:07 gw kernel: IPv6 Tunnel Traffic?  IN= OUT=br0
PHYSOUT=eth0 SRC=100.1.1.1 DST=200.1.1.1 LEN=124 TOS=0x00 PREC=0x00
TTL=255 ID=0 DF PROTO=41
Nov  7 09:30:07 gw kernel: IPv6 Tunnel Traffic?  IN=br0 OUT= PHYSIN=eth0
MAC=00:11:22:33:44:55:66:77:88:99:aa:bb:cc:dd SRC=200.1.1.1
DST=100.1.1.1 LEN=124 TOS=0x00 PREC=0x00 TTL=242 ID=810 PROTO=41
Nov  7 09:30:07 gw kernel: Why forward?  IN=br0 OUT=br0 PHYSIN=eth0
PHYSOUT=eth0 SRC=100.1.1.1 DST=200.1.1.1 LEN=124 TOS=0x00 PREC=0x00
TTL=255 ID=0 DF PROTO=41
Nov  7 09:30:08 gw kernel: IPv6 Tunnel Traffic?  IN= OUT=br0
PHYSOUT=eth0 SRC=100.1.1.1 DST=200.1.1.1 LEN=124 TOS=0x00 PREC=0x00
TTL=255 ID=0 DF PROTO=41
Nov  7 09:30:08 gw kernel: IPv6 Tunnel Traffic?  IN=br0 OUT= PHYSIN=eth0
MAC=00:11:22:33:44:55:66:77:88:99:aa:bb:cc:dd SRC=200.1.1.1
DST=100.1.1.1 LEN=124 TOS=0x00 PREC=0x00 TTL=242 ID=811 PROTO=41
Nov  7 09:30:08 gw kernel: Why forward?  IN=br0 OUT=br0 PHYSIN=eth0
PHYSOUT=eth0 SRC=100.1.1.1 DST=200.1.1.1 LEN=124 TOS=0x00 PREC=0x00
TTL=255 ID=0 DF PROTO=41
Nov  7 09:30:09 gw kernel: IPv6 Tunnel Traffic?  IN= OUT=br0
PHYSOUT=eth0 SRC=100.1.1.1 DST=200.1.1.1 LEN=124 TOS=0x00 PREC=0x00
TTL=255 ID=0 DF PROTO=41
Nov  7 09:30:09 gw kernel: IPv6 Tunnel Traffic?  IN=br0 OUT= PHYSIN=eth0
MAC=00:11:22:33:44:55:66:77:88:99:aa:bb:cc:dd SRC=200.1.1.1
DST=100.1.1.1 LEN=124 TOS=0x00 PREC=0x00 TTL=242 ID=812 PROTO=41
Nov  7 09:30:09 gw kernel: Why forward?  IN=br0 OUT=br0 PHYSIN=eth0
PHYSOUT=eth0 SRC=100.1.1.1 DST=200.1.1.1 LEN=124 TOS=0x00 PREC=0x00
TTL=255 ID=0 DF PROTO=41
Nov  7 09:30:09 gw kernel: NET: 3 messages suppressed.
Nov  7 09:30:09 gw kernel: icmpv6_send: no reply to icmp error
Nov  7 09:30:10 gw kernel: Something not right  IN=br0 OUT=br0
PHYSIN=eth0 PHYSOUT=eth3 SRC=200.1.2.3 DST=224.0.0.10 LEN=60 TOS=0x00
PREC=0xC0 TTL=2 ID=0 PROTO=88
Nov  7 09:30:10 gw kernel: IPv6 Tunnel Traffic?  IN= OUT=br0
PHYSOUT=eth0 SRC=100.1.1.1 DST=200.1.1.1 LEN=124 TOS=0x00 PREC=0x00
TTL=255 ID=0 DF PROTO=41
Nov  7 09:30:10 gw kernel: IPv6 Tunnel Traffic?  IN=br0 OUT= PHYSIN=eth0
MAC=00:11:22:33:44:55:66:77:88:99:aa:bb:cc:dd SRC=200.1.1.1
DST=100.1.1.1 LEN=124 TOS=0x00 PREC=0x00 TTL=242 ID=813 PROTO=41
Nov  7 09:30:10 gw kernel: Why forward?  IN=br0 OUT=br0 PHYSIN=eth0
PHYSOUT=eth0 SRC=100.1.1.1 DST=200.1.1.1 LEN=124 TOS=0x00 PREC=0x00
TTL=255 ID=0 DF PROTO=41
Nov  7 09:30:11 gw kernel: IPv6 Tunnel Traffic?  IN= OUT=br0
PHYSOUT=eth0 SRC=100.1.1.1 DST=200.1.1.1 LEN=124 TOS=0x00 PREC=0x00
TTL=255 ID=0 DF PROTO=41
Nov  7 09:30:11 gw kernel: IPv6 Tunnel Traffic?  IN=br0 OUT= PHYSIN=eth0
MAC=00:11:22:33:44:55:66:77:88:99:aa:bb:cc:dd SRC=200.1.1.1
DST=100.1.1.1 LEN=124 TOS=0x00 PREC=0x00 TTL=242 ID=814 PROTO=41
Nov  7 09:30:11 gw kernel: Why forward?  IN=br0 OUT=br0 PHYSIN=eth0
PHYSOUT=eth0 SRC=100.1.1.1 DST=200.1.1.1 LEN=124 TOS=0x00 PREC=0x00
TTL=255 ID=0 DF PROTO=41



