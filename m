From: Optimum Wireless Services <wilson@optimumwireless.com>
Subject: Re: How can I test my tc script?
Date: Sun, 06 Feb 2011 12:35:13 -0400
Message-ID: <1297010113.3928.12.camel@debian-laptop.OptimumWireless>
References: <1296699466.4606.14.camel@debian-laptop.OptimumWireless>
	 <1296761916.7587.29.camel@andybev>
	 <1296873898.3644.4.camel@debian-laptop.OptimumWireless>
	 <1296886030.4568.6.camel@debian-laptop.OptimumWireless>
	 <1296908825.1695.8.camel@andybev>
	 <1296958497.3695.18.camel@debian-laptop.OptimumWireless>
	 <1297008953.1613.24.camel@andybev>
Reply-To: wilson@optimumwireless.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1297008953.1613.24.camel@andybev>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org

On Sun, 2011-02-06 at 16:15 +0000, Andrew Beverley wrote:
> On Sat, 2011-02-05 at 22:14 -0400, Optimum Wireless Services wrote:
> > On Sat, 2011-02-05 at 12:27 +0000, Andrew Beverley wrote:
> > > On Sat, 2011-02-05 at 02:07 -0400, Optimum Wireless Services wrote:
> > > > Now, for the upload I cant get it shape with squid running in the
> > > > middle. If I remove squid then, traffic shaping works ok.
> > > > 
> > > 
> > > If you are doing egress shaping on the internet facing interface for the
> > > upload (which I assume you are - you can't use HTB on ingress), then it
> > > will not work for Squid. That's because Squid's traffic leaving the
> > > server is coming from the server's IP address, not from the client's IP
> > > address (Squid is generating the traffic, not the client). Therefore,
> > > your filter will never match the traffic. Normal traffic from a client
> > > is forwarded and retains its source IP address.
> > > 
> > 
> > Do you think I should go back to this method?
> > 
> > I have 120 users now but, that number should be increasing. Which method
> > do you recommend?
> 
> I think that you should forget the per-user stuff as per my other email
> and classify traffic. Just my personal opinion - I'd be interested to
> hear what others think.

I just need a way that would allow users to experience a reliable
connection that would always be 15% +- the contracted bandwidth.

This turned to be more complicated than what I first thought. 

After adding the new ruleset, I added this little script to try to
prioritize some traffic, just installed it so, don't know yet how would
traffic behave:

#!/bin/bash
#set -v
iptables='sudo iptables'
tc='sudo tc'

# This script should run before tcshaper.sh
# It will try to improve traffic: low latency, fast up, fast down.

# upload
$tc class add dev eth0 parent 1:1 classid 1:7 htb rate 3000kbit ceil
3000kbit prio 1
$tc class add dev eth0 parent 1:1 classid 1:8 htb rate 3000kbit ceil
3000kbit prio 2
#$tc class add dev eth0 parent 1:1 classid 1:9 htb rate 100kbit ceil
150kbit prio 3

$tc filter add dev eth0 parent 1:0 protocol ip prio 1 handle 7 fw
classid 1:7
$tc filter add dev eth0 parent 1:0 protocol ip prio 2 handle 8 fw
classid 1:8
#$tc filter add dev eth0 parent 1:0 protocol ip prio 3 handle 9 fw
classid 1:9

$tc qdisc add dev eth0 parent 1:7 handle 110: sfq perturb 10
$tc qdisc add dev eth0 parent 1:8 handle 120: sfq perturb 10
#$tc qdisc add dev eth0 parent 1:9 handle 130: sfq perturb 1

# FW Marks
# 7 = prio 1, 8 = prio 2, 9 = prio 3

############ Set the iptables rules ###################################
$iptables -A PREROUTING -t mangle -p tcp --sport 22     -j TOS --set-tos
Minimize-Delay

$iptables -A PREROUTING -t mangle -p tcp --sport 22     -j TOS --set-tos
Minimize-Delay
$iptables -A PREROUTING -t mangle -p tcp --dport 22     -j TOS --set-tos
Minimize-Delay
$iptables -A PREROUTING -t mangle -p udp --sport 53     -j TOS --set-tos
Minimize-Delay
$iptables -A PREROUTING -t mangle -p udp --dport 53     -j TOS --set-tos
Minimize-Delay
$iptables -A PREROUTING -t mangle -p icmp               -j TOS --set-tos
Minimize-Delay

$iptables -t mangle -A PREROUTING -p tcp -m tcp --tcp-flags SYN,RST,ACK
SYN -j MARK --set-mark 7
$iptables -t mangle -A PREROUTING -p tcp -m tcp --tcp-flags SYN,RST,ACK
SYN -j RETURN

$iptables -t mangle -A PREROUTING -m tos --tos Minimize-Delay -j MARK
--set-mark 7
$iptables -t mangle -A PREROUTING -m tos --tos Minimize-Delay -j RETURN

#$iptables -t mangle -A PREROUTING -p udp --dport 53 -j MARK  --set-mark
8
#$iptables -t mangle -A PREROUTING -p udp --dport 53 -j RETURN

########################################################################################
# download
$tc class add dev eth1 parent 2:1 classid 2:7 htb rate 5000kbit ceil
5000kbit prio 1
$tc class add dev eth1 parent 2:1 classid 2:8 htb rate 5000kbit ceil
5500kbit prio 2

$tc filter add dev eth1 parent 2:0 protocol ip prio 1 handle 7 fw
classid 2:7

$tc filter add dev eth1 parent 2:0 protocol ip prio 2 handle 8 fw
classid 2:8

$tc qdisc add dev eth1 parent 2:7 handle 110: sfq perturb 10
$tc qdisc add dev eth1 parent 2:8 handle 111: sfq perturb 10


> 
> Andy
> 
> 

