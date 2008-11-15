From: sean darcy <seandarcy2@gmail.com>
Subject: Re: where are my udp packets going?
Date: Sat, 15 Nov 2008 18:54:55 -0500
Message-ID: <gfnngg$gvn$1@ger.gmane.org>
References: <gfndh9$n0s$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <gfndh9$n0s$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

sean darcy wrote:
> I'm trying to setup port forwarding for a VOIP server that uses IAX 
> packets, port 4569:
> 
> + /sbin/iptables -t nat -A PREROUTING -i eth0 -p udp --dport 4569 -j 
> DNAT --to 10.10.10.180:4569
> + /sbin/iptables -A FORWARD -p udp -m state --state NEW -d 10.10.10.180 
> --dport 4569 -j ACCEPT
> 
> but the packets aren't showing up at 10.10.10.180.
> 
> I put in a bunch of log statements:
> 
> $IPT -t raw -A PREROUTING -i $EXTIF -p udp --dport 4569 -j LOG 
> --log-prefix "iax packet RAW:   "
> $IPT -t nat -A PREROUTING -i $EXTIF -p udp --dport 4569 -j DNAT --to 
> 10.10.10.180:4569
> $IPT -t nat -A PREROUTING -i $EXTIF -p udp --dport 4569 -j LOG 
> --log-prefix "iax packet PRE NAT:   "
> $IPT -A FORWARD -p udp -m state --state NEW -d 10.10.10.180 --dport 4569 
> -j ACCEPT
> $IPT -A FORWARD -p udp  --dport 4569 -d 10.10.10.180    -j LOG 
> --log-prefix "iax packet FORWARD:  "
> $IPT -t nat -A POSTROUTING  -p udp --dport 4569         -j LOG 
> --log-prefix "iax packet POST:   "
> 
> So, I would expect each iax packet to show up sequentially as:
> iax packet RAW:
> iax packet PRE NAT:
> iax packet FORWARD:
> iax packet POST:
> 
> But no:
> 
> I get lots of "iax packet RAW:   " , and an "iax packet FORWARD:  " 
> every 2 -  10 "iax packet RAW:  " messages. That's it. no postrouting, 
> no prerouting nat.
> 
> And the voip server sees no iax packets.
> 
> Where are they going?
> 
> sean
> 

Well, they're going to input.


I put in a log statement for INPUT:

$IPT -t raw -A PREROUTING -i $EXTIF -p udp --dport 4569 -j LOG 
--log-prefix "iax packet RAW:   "
$IPT -t nat -A PREROUTING -i $EXTIF -p udp --dport 4569 -j DNAT --to 
10.10.10.180:4569
$IPT -t nat -A PREROUTING -i $EXTIF -p udp --dport 4569 -j LOG 
--log-prefix "iax packet PRE NAT:   "
$IPT -A INPUT   -p udp  --dport 4569                    -j LOG 
--log-prefix "iax packet INPUT:  "
$IPT -A FORWARD -p udp  --dport 4569 -d 10.10.10.180    -j LOG 
--log-prefix "iax packet FORWARD:  "

and look:

kernel: iax packet RAW:   IN=eth0 OUT= 
MAC=00:48:54:8b:ab:29:00:1a:e2:84:bf:3b:08:00 SRC=76.zzz.xxx.yyy 
DST=64.61.167.178 LEN=53 TOS=0x04 PREC=0x00 TTL=49 ID=19483 PROTO=UDP 
SPT=4569 DPT=4569 LEN=33
kernel: iax packet INPUT:  IN=eth0 OUT= 
MAC=00:48:54:8b:ab:29:00:1a:e2:84:bf:3b:08:00 SRC=76.zzz.xxx.yyy 
DST=64.61.167.178 LEN=53 TOS=0x04 PREC=0x00 TTL=49 ID=19483 PROTO=UDP 
SPT=4569 DPT=4569 LEN=33
kernel: iax packet RAW:   IN=eth0 OUT= 
MAC=00:48:54:8b:ab:29:00:1a:e2:84:bf:3b:08:00 SRC=66.zzz.xxx.yyy 
DST=64.61.167.178 LEN=69 TOS=0x00 PREC=0x00 TTL=55 ID=16258 DF PROTO=UDP 
SPT=4569 DPT=4569 LEN=49
kernel: iax packet FORWARD:  IN=eth0 OUT=eth1 SRC=66.zzz.xxx.yyy 
DST=10.10.10.180 LEN=69 TOS=0x00 PREC=0xA0 TTL=54 ID=16258 DF PROTO=UDP 
SPT=4569 DPT=4569 LEN=49

In other words, it's port forwarding all iax except from 76.

So then I put in:

$IPT -t nat -A PREROUTING -s 76.zzz.xxx.yyy -p udp --dport 4569 -j DNAT 
--to 10.10.10.180:4569

And that made no difference!

Any help really appreciated.

sean

