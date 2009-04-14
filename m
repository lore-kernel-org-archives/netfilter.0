From: "Lloyd Standish" <lloyd@crnatural.net>
Subject: Re: load balancing between ppp0 and ppp1, private IPs
Date: Mon, 13 Apr 2009 22:50:31 -0600
Message-ID: <op.usc0wwtxx1lyi3@localhost>
References: <op.usa60utux1lyi3@localhost>
 <49E2E0CE.8010203@standarduniversal.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49E2E0CE.8010203@standarduniversal.com.au>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Brian Austin - Standard Universal <brian@standarduniversal.com.au>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello,

To review, in my previous post I wrote:

>> I want to use load balancing to allow simultaneous use of 2 relatively slow GPRS (ppp over GSM cellular phone) modems.  I have a custom-compiled Ubuntu kernel 2.6.20.3 with Debian Etch, iptables v1.3.8.
>>
>> The modems are seen by the system as regular serial modems, ppp0 and ppp1.  I also have a LAN (eth0).
>>
>> My interfaces, ppp0 and ppp1 have dynamically assigned *private* IP numbers.  For example:
>>
>> ppp0: 10.60.32.71
>> ppp1: 10.40.89.42
>>
>> My strategy for load balancing is to use conntrack to save the mark of the *first* packet, and mark all subsequent packets for that connection the same way.  Two custom routing tables are set up, each set to push traffic to one of the 2 interfaces, according to the packet mark:
>>
>> TABLE    INTERFACE    MARK
>> rt_link1   ppp0                1
>> rt_link2   ppp1                2
>>

Using cat /proc/net/ip_conntrack, my tcp connections show up duly marked with 1 and 2:

tcp      6 25 TIME_WAIT src=10.60.32.71 dst=192.16.204.139 sport=36753 dport=80 packets=5 bytes=928 src=192.16.204.139 dst=10.60.32.71 sport=80 dport=36753 packets=5 bytes=400 [ASSURED] mark=1 secmark=0 use=1
tcp      6 431999 ESTABLISHED src=10.60.32.71 dst=72.249.38.123 sport=33089 dport=80 packets=235 bytes=15019 src=72.249.38.123 dst=10.60.32.71 sport=80 dport=33089 packets=238 bytes=354112 [ASSURED] mark=2 secmark=0 use=1
tcp      6 431929 ESTABLISHED src=10.60.32.71 dst=207.171.166.176 sport=60476 dport=80 packets=15 bytes=1697 src=207.171.166.176 dst=10.60.32.71 sport=80 dport=60476 packets=14 bytes=14607 [ASSURED] mark=2 secmark=0 use=1

PROBLEM: as you can see, all the connections are being sent to 10.60.32.71, which is ppp0 (my default route).  The connections with the "2" mark should be sent through ppp1 (10.40.89.42)  (Note that these IP numbers are examples only and are dynamically assigned upon dialup.

This is confirmed by netstat:
debiandesk:/home/lloyd#  netstat -i
Kernel Interface table
Iface   MTU Met   RX-OK RX-ERR RX-DRP RX-OVR    TX-OK TX-ERR TX-DRP TX-OVR Flg
eth0   1500 0         0      0      0      0     7221      0      0      0 BMRU
lo    16436 0      1674      0      0      0     1674      0      0      0 LRU
ppp0   1500 0     19505      0      0      0    19830      0      0      0 MOPRU
ppp1   1500 0         3      0      0      0        3      0      0      0 MOPRU

I have suspected kernel misconfiguration.  (Wouldn't iptables complain if I try to create a rule that names a destination module that is missing?)  I have tried messing with the nat rules, loading modules such as ip_nat, and much digging and studying of posts on load balancing with iptables.

My kernel is configured with CONFIG_IP_MULTIPLE_TABLES=y, and all the iptables stuff is either compiled in or available as modules.

The script for my load balancing attempt is below.  I'm hoping someone will spot the problem so I can get this working.  I can post output from lsmod, etc, if needed.

#!/bin/bash
modprobe xt_connmark
modprobe xt_statistic
modprobe xt_mark

# I read that the following is required for state RELATED to be set - ?
modprobe nf_conntrack_ftp

echo 1 >| /proc/sys/net/ipv4/ip_forward
echo 0 >| /proc/sys/net/ipv4/conf/all/rp_filter

# extract IP for each ppp interface
src0=`ip route show dev ppp0 | head -n1 | cut --delimiter=" " --fields=10`
src1=`ip route show dev ppp1 | head -n1 | cut --delimiter=" " --fields=10`

if echo "$src1" | grep 'ppp1'
then
	echo "ppp1 is not up"
	exit 1;
fi
if echo "$src0" | grep 'ppp0'
then
	echo "ppp0 is not up"
	exit 1;
fi

# flush iptables entries (temporarily set policies to ACCEPT)
iptables -t filter -F
iptables -t filter -X
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -t mangle -X
iptables -t filter -P INPUT ACCEPT
iptables -t filter -P OUTPUT ACCEPT
iptables -t filter -P FORWARD ACCEPT
#iptables -t mangle -A PREROUTING -d 192.168.1.0/24 -j ACCEPT

# restore the fwmark on packets that belong to an existing connection
iptables -A PREROUTING -t mangle -m state --state ESTABLISHED,RELATED -j CONNMARK --restore-mark

# any packets with mark can be accepted at this point
iptables -A PREROUTING -t mangle -m mark ! --mark 0 -j ACCEPT

# set ALL packets to mark 1 (ppp0)
iptables -A PREROUTING -p tcp -t mangle -j MARK --set-mark 1

# set every other packet (50%) to mark 2 (ppp1)
iptables -A PREROUTING -p tcp -t mangle -m statistic --mode nth --every 2 --packet 0 -j MARK --set-mark 2

# save mark in connection table
iptables -A PREROUTING -t mangle -j CONNMARK --save-mark

# I am unclear on the following.   Do nat on packets to secondary interface ppp1
iptables -t nat -A POSTROUTING -o ppp1 -m state --state NEW,RELATED -j MASQUERADE

# other non-working ideas
#iptables -t nat -A POSTROUTING -o ppp0 -j SNAT --to-source $src0
#iptables -t nat -A POSTROUTING -o ppp1 -j SNAT --to-source $src1

# add rt_link1 as new routing table, if not already
if ! cat /etc/iproute2/rt_tables | grep -q '^251'
then
	echo '251     rt_link1' >> /etc/iproute2/rt_tables
fi

# add rt_link2 as new routing table, if not already
if ! cat /etc/iproute2/rt_tables | grep -q '^252'
then
	echo '252     rt_link2' >> /etc/iproute2/rt_tables
fi

# add default routes for new tables
ip route flush table rt_link1 2>/dev/null
ip route add table rt_link1 default dev ppp0
#ip route add default via 10.60.255.254 table rt_link1
ip route flush table rt_link2 2>/dev/null
ip route add table rt_link2 default dev ppp1
#ip route add default via 10.60.255.254 table rt_link2

#add fwmark rules
if ! ip rule show | grep -q 'rt_link2'
then
	ip rule add fwmark 1 table rt_link1
	ip rule add fwmark 2 table rt_link2
fi
ip route flush cache
<end of script>


Here's the output of 'ip rule show':

debiandesk:/home/lloyd# ip rule show
0:      from all lookup 255
32764:  from all fwmark 0x2 lookup rt_link2
32765:  from all fwmark 0x1 lookup rt_link1
32766:  from all lookup main
32767:  from all lookup default
