From: Karol Tomala <ktomala@tgc.pl>
Subject: Serious NAT problem
Date: Mon, 29 Mar 2004 21:51:09 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1080589869.2754.152.camel@wolverine.waw.tgc.pl>
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

Hello!
I have a question regarding netfilter. I have been looking for an answer
for two days and I'm hopeless. That's why I have decided to ask for help
here.

I have a Mandrake Linux 9.2.1 internal router acting as a
natbox/firewall. It has three NIC's:
eth0 -> x.y.z.x (DMZ interface) [Doesn't matter for this issue]
eth1 -> 172.18.12.0/255.255.252.0 (LAN interface)
eth2 -> 10.128.2.64/255.255.255.224 (Client network)

Here's a liitle graph showing the connections:

[ Cisco 1700 ]        [ NATBOX/FIREWALL ]  
[ 10.128.2.65 ] <---> { eth2 }   { eth1 } <---> { LAN: 172.18.12.0 }

Eth2 interface has IP number 10.128.2.66.
Eth1 interface has IP number 172.18.15.125.

I want to connect client's Cisco 1700 router via eth2 network. However I
don't want a 1:1 NAT. I would like to NAT a few hosts from 172.18.
network to 10.128.2. so client could easily connect to some of our
servers without having access to the rest of our LAN. 

I have a host 172.18.5.2 that should be NAT'ed to 10.128.2.70. All
traffic going to 10.128.2.70 should reach 172.18.5.2 transparently.

I have been trying to configure NAT without much success. 

This is a part of my configuration:

### Netfilter
echo 1 > /proc/sys/net/ipv4/ip_forward
echo 0 > /proc/sys/net/ipv4/icmp_echo_ignore_all

# Add route to 172.18.5.0/29 network
ip route add 172.18.5.0/29 gw 172.18.15.254 dev eth1

# Only for testing, will be changed when NAT works
iptables -t filter -P INPUT ACCEPT
iptables -t filter -P OUTPUT ACCEPT
iptables -t filter -P FORWARD ACCEPT

# NAT
iptables -t nat -A POSTROUTING -o eth2 -s 172.18.5.2 -j SNAT --to-source
10.128.2.70
iptables -t nat -A PREROUTING -i eth2 -d 10.128.2.70 -j DNAT
--to-destination 172.18.5.2

[cut]

Unfortunatelly it's not working. I have lost two days on it, browsing
through google and found nothing much helpful.

I would like to achieve exactly the same as you can do in Cisco IOS with
issuing command:
ip nat inside static host 172.18.5.2 host 10.128.2.70

I don't want to assign VLAN on my eth2 NIC with IP 10.128.2.70. (Reason
for this is that NATBOX is acting as a firewall/natbox/vpn router and I
would have to assign thousands of VLANs on my NICs). I would like the
host 172.18.5.2 to be seen as 10.128.2.70 in the client's network. 

I can ping the Cisco router on 10.128.2.65 from 10.128.2.66 via eth2. I
can ping 172.18.5.2 from 172.18.15.125 via eth1. Unfortunatelly NAT is
not working. Pinging 10.128.2.70 from eth2 gives Destination Host
Unreachable. tcpdump -i eth2 gives "arp who-has 10.128.2.70 tell
10.128.2.66". Nothing else happens. I cannot telnet to 10.128.2.70, but
I can telnet to it by 172.18.5.2 IP number. 

What am I doing wrong? Please help me. I'm hopeless and don't know what
to do. :(

Greetings
-- 
Karol Tomala



