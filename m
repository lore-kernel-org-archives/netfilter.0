From: Andreas Pettersson <andreas@knoxville.se>
Subject: After 14 hours of brainpain...
Date: Mon, 3 Jan 2005 01:39:17 +0100
Message-ID: <E6A0AAEA-5D1F-11D9-83E1-000A95B981B6@knoxville.se>
Mime-Version: 1.0 (Apple Message framework v619)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I have read, this mailings list and numerous tutorials, but cant get 
the firewall script to work.

I have "Internet" on ETH1 and my LAN on ETH0 and try to make my 
webserver on the lan accessible from the outside..
I was starting out with a 2.6.10 kernel, but downgraded to a 2.4.28 
kernel but it still dont work...

This is what the script looks like:
---- CUT HERE ----
#!/bin/bash
echo 1 > /proc/sys/net/ipv4/ip_forward
echo 1 > /proc/sys/net/ipv4/ip_dynaddr
echo 1 > /proc/sys/net/ipv4/conf/all/rp_filter

INET_IP=`ifconfig eth1 | grep inet | cut -d : -f 2 | cut -d ' ' -f 1`

iptables -F INPUT
iptables -F OUTPUT
iptables -F FORWARD
iptables -F -t nat

iptables -t nat -A POSTROUTING -o eth1 -d ! $INET_IP -j SNAT --to 
$INET_IP

iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS 
--clamp-mss-to-pmtu

## WWW Forwarding ...
iptables -t nat -A PREROUTING -d $INET_IP -p tcp --dport 80 -j DNAT 
--to-destination 192.168.1.30
iptables -A FORWARD -d $INET_IP -p tcp --syn --dport 80 -m state 
--state NEW -j ACCEPT
iptables -t nat -A POSTROUTING -s 192.168.1.30 -p tcp --sport 80 -j 
SNAT --to-source $INET_IP
----TO HERE ----

In my own logic, must this work, but it doesnt.. note that this script 
is just made in hope it would work, but it does not..
i have tried to find a list of exactly WHAT i must compile into the 
kernel to make it work.. but cant find that either.

Please help...

Regards // Andreas

--------------------------
ICQ: 1667613
MSN: neopocketsurf@hotmail.com
AIM: knxandyneo
Mail: andreas@knoxville.se
Skype: front.242
Mobil: 0702 45 78 03
Tfn: 019 764 80 18


