From: Tom Elsesser <telsesser@mindspring.com>
Subject: Port forwarding problem
Date: Wed, 13 Nov 2002 23:29:05 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <ut86tuo7rimkt2dc52ke1qo8boaqtt29g0@4ax.com>
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

Hi,
 I have 2 linux servers on a 20 workstation network. There is an adsl
connection coming thru a EN5861 router which connects to one server
(yzerman) on eth1. Eth0 on this box goes to a 48 port switch. The
other linux box (ulysses) is going to be a webmail server, and has 1
nic going to the switch. I have the apache server on ulysses listening
on port 8000. The router can forward ports but only on its own subnet,
which is the same as eth1 on yzerman. I am trying to get port 8000 to
go thru yzerman to ulysses, but can't seem to get it right. Can
someone take a peek at my iptables config and tell me where I went
wrong?

Thanks in advance.

+++++++++++++++++
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
/sbin/iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 8000 -j
DNAT --to 10.1.1.2

# Connect to port 8000 (squirrelmail) from outside
/sbin/iptables -A INPUT -i eth1 -d 0/0 -p tcp --dport 8000 -j ACCEPT

# Connect via ssh from outside
/sbin/iptables -A INPUT -i eth1 -d 0/0 -p tcp --dport 22 -j ACCEPT

# Log to syslog
# /sbin/iptables -A INPUT -j LOG


--=20
Tom

