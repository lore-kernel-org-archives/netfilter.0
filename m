From: Karina =?iso-8859-1?Q?G=F3mez?= Salgado <kgs@acabtu.com.mx>
Subject: Slow performance - Trouble with IPtables rules
Date: Wed, 03 Jul 2002 13:41:09 -0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D234545.D34413B9@acabtu.com.mx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Hi,

    I'm trying to setting up a Linux Computer as my LAN gateway to
Internet. Later, i will use this computer like a squid-proxy, but by
now, it should only forward packets in and out of my LAN without
masquerading (i will use my class C segment), and that's it.

I took the rc.firewalls rules as a base for create gateway and it works,

but even if i only have one computer connected to the gateway the
internet access is a little slow . The internet access in the linux pc
is fast but in the other one(s) connected is not that fast, when i try
to check a web page it takes a moment to process and later when it
displays the website, and the images can take long time to show.

The rules i'm using are these:
--------------------------------


#!/bin/sh
#
echo -e "\n Loading Firewalling Rules \n"

IPTABLES=/sbin/iptables
UNIVERSE="0.0.0.0/0"

INTIF="eth1"
EXTIF="eth0"

echo " Enabling forwarding.. "

echo "1" > /proc/sys/net/ipv4/ip_forward

echo " Clearing existing rules... "

$IPTABLES -P INPUT DROP
$IPTABLES -F INPUT
$IPTABLES -P OUTPUT DROP
$IPTABLES -F OUTPUT
$IPTABLES -P FORWARD DROP
$IPTABLES -F FORWARD
$IPTABLES -F -t nat
$IPTABLES -X
$IPTABLES -Z


$IPTABLES -A INPUT -s $UNIVERSE -d $UNIVERSE -j ACCEPT -v

$IPTABLES -A OUTPUT -s $UNIVERSE -d $UNIVERSE -j ACCEPT -v

$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -j ACCEPT -v

$IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT -v


This settings are enough ? Do i need somethig more ?

I'll appreciate a lot any help,


Karina




