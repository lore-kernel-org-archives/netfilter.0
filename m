From: Benoit Moeremans <abeneuneu@gmail.com>
Subject: debian sarge + iptables
Date: Mon, 30 Jan 2006 14:11:44 +0100
Message-ID: <e62701950601300511t54aa1a2fq71b24cc85bec53e9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Hello,

I have a strange problem. I'm using debian sarge and iptables v1.2.11.
 For all my firewalling rules, i'm using a script (see below).  I
don't know why, but iptables doesn't load all my rules. For example,
the port forwarding is not working perfectly. The pfw to one ip iw
working but the rules just before, wich is also a pfw to another ip,
doesn't work.

This script works perfectly before, so even with some modifications, i
failed to get it working.

Any idea?

Thnx in advance,

Benoit


#!/bin/bash

case $1 in

start)
   echo -n "Starting firewall.."

for i in /proc/sys/net/ipv4/conf/*/accept_source_route; do
                 echo 1 > $i;
done

for i in /proc/sys/net/ipv4/conf/*/rp_filter; do
                 echo 0 > $i;
done

echo 1 > /proc/sys/net/ipv4/ip_forward


iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT
iptables -t nat -P PREROUTING ACCEPT
iptables -t nat -P POSTROUTING ACCEPT
iptables -t nat -P OUTPUT ACCEPT
iptables -F
iptables -t nat -F


iptables -A FORWARD -s 192.168.1.0/24 -j ACCEPT
iptables -A FORWARD -d 192.168.1.0/24 -j ACCEPT
iptables -A FORWARD -j DROP


#PFW
iptables -A PREROUTING -t nat -i eth1 -p tcp --dport 112 -j DNAT
--to-destination 192.168.1.240:80
iptables -A PREROUTING -t nat -i eth1 -p tcp --dport 111 -j DNAT
--to-destination 192.168.1.159:80
#NAT
iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -o eth1 -j MASQUERADE


echo ""
;;

stop)
   echo -n "Stopping firewall..."

iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT
iptables -t nat -P PREROUTING ACCEPT
iptables -t nat -P POSTROUTING ACCEPT
iptables -t nat -P OUTPUT ACCEPT
iptables -F
iptables -t nat -F
echo "."
;;
*)
echo "Usage: /etc/init.d/firewall {start|stop}"
exit 1
esac

exit 0

