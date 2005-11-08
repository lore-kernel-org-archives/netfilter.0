From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: IPTABLES PROBLEM
Date: Tue, 8 Nov 2005 19:56:23 +0100
Message-ID: <20051108190238.B9BEA6AB9D@smtp.sterenborg.info>
References: <20051108170808.94047.qmail@web26603.mail.ukl.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051108170808.94047.qmail@web26603.mail.ukl.yahoo.com>
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

> I have a lan whit 10 pc (use win9X) and have ip 10.10.10.2 ecc..
> Tree days ago Telecom build in my farm the adsl (using router adsl
> cisco ) i wont to create a firewall and use natting for pc
> I build a pc whit Slackware 10.1
> and i do this script:
> 
> ----Information LAN--------
> 
> (ethO is connected to switch)
> eth0: 10.10.10.50 netmask 255.255.255.0
> 
> (IP STATIC,GIVE ME THIS IP FROM TELECOM)
> eth1: 178.133.80.74 netmask 255.255.255.248 
> 
> (GATWAY IP, GIVE ME THIS FROM TELECOM)
> gatway 78.133.80.73 netmask 255.255.255.248
        ^^^^
I guess this is a typo ?? I suppose it should be 178.133.80.73

> (DNS IP, GIVE ME FROM TELECOM)
> DNS 151.99.125.1
> 
> ------SCRIPT FOR ETHERNET
> CONFIGURATION----------------
> 
> 
> //ETHERNET INTERFACE file conf.ps
> !/bin/bash
> ifconfig eth0 10.10.10.50 netmask 255.255.255.0
> ifconfig eth1 178.133.80.74 netmask 255.255.255.248
> route add -net default gw 178.133.80.73 netmask
> 255.255.255.248
> # END SCRIPT CONF.PS
> 
> //--- I WRITE IN /etc/resolv.conf
> NAMESERVER=151.99.125.1
> 
> //--------FIREWALL SCRIPT firewall.ps
> 
> #!/bin/bash
> IPTAB=iptables
> NAMESERVER=151.99.125.1
> IPADD=178.133.80.74

...

> 
> WHEN I START TO FIREWALL THE CLIENT CAN'T TO GO TO
> INTERNET, HELP ME !!!!

Please don't shout at us..

What is "the client" ? Is it the firewall or do you mean the LAN
clients.

You seem not familiar with iptables and immediately want to build a
ruleset that is quite closed. Maybe you should start simpler and when
you are confident enough, expand the ruleset into what you want it to
do.
Check out :
http://iptables-tutorial.frozentux.net/iptables-tutorial.html

Try the following. Setting OUTPUT policy to DROP makes it more difficult
for you to get things working, so I set it to ACCEPT.

============
# First, do not allow forwarding yet.
#
echo 0 > /proc/sys/net/ipv4/ip_forward
echo 1 > /proc/sys/net/ipv4/tcp_syncookies

# Empty all chains
#
$IPT -F
$IPT -t nat -F

# Set policy
#
$IPT -P INPUT DROP
$IPT -P FORWARD DROP
$IPT -P OUTPUT  ACCEPT

# Accept on lo
#
$IPT -A INPUT -i lo -j ACCEPT

# Accept packets from already matched connections
#
$IPT -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
$IPT -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT

# LAN -> firewall
#
$IPT -A INPUT -m state --state NEW -i eth0 -s 10.10.10.0/24 \
  -j ACCEPT

# LAN -> Internet
#
$IPT -A FORWARD -m state --state NEW -i eth0 -o eth1 \
  -s 10.10.10.0/24 -j ACCEPT

# NAT
#
$IPT -t nat -A POSTROUTING -o eth1 -s 10.10.10.0/24 \
  -j SNAT --to 178.133.80.74

# Allow forwarding
#
echo 1 > /proc/sys/net/ipv4/ip_forward
============


Gr,
Rob


