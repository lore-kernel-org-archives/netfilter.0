From: Tom Elsesser <tom@acalgrinding.dyndns.org>
Subject: http forwarding
Date: Thu, 14 Nov 2002 09:59:42 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <cld7tugoh1bo72ihi68e98j7sh2a19kqn4@4ax.com>
Reply-To: tom@acalgrinding.dyndns.org
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

I have 2 linux boxes on a network. One box (yzerman)is connected to an
EN5861 router by eth1 and the network by eth0, the other (ulysses)is
just on the network from eth0. I have iptables on yzerman and am
trying to forward http request to ulysses. The router and eth1 are on
a 10.10.10.0 subnet, while the rest of the network is on a 10.1.1.0
subnet. The router cannot directly route the http requests from the
outside to ulysses, so I am trying to forward them from yzerman, but
it is not working as the connection times out if I try to connect from
the outside. I pieced together the iptables rulesets from what I've
gather from this list and other resources, but if someone could point
me in the correct direction I would appreciate it.

Nics on yzerman:
eth0 =3D 10.1.1.1
eth1 =3D10.10.10.1

Nics on ulysses:
eth0 =3D 10.1.1.2

Router ip addy:=20
10.10.10.2

Thanks in advance.

#!/bin/sh

# Turn on ipforwarding just in case
echo "1" > /proc/sys/net/ipv4/ip_forward

# Flush old rulesets
/sbin/iptables -F
/sbin/iptables -F -t nat

# Default policies
/sbin/iptables -P INPUT ACCEPT
/sbin/iptables -P OUTPUT ACCEPT
/sbin/iptables -P FORWARD DROP

# Masq out eth1 (to router)
/sbin/iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE

# Allow packets to return
/sbin/iptables -A FORWARD -i eth1 -m state --state RELATED,ESTABLISHED
-j ACCEPT

# Allow packets out
/sbin/iptables -A FORWARD -i eth0 -s 10.1.1.0/8 -j ACCEPT

# Forward squirrelmail http request to ulysses
/sbin/iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 80 -j DNAT
--to 10.1.1.2

# Connect to port 81 (squirrelmail) from outside
/sbin/iptables -A INPUT -i eth1 -d 0/0 -p tcp --dport 80 -j ACCEPT

# Connect via ssh from outside
/sbin/iptables -A INPUT -i eth1 -d 0/0 -p tcp --dport 22 -j ACCEPT

# Log to syslog
# /sbin/iptables -A INPUT -j LOG


