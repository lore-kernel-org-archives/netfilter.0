From: "Simone" <simone.sanna@trslab.it>
Subject: firewall/gateway
Date: Mon, 8 Jul 2002 14:07:40 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <003e01c22678$0f048280$3601a8c0@Sanna>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org


Hi guys,
I have a question for you.

Please, could you help me??? :-)

I have two net with this ip-address 192.168.2.x/24 and 192.168.3.x/24
They  must be mapped with ip-address 172.26.103.x/24 and 172.26.104.x/24
within a firewall/gateway.

Example :
a packet forwarded to 172.26.103.25 must be delivered thru the firewall 
to 192.168.2.25

I must develop firewall policy too.

Only the antivirus server (172.26.100.18) can contact 172.26.103.x 
(mapped on 192.168.2.x) and 172.26.104.x (mapped on 192.168.3.x).

Only the net 192.168.2.x and 192.168.3.x must contact the license server
(172.25.7.27, it work on port 27000)

The firewall pc have three ethernet cards,eth0 configured as
172.26.100.19,eth1 as 192.168.2.11, eth2 as 192.168.3.11


I tried to develop the firewall with iptables and the NETMAP option.
NAT is Ok but the firewalling doesn't work.

Here the script that I've written :

-------------------------------------
#! /bin/sh

ANTIVIRUS="172.26.100.18"
LICENSE="172.25.7.27"
LAN1="172.26.103.0/24"
LAN1MAP="192.168.2.0/24"
LAN2="172.26.104.0/24"
LAN2MAP="192.168.3.0/24"

# PORTATILE

iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -t mangle -X

iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT

iptables -A INPUT -m mac --mac-source 00:50:04:92:A8:1B -j ACCEPT
iptables -I INPUT 1 -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -p all -s $ANTIVIRUS -d $LAN1 -j ACCEPT
iptables -A INPUT -p all -s $ANTIVIRUS -d $LAN2 -j ACCEPT
iptables -A INPUT -p all -s $LICENSE -d $LAN1 -j ACCEPT
iptables -A INPUT -p all -s $LICENSE -d $LAN2 -j ACCEPT
iptables -A INPUT -j DROP

iptables -I FORWARD 1 -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -p all -s $LAN1 -d $ANTIVIRUS -j ACCEPT
iptables -A FORWARD -p all -s $LAN1MAP -d $ANTIVIRUS -j ACCEPT
iptables -A FORWARD -p all -s $LAN2 -d $ANTIVIRUS -j ACCEPT
iptables -A FORWARD -p all -s $LAN2MAP -d $ANTIVIRUS -j ACCEPT
iptables -A FORWARD -p all -s $LAN1 -d $LICENSE -j ACCEPT
iptables -A FORWARD -p all -s $LAN2 -d $LICENSE -j ACCEPT
iptables -A FORWARD -j DROP

iptables -I OUTPUT 1 -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT
iptables -A OUTPUT -o eth0 -s 172.26.100.19 -j ACCEPT
iptables -A OUTPUT -o eth0 -s 172.26.103.0/24 -j ACCEPT
iptables -A OUTPUT -o eth0 -s 172.26.104.0/24 -j ACCEPT
iptables -A OUTPUT -o eth1 -s 192.168.2.0/24 -j ACCEPT
iptables -A OUTPUT -o eth2 -s 192.168.3.0/24 -j ACCEPT

iptables -A OUTPUT -p all -s $LAN1 -d $ANTIVIRUS -j ACCEPT
iptables -A OUTPUT -p all -s $LAN2 -d $ANTIVIRUS -j ACCEPT
iptables -A OUTPUT -p all -s $LAN1 -d $LICENSE -j ACCEPT
iptables -A OUTPUT -p all -s $LAN2 -d $LICENSE -j ACCEPT
iptables -A OUTPUT -j DROP
#  NETMAPPING

iptables -t nat -P PREROUTING ACCEPT
iptables -t nat -A PREROUTING -d 1.2.3.0/24 -j NETMAP --to 5.6.7.0/24
iptables -t nat -A PREROUTING -d 172.26.103.0/24 -j NETMAP --to 
5.6.7.0/24
iptables -t nat -A PREROUTING -d 172.26.103.0/24 -j NETMAP --to
192.168.2.0/24
iptables -t nat -A PREROUTING -d 172.26.104.0/24 -j NETMAP --to
192.168.3.0/24
iptables -t nat -A PREROUTING -j DROP

iptables -t nat -P POSTROUTING ACCEPT
iptables -t nat -A POSTROUTING -s 192.168.3.0/24 -j NETMAP --to
172.26.104.0/24
iptables -t nat -A POSTROUTING -s 192.168.2.0/24 -j NETMAP --to
172.26.103.0/24
iptables -t nat -A POSTROUTING -j DROP

# WORKAROUND

iptables -t nat -D PREROUTING -d 1.2.3.0/24 -j NETMAP --to 5.6.7.0/24
iptables -t nat -D PREROUTING -d 172.26.103.0/24 -j NETMAP --to 
5.6.7.0/24

---------------------------------------------------------------

Thanks to everyone and have a good day!

Simone Sanna
simone.sanna@trslab.it


