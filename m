From: yunus <yunus@neduet.edu.pk>
Subject: iptables on Satellite receive only linux PC
Date: Wed, 28 Jul 2004 10:16:41 +0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <410736B8.D9130BBF@neduet.edu.pk>
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

Dear netfilter gurus,

In my last post I got good suggestions. Unfortunately they dont work.
This is a linux PC with satellite receive only card. The router is also
on the same network that is taking the traffic outside. Linux PC running
iptables has a satellite receive only pentanet card (data is received
and transmitted through cisco router.)

After implementing iptables config given below network traffic comming
from satellite PC stops.


IPTABLES="/sbin/iptables"
IP1=212.15.150.9
#

#
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
#

#
# silent       - Just dop the packet
# tcpflags     - Log packets with bad flags, most likely an attack
# firewalled   - Log packets that that we refuse, possibly from an
attack
#
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
#
# These are all TCP flag combinations that should never, ever, occur in
the
# wild. All of these are illegal combinations that are used to attack a
box
# in various ways.
#
$IPTABLES -A INPUT -s 127.0.0.0/8 -d 127.0.0.0/8 -i lo -j ACCEPT
# the above line will allow traffic from loopback interface
$IPTABLES -A INPUT -p tcp --tcp-flags ALL FIN,URG,PSH -j tcpflags
$IPTABLES -A INPUT -p tcp --tcp-flags ALL ALL -j tcpflags
$IPTABLES -A INPUT -p tcp --tcp-flags ALL SYN,RST,ACK,FIN,URG -j
tcpflags
$IPTABLES -A INPUT -p tcp --tcp-flags ALL NONE -j tcpflags
$IPTABLES -A INPUT -p tcp --tcp-flags SYN,RST SYN,RST -j tcpflags
$IPTABLES -A INPUT -p tcp --tcp-flags SYN,FIN SYN,FIN -j tcpflags
#
# Allow selected ICMP types and drop the rest.
#
$IPTABLES -A INPUT -p icmp --icmp-type 0 -j ACCEPT
$IPTABLES -A INPUT -p icmp --icmp-type 3 -j ACCEPT
$IPTABLES -A INPUT -p icmp --icmp-type 11 -j ACCEPT
$IPTABLES -A INPUT -p icmp --icmp-type 8 -m limit --limit 1/second -j
ACCEPT
$IPTABLES -A INPUT -p icmp -j firewalled
#
# The loopback interface is inheritly trustworthy. Don't disable it or
# a number of things will break.
#
$IPTABLES -A INPUT -i lo -j ACCEPT
#
# Now allow Internet hosts access to those services we provide. Note
that
# enabling inbound FTP 20 & 21 tcp will also require allowing ports
# 1024-65534/tcp. Which in itself is good enough reason not to allow FTP

# connections and to only allow ssh/scp/sftp.
#
# Allow ssh frpm anywhere to this server
#
$IPTABLES -A INPUT -p tcp -s 0/0 --dport 22 -j ACCEPT
#
# HTTP access from anywhere
#
$IPTABLES -A INPUT -p tcp -s 0/0 --dport 80 -j ACCEPT
$IPTABLES -A INPUT -p tcp -s 0/0 --dport 443 -j ACCEPT
$IPTABLES -A INPUT -p tcp -s 0/0 --dport 25 -j ACCEPT
$IPTABLES -A INPUT -p tcp -s 0/0 --dport 53 -j ACCEPT
$IPTABLES -A INPUT -p udp -s 0/0 --dport 53 -j ACCEPT
$IPTABLES -A INPUT -p tcp -s 0/0 --dport 123 -j ACCEPT
$IPTABLES -A INPUT -p udp -s 0/0 --dport 123 -j ACCEPT
#
#
$IPTABLES -A FORWARD -i pentanet0 -p tcp --dport 80 -j ACCEPT
$IPTABLES -A FORWARD -i pentanet0 -p tcp --dport 443 -j ACCEPT
$IPTABLES -A FORWARD -i pentanet0 -p tcp --dport 25 -j ACCEPT
$IPTABLES -A FORWARD -i pentanet0 -p tcp --dport 53 -j ACCEPT
$IPTABLES -A FORWARD -i pentanet0 -p udp --dport 53 -j ACCEPT
$IPTABLES -A FORWARD -i pentanet0 -p udp --dport 123 -j ACCEPT
$IPTABLES -A FORWARD -i pentanet0 -p tcp --dport 123 -j ACCEPT
#
# If there are trusted nodes you can allow then access to everything
with
# something like. Be sure to set IP at the top of this script if you
enable one
# of these.
#
#$IPTABLES -A INPUT -s 10.0.0.0/24 -d $IP1 -j ACCEPT

#
# Allow packets that are part of an established connection to pass
# through the firewall. This is required for normal Internet activity
# by inside clients.
#
$IPTABLES -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
#
# Anything not already matched gets firewalled and logged.
#
$IPTABLES -A INPUT -j firewalled

Thanks for all the response


