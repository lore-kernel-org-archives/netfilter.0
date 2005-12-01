From: Rudi Starcevic <tech@wildcash.com>
Subject: Re: dumb question...route from local eth1 to eth2 and vice versa
Date: Thu, 01 Dec 2005 17:08:01 +1000
Message-ID: <438EA151.1040206@wildcash.com>
References: <000001c5f642$ab8b8890$0101000a@sterenborg.info>
	<438EA0BD.3070804@wildcash.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------030304020809080104080700"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <438EA0BD.3070804@wildcash.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------030304020809080104080700
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,

Oh man .. it's just too late in my day ....

Let me try one more time to attach these 2 scripts ..

Doh .. sorry .....


--------------030304020809080104080700
Content-Type: text/plain;
 name="ip_b_firewall_1._b.sh"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ip_b_firewall_1._b.sh"

#!/bin/bash

echo "Firewall Setup Start"


################################################################################
echo -n "Firewall: sysctl "

# Enable forwarding
echo "Enable Kernel Forwarding"
echo 1 > /proc/sys/net/ipv4/ip_forward

################################################################################
echo -n "reset "

for table in filter nat mangle ; do
iptables --table $table --flush
iptables --table $table --delete-chain
done

modprobe ip_nat_ftp

################################################################################
echo -n "FORWARD " 
iptables -A FORWARD -i eth0 -j ACCEPT
iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT


################################################################################
echo -n "OUTPUT "

# allows unrestricted output from this machine
iptables -A OUTPUT -o lo -j ACCEPT
iptables -A OUTPUT -o eth0 -j ACCEPT
iptables -A OUTPUT -o eth1 -j ACCEPT

################################################################################
echo done.

--------------030304020809080104080700
Content-Type: text/plain;
 name="ip_a_route_1.sh"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ip_a_route_1.sh"

#!/bin/sh

echo "Network Setup Start"

echo "Flushing NICs"
ip addr flush eth0
ip addr flush eth1

ip link set eth0 down
ip link set eth1 down

ip link set eth0 up
ip link set eth1 up

echo "Routing Tables:"
cat /etc/iproute2/rt_tables 
### example file ###
## reserved values
##
#255	local
#254	main
#253	default
#0	unspec
##
## local
##
##1	inr.ruhep
#200	implan
#201	inet
### example end ###

echo "Setup NIC 0"
ip addr add 192.168.3.10/24 dev eth0 brd +

echo "Setup NIC 1"
ip addr add 192.168.1.1/24 dev eth1 brd +

ip addr list
ip route list

echo "Setup Default Route [ inet table ]"
ip route add default via 192.168.1.254 proto static table inet

echo "Setup LAN Route [ implan table ]"
ip route add 192.168.3/24 via 192.168.3.10 proto static table implan

ip route list

echo "Setup LAN ip rule"
ip rule add to 192.168.3/24 prio 16000 table implan

echo "Setup Internet ip rule"
ip rule add to 0/0 prio 17000 table inet

echo "Flushing ip route cache"
ip route flush cache

--------------030304020809080104080700--

