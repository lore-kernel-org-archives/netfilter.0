From: Alexander Salmin <security.member@gmail.com>
Subject: Secure Firewall
Date: Tue, 9 Aug 2005 15:24:47 +0200
Message-ID: <393114f90508090624278c8414@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

Hello friends,

I'm trying to set up a secure NAT firewall in my home, for that I need
help with some rules.

I've got a total of four computers, including the server.=20

These are the ones who should be NAT'ed:

#1 --- 192.168.51.20 --- Should be able to access all internet.
#2 --- 192.168.51.40 --- Should be able to access only websites (port 80,44=
3).
#3 --- 192.168.51.80 --- Should be able to access only websites (port 80,44=
3).

This is how my non-working iptables-script looks like right now:
---------------------------------------------------------------------------=
----------
INT=3D"eth0"
EXT=3D"eth1"
IPTABLES=3D/sbin/iptables

$IPTABLES -F INPUT
$IPTABLES -F OUTPUT
$IPTABLES -F FORWARD
$IPTABLES -F -t nat

$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT DROP
$IPTABLES -P FORWARD DROP

$IPTABLES -A INPUT -i $INT -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A INPUT -i eth0 -p icmp -j ACCEPT
$IPTABLES -A INPUT -p UDP --dport bootps -i $INT -j ACCEPT
$IPTABLES -A INPUT -p UDP --dport domain -i $INT -j ACCEPT

$IPTABLES -t nat -A POSTROUTING -s 192.168.51.20 -o $EXT -j MASQUERADE
$IPTABLES -t nat -A POSTROUTING -s 192.168.51.40 -dport 80 -o $EXT -j MASQU=
ERADE
$IPTABLES -t nat -A POSTROUTING -s 192.168.51.80 -dport 80 -o $EXT -j MASQU=
ERADE

$IPTABLES -A INPUT -j DROP
---------------------------------------------------------------------------=
----------

Somehow, it doesn't work with -dport 80, and I believe that I have
missed some allow-rules because the -j DROP denies the computer from
192.168.51.20 too.

Any help would be appreciated!


Thanks,
--Alexander.

