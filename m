From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: reroute-check
Date: Wed, 2 Apr 2008 23:55:54 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804022347540.26216@fbirervta.pbzchgretzou.qr>
References: <D9E16B7CCBDE47EEAE5C6C1A5E00BE24@shs1>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <D9E16B7CCBDE47EEAE5C6C1A5E00BE24@shs1>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Steffen Heil <lists@steffen-heil.de>
Cc: netfilter@vger.kernel.org


On Tuesday 2008-04-01 23:49, Steffen Heil wrote:
>
> In which cases does the reroute-check in this picture take place?
> http://jengelh.hopto.org/images/nf-packet-flow.png
>
> I see the packets in raw.OUTPUT and mangle.OUTPUT.
> I do set a mark in mangle.OUTPUT (and I log it to be sure).

And once you change the mark (which is a parameter which can
influence routing), reroute check happens.

> Then I see the packet in filter.OUTPUT and mangle.POSTROUTING.
>
> Note: I don't see it in nat.OUTPUT or nat.POSTROUTING, but I think that's
> okay.

nat only sees first-packets of connections.

> But an "ip rule fwmark" does not work. (out-interface stays the same, even
> though the routing table refered by the ip rule only contains a default
> gateway on another interface.)
> So I think the reroute-check is not done.

I hate it to guess what you did. Fact:

# iptables -t mangle -A OUTPUT -d 134.76.13.21 -j LOG
# iptables -t mangle -A OUTPUT -j MARK --set-mark 17
# ip rule add fwmark 17 table 17
# ip route add default via 192.168.222.36 table 17
# iptables -A OUTPUT -d 134.76.13.21 -j LOG --log-prefix "filter: "
# iptables -t mangle -A POSTROUTING -d 134.76.13.21 -j LOG --log-prefix "postrouting: "
# tcpdump -lni rtl0 &
# ping -c1 134.76.13.21
23:51:53.137967 IP 10.10.106.161 > 134.76.13.21: ICMP echo request, id 27487,
seq 1, length 64
# dmesg
[52474.126384] filter: IN= OUT=sis0 SRC=10.10.106.161 DST=134.76.13.21 LEN=84 TOS=0x00
PREC=0x00 TTL=64 ID=0 DF PROTO=ICMP TYPE=8 CODE=0 ID=53086 SEQ=1 
[52562.055012] postrouting: IN= OUT=rtl0 SRC=10.10.106.161 DST=134.76.13.21 LEN=84 TOS=0x00
PREC=0x00 TTL=64 ID=0 DF PROTO=ICMP TYPE=8 CODE=0 ID=16994 SEQ=1

So it's not directly visible in OUTPUT it seems.

> So: Does the kernel always reroute? Or does it have to be triggered?

grep "Reroute for ANY change" net/ipv4/netfilter/iptable_mangle.c.

Basically "any" means saddr,daddr mark and tos, the four routing-influencing
parameters.
