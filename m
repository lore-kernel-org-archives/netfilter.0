From: =?iso-8859-1?Q?Sven-=C5ke_Larsson?= <Sven-Ake.Larsson@hiq.se>
Subject: (no subject)
Date: Wed, 21 Jan 2004 18:06:03 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <31A473DBB655D21180850008C71E251A07D3D58B@mail.kebne.se>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: 'netfilter list ' <netfilter@lists.netfilter.org>


Hi all.

I'm totally new to this list and I really tried to find an answer to my
question in the archives but with no success, so I'm sorry if I'm repeating
the history.

Yesterday I installed a new machine to create a better firewall than the one
I have today and to get some better logging functionality. A couple of
pieces are taken from other scipts I found and it does log stuff as I
thought. The strange thing is that for example port 53 and 111 appers to be
open when I do a port scan even though everything should be dropped as
default. But when I added the line "$IPTABLES -A INPUT -p tcp -m tcp --syn
-j DROP" to the script everything except wanted ports are open, as I wanted.
The last line should take care of everything, but it doesn't seem to work.

So the question is, how come? I used the Redhat security tool to create a
very-secure-machine script and the same thing happens.
I also surprisingly found out that in RH9 deny doesn't work?!


Best Regards,
Sven


Scrip start -------------------------

#!/bin/sh

echo 1 > /proc/sys/net/ipv4/ip_forward
echo 1 > /proc/sys/net/ipv4/tcp_syncookies

IPTABLES="/sbin/iptables"

OUTSIDE=eth0
OUTSIDE_IP=my.to.inet.adress
INSIDE=eth2
INSIDE_IP=to.local.network.adress

$IPTABLES -F
$IPTABLES -F INPUT
$IPTABLES -F OUTPUT
$IPTABLES -F FORWARD
$IPTABLES -F -t mangle
$IPTABLES -F -t nat
$IPTABLES -X
$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -P FORWARD DROP

# My new rules
$IPTABLES -N silent
$IPTABLES -A silent -j DROP

$IPTABLES -N tcpflags
$IPTABLES -A tcpflags -m limit --limit 15/minute -j LOG --log-prefix
TCPflags:
$IPTABLES -A tcpflags -j DROP

$IPTABLES -N firewalled
$IPTABLES -A firewalled -m limit --limit 15/minute -j LOG --log-prefix
Firewalled:
$IPTABLES -A firewalled -j DROP

# Source NAT
$IPTABLES -t nat -A POSTROUTING -o $OUTSIDE -j SNAT --to $OUTSIDE_IP

# Flag kombinations that shouldn't exist are dropped.
$IPTABLES -A INPUT -p tcp --tcp-flags ALL FIN,URG,PSH -j tcpflags
$IPTABLES -A INPUT -p tcp --tcp-flags ALL ALL -j tcpflags
$IPTABLES -A INPUT -p tcp --tcp-flags ALL SYN,RST,ACK,FIN,URG -j tcpflags
$IPTABLES -A INPUT -p tcp --tcp-flags ALL NONE -j tcpflags
$IPTABLES -A INPUT -p tcp --tcp-flags SYN,RST SYN,RST -j tcpflags
$IPTABLES -A INPUT -p tcp --tcp-flags SYN,FIN SYN,FIN -j tcpflags

# Accept ICMP's
$IPTABLES -A INPUT -p icmp --icmp-type 0 -j ACCEPT
$IPTABLES -A INPUT -p icmp --icmp-type 3 -j ACCEPT
$IPTABLES -A INPUT -p icmp --icmp-type 11 -j ACCEPT
$IPTABLES -A INPUT -p icmp --icmp-type 8 -m limit --limit 1/second -j ACCEPT
$IPTABLES -A INPUT -p icmp -j firewalled

$IPTABLES -A INPUT -p tcp -m tcp --dport 22  --syn -j ACCEPT
$IPTABLES -A INPUT -p tcp -m tcp --dport 25  --syn -j ACCEPT
$IPTABLES -A INPUT -p tcp -m tcp --dport 80  --syn -j ACCEPT
$IPTABLES -A INPUT -p tcp -m tcp --dport 443 --syn -j ACCEPT

# Temporarly solution to get rid of 53 and 111
# Without this one the will show up as open?!
$IPTABLES -A INPUT -p tcp -m tcp --syn -j DROP


# Localhost and inside machines are trustworthy
$IPTABLES -A INPUT -i lo -j ACCEPT
$IPTABLES -A INPUT -i $INSIDE -j ACCEPT
$IPTABLES -A INPUT -i $INSIDE -d $INSIDE_IP -j ACCEPT

# Accept established
$IPTABLES -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
$IPTABLES -A FORWARD -i $OUTSIDE -o $INSIDE -m state --state
RELATED,ESTABLISHED -j ACCEPT

# Silently drop any SMB traffic.
$IPTABLES -A INPUT -p udp --sport 137 --dport 137 -j silent
$IPTABLES -A INPUT -p udp --sport 138 --dport 138 -j silent
$IPTABLES -A INPUT -p udp --sport 139 --dport 139 -j silent
$IPTABLES -A INPUT -p udp --sport 445 --dport 445 -j silent

# Last case killer, log and drop.
$IPTABLES -A INPUT -j firewalled

------------------------- Script End

