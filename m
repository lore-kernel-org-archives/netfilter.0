From: Jean-Christian Imbeault <jc@mega-bucks.co.jp>
Subject: Do these rules cut it?
Date: Mon, 17 Feb 2003 19:11:24 +0900
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E50B54C.1050509@mega-bucks.co.jp>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Thanks to everyone who helped with get iptables up and going. I finally
have a set of rules that seem to work!

I'm still a bit worried that my rules aren't strict enough though or
that there is some gapping whole or something in them. Also in order to
get everything to work I needed to add some rules to let in DNS (answers
to queries?) but I can't figure out why I need them.

These rules are for a web server (SERVER2) in a DMZ and what I am trying
to accomplish is:

- allow SSH access only from PCs within my LAN
- allow all HTTP and HTTPS access
- allow the web server to connect to a DB on it's eth1 card
- block everything else

The network looks like this:

LAN ---- FIREWALL ---- WAN
   |       (x.241)
   |          |
   |          |
   |          |
   |        (eth0)
PC(W2K)   SERVER2(eth1,z.2)---SERVER1
(y.103)   (x.244)              (z.1)


Here are the rules I have. I'm looking for any comments or suggestions
on how I could (or should) improve on these rules (I have no control
over the firewall rules though ...)

Thanks in advance!

----------
#!bin/sh

IPT="/usr/local/sbin/iptables"
IP1="x.x.x.244"
IP2="z.z.z.2"
LAN="y.y.y.0/24"
PG="z.z.z.1"

# Delete any old rules

for i in filter
do
    $IPT -t $i -F
    $IPT -t $i -X
done

$IPT --policy INPUT   DROP
$IPT --policy OUTPUT  ACCEPT
$IPT --policy FORWARD DROP

# Loopback accepts everything

$IPT -A INPUT  -i lo -j ACCEPT
$IPT -A OUTPUT -o lo -j ACCEPT

# DNS
$IPT -A INPUT -p tcp --dport 53 -j ACCEPT
$IPT -A INPUT -p udp --dport 53 -j ACCEPT

# For some I reason need this ...
$IPT -A INPUT -p TCP -s 0/0  -i eth0 -d $IP1 --sport 53  -m state
--state NEW,ESTABLISHED,RELATED -j ACCEPT
$IPT -A INPUT -p UDP -s 0/0  -i eth0 -d $IP1 --sport 53  -m state
--state NEW,ESTABLISHED,RELATED -j ACCEPT

# Allow SHH from LAN only, HTTP, HTTPS from anywhere for new and
previously established connections

$IPT -A INPUT -p TCP -s $LAN -i eth0 -d $IP1 --dport 22  -m state
--state NEW,ESTABLISHED,RELATED -j ACCEPT
$IPT -A INPUT -p TCP -s $LAN -i eth0 -d $IP1 --dport 80  -m state
--state NEW,ESTABLISHED,RELATED -j ACCEPT
$IPT -A INPUT -p TCP -s $LAN -i eth0 -d $IP1 --dport 443 -m state
--state NEW,ESTABLISHED,RELATED -j ACCEPT

# DB connections

$IPT -A INPUT -p TCP -s $PG --sport 5432 -i eth1 -d $IP2 -m state
--state NEW,ESTABLISHED,RELATED -j ACCEPT

# For outgoing mail
$IPT -A INPUT -p tcp --sport 25 -j ACCEPT

#log anything that made it his far w/o being accepted
$IPT -A INPUT -j LOG --log-level debug --log-prefix "DROP packet:"



