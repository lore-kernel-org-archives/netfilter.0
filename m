From: rpereyra@lavabit.com
Subject: bypass ip destination squid tproxy bridge
Date: Fri, 9 Sep 2011 09:11:41 -0400 (EDT)
Message-ID: <19071.190.229.219.250.1315573901.squirrel@lavabit.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi

I have configured a squid transparent tproxy as
http://wiki.squid-cache.org/Features/Tproxy4

All works fine.

Now I need all the traffic going to an external ip (internet) does not
pass through the proxy.

Do I need to modify iptables, ebetables rules or change the configuration
of squid?

I found this tutorial:

http://wiki.squid-cache.org/KnowledgeBase/TransparentProxySelectiveBypass
but it don't use the tproxy rules.


iptables rules

iptables -F -t mangle iptables -X -t mangle iptables -t mangle -N DIVERT
iptables -t mangle -A PREROUTING -p tcp -m socket -j DIVERT

iptables -t mangle -A DIVERT -j MARK --set-mark 1 iptables -t mangle -A
DIVERT -j ACCEPT

iptables -t mangle -A PREROUTING -p tcp --dport 80 -j TPROXY --tproxy-mark
0x1/0x1 --on-port 3129


ebtables rules

ebtables -t broute -A BROUTING -i eth1 -p ipv4 --ip-proto tcp --ip-dport
80 -j redirect --redirect-target DROP

ebtables -t broute -A BROUTING -i eth0 -p ipv4 --ip-proto tcp --ip-sport
80 -j redirect --redirect-target DROP




Look I need to insert the bypass rules before the first ebtables rule.
It's correct ?

Do these rules works ?

ebtables -t broute -A BROUTING -i eth1 -p ipv4 --ip-proto -d IP_dest -j
ACCEPT
ebtables -t broute -A BROUTING -i eth0 -p ipv4 --ip-proto -s IP_dest -j
ACCEPT

Thanks in advance for any help !

roberto



