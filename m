From: methodaut@netscape.net (Thomas Meindl)
Subject: DNAT, SNAT, Portforward
Date: Thu, 31 Oct 2002 20:33:07 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <34BE59D9.590F1486.03240133@netscape.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

okey, let's start again for the correct guys out there
here's my original script which i have testet since two days
doing all kinds of variations and combinations anyone could think of
my problem is situated at the PREROUTING chain with DNAT
I simply want a portforward
someone told me i don't need the POSTROUTING chain and i couldn't really figure out why (i can't understand how the PREROUTING chain could alter the packets coming from the answer from the wwwserver, that's why I would use the POSTROUTING chain to alter that backcoming packet at the router, to let the www-client know that it receieved the packet from where it had come from)
anyway, see detailed describing at my initial post:
iptables, Portforward, DNAT, SNAT
and following

#/bin/bash

IPTABLES=/sbin/iptables

EXTIF="eth0"
INTIF="eth1"

echo "external interface: $EXTIF"
echo -e "internal interface: $INTIF\n"

echo "enabling syn-cookies.."
echo "1" > /proc/sys/net/ipv4/tcp_syncookies

echo "enabling dynamic addressing.."
echo "1" > /proc/sys/net/ipv4/ip_dynaddr

echo "enabling icmp broadcast reply.."
echo "1" > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts

echo "enabling ip-forwarding.."
echo "1" > /proc/sys/net/ipv4/ip_forward 

echo -e "enable source address verification (anti spoofing)..\n"
for f in /proc/sys/net/ipv4/conf/*; do
    echo "2" > $f/rp_filter
done

echo "clearing any existing rules and setting default policy.."
$IPTABLES -P INPUT ACCEPT
$IPTABLES -F INPUT
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -F OUTPUT
$IPTABLES -P FORWARD DROP
$IPTABLES -F FORWARD
$IPTABLES -t nat -F

echo "forwarding port 1234 to 192.168.0.2:80.."
$IPTABLES -t nat -A PREROUTING -p tcp -i $EXTIF -d www.xxx.yyy.zzz --dport 1234 -j DNAT --to 192.168.0.2:80
$IPTABLES -A FORWARD -p tcp -i $EXTIF -o $INTIF -d 192.168.0.2 --dport 80 -j ACCEPT
$IPTABLES -t nat -A POSTROUTING -p tcp -o $EXTIF -s 192.168.0.2 --sport 80 -j SNAT --to www.xxx.yyy.zzz:1234

echo "allow all connections out and only existing and related ones in.."
$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT
$IPTABLES -A FORWARD -j LOG --log-prefix "FIREWALL (FORWARD Chain): "

echo "enabling snat (masquerade) functionality on $EXTIF.."
$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE

thanks in advance for real help
and sorry to some who didn't like my initial help-scream


__________________________________________________________________
The NEW Netscape 7.0 browser is now available. Upgrade now! http://channels.netscape.com/ns/browsers/download.jsp 

Get your own FREE, personal Netscape Mail account today at http://webmail.netscape.com/

