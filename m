From: sean darcy <seandarcy2@gmail.com>
Subject: where are my udp packets going?
Date: Sat, 15 Nov 2008 16:04:41 -0500
Message-ID: <gfndh9$n0s$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I'm trying to setup port forwarding for a VOIP server that uses IAX 
packets, port 4569:

+ /sbin/iptables -t nat -A PREROUTING -i eth0 -p udp --dport 4569 -j 
DNAT --to 10.10.10.180:4569
+ /sbin/iptables -A FORWARD -p udp -m state --state NEW -d 10.10.10.180 
--dport 4569 -j ACCEPT

but the packets aren't showing up at 10.10.10.180.

I put in a bunch of log statements:

$IPT -t raw -A PREROUTING -i $EXTIF -p udp --dport 4569 -j LOG 
--log-prefix "iax packet RAW:   "
$IPT -t nat -A PREROUTING -i $EXTIF -p udp --dport 4569 -j DNAT --to 
10.10.10.180:4569
$IPT -t nat -A PREROUTING -i $EXTIF -p udp --dport 4569 -j LOG 
--log-prefix "iax packet PRE NAT:   "
$IPT -A FORWARD -p udp -m state --state NEW -d 10.10.10.180 --dport 4569 
-j ACCEPT
$IPT -A FORWARD -p udp  --dport 4569 -d 10.10.10.180    -j LOG 
--log-prefix "iax packet FORWARD:  "
$IPT -t nat -A POSTROUTING  -p udp --dport 4569         -j LOG 
--log-prefix "iax packet POST:   "

So, I would expect each iax packet to show up sequentially as:
iax packet RAW:
iax packet PRE NAT:
iax packet FORWARD:
iax packet POST:

But no:

I get lots of "iax packet RAW:   " , and an "iax packet FORWARD:  " 
every 2 -  10 "iax packet RAW:  " messages. That's it. no postrouting, 
no prerouting nat.

And the voip server sees no iax packets.

Where are they going?

sean


