From: Paul <gabaod@yahoo.com>
Subject: iptables - port forwarding help
Date: Tue, 29 Apr 2003 11:25:57 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030429182557.30427.qmail@web13502.mail.yahoo.com>
References: <20030429025941.9348.qmail@web13502.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030429025941.9348.qmail@web13502.mail.yahoo.com>
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
To: netfilter@lists.netfilter.org

Ok, im resetting up my home network, and hence the
reason for this letter :)

I have 2 linux boxes, and 2 windows boxes.  One linux
box will be the firewall/gateway, internet on eth0 and
internal lan on eth1.  What im looking for is basic
suggestions on my script, and also needing to know how
i can lets say have all external connections that try
to connect to me on port 10022 be forwarded to
192.168.1.8:22, so that i can be able to ssh into both
of my linux boxes, the firewall one, and an internal
one.  Im pretty sure i have to either allow port 10022
on the INPUT, or allow port 22 on the FORWARD, then
also set up a PREROUTING, though each example ive
tried ive had no success with.

I have included my script below.


#!/bin/sh
#
#
# Todo: Setup loggin, allow access to ssh/smtp/web to
internal box
#       test to make sure instant messengers can
send/receive files
#       test to make sure irc dcc chats/sends work
#       block certain ads from displaying
#
#

IPTABLES="/sbin/iptables"   ## location to iptables
binary file

EXTDEV="eth0"               ## external device that
connects to modem
INTDEV="eth1"               ## internal device that
connects to lan

EXTIP=`ifconfig $EXTDEV | grep inet | cut -f2 -d: |
cut -f1 -d" "` ## external ip address
INTIP=`ifconfig $INTDEV | grep inet | cut -f2 -d: |
cut -f1 -d" "` ## internal ip address

case "$1" in
  start)

#
## First we want to enable ip forwarding
#
echo -n "Enabling IP Forwarding ... "
echo "1" > /proc/sys/net/ipv4/ip_forward
echo "done."

#
## Secondly we want to enable dynamic ips
#
echo -n "Enabling Dynamic Ips ... "
echo "1" > /proc/sys/net/ipv4/ip_forward
echo "done."

#
## Now lets clear all the tables incase they were
improperly shutdown
#
echo -n "Flushing tables, Setting default policies to
DROP ... "
$IPTABLES -P INPUT DROP
$IPTABLES -F INPUT
$IPTABLES -P FORWARD DROP
$IPTABLES -F FORWARD
$IPTABLES -P OUTPUT DROP
$IPTABLES -F OUTPUT
$IPTABLES -t nat -F
$IPTABLES -t mangle -F
echo "done."

#
## Its time to start setting up our rules and policies
#

echo -n "Setting up the firewall now ... "
## First we want to allow only incoming connections
that we establish first
$IPTABLES -A INPUT -m state --state
ESTABLISHED,RELATED -j ACCEPT

## Next we want to allow ssh incoming connections as
well
$IPTABLES -A INPUT -p tcp --dport ssh -j ACCEPT

#
## Now we are going to allow our lan with access to
the external network
#

## First we allow all established connections to be
forwarded internally
$IPTABLES -A FORWARD -i $EXTDEV -m state --state
RELATED,ESTABLISHED -j ACCEPT

## Second we allow all connections from the lan to the
external network
$IPTABLES -A FORWARD -i $INTDEV -o $EXTDEV -j ACCEPT

## Masquerade from Internal Net to External Net
$IPTABLES -A POSTROUTING -t nat -o $EXTDEV -j
MASQUERADE

#
## And last thing we need to worry about is what the
internal network has access to do externally
#

$IPTABLES -P OUTPUT ACCEPT


echo "Firewall has been fully installed"

;;
stop)

echo -n "Flushin all rules ... "
$IPTABLES -P INPUT ACCEPT
$IPTABLES -P FORWARD ACCEPT
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -F INPUT
$IPTABLES -F FORWARD
$IPTABLES -F OUTPUT
$IPTABLES -t nat -P PREROUTING ACCEPT
$IPTABLES -t nat -P POSTROUTING ACCEPT
$IPTABLES -t nat -P OUTPUT ACCEPT
$IPTABLES -t nat -F PREROUTING
$IPTABLES -t nat -F POSTROUTING
$IPTABLES -t nat -F OUTPUT
echo "done."
;;
restart)
$0 stop
$0 start
;;
status)
$IPTABLES -L
;;
*)
echo "usage: $0 {start|stop|restart|status}"
exit 1
esac
exit 0

## EOF ##



-thanks-


__________________________________
Do you Yahoo!?
The New Yahoo! Search - Faster. Easier. Bingo.
http://search.yahoo.com

