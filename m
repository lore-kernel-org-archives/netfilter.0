From: Jared Mahoney <jared@doublexyz.com>
Subject: port forwarding stopped working
Date: Wed, 25 Jun 2003 22:51:18 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0306252244310.3675@gentoo.wanfear.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello,

I have been running IPTables for firewall, NAT and port forwarding for a 
long time on RedHat 9.  But, after installing updates from the RedHat 
Network port forwarding has stopped working.  Everything else seems to 
work correctly.  Here is my rc.local which holds the commands:

#!/bin/sh
#
# This script will be executed *after* all the other init scripts.
# You can put your own initialization stuff in here if you don't
# want to do the full Sys V style init stuff.

touch /var/lock/subsys/local

#Setup MASQ and DNS only from LAN
echo 1 > /proc/sys/net/ipv4/ip_forward

# Flush everything
/sbin/iptables -t filter -F
/sbin/iptables -t nat -F
/sbin/iptables -t mangle -F

# Masquerade for our internal hosts, allowing them to do whatever they 
like.
/sbin/iptables -t nat -A POSTROUTING -s 10.0.0.0/24 -o eth0 -j MASQUERADE
/sbin/iptables -A INPUT -p all -s 10.0.0.0/24 -i eth1 -j ACCEPT
# Drop telnet, DNS, and WWW from the outside world.
/sbin/iptables -A INPUT -p tcp --dport 23 -i eth0 -j DROP
/sbin/iptables -A INPUT -p udp --dport 53 -i eth0 -j DROP
/sbin/iptables -A INPUT -p tcp --dport 53 -i eth0 -j DROP
/sbin/iptables -A INPUT -p tcp --dport 80 -i eth0 -j DROP
/sbin/iptables -A INPUT -p udp --dport 80 -i eth0 -j DROP
# No SUN RPC :p
/sbin/iptables -A INPUT -p udp --dport 111 -i eth0 -j DROP
/sbin/iptables -A INPUT -p tcp --dport 111 -i eth0 -j DROP
# This one allows us to ssh directly into Krycek.
/sbin/iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 220 -j DNAT 
--to 10.0.0.32:22


I have not changed anything, yet now it is not possible to SSH into 
10.0.0.32 from the outside.  No errors on bootup.  Did anything change or 
does anyone see problems with the syntax above?

Many thanks,

Jared

