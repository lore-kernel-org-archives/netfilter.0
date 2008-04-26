From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: udp connection moved from ASSURED to UNREPLIED
Date: Sat, 26 Apr 2008 20:15:32 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804262013110.20150@fbirervta.pbzchgretzou.qr>
References: <Pine.LNX.4.63.0804261543110.6453@sip2>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.63.0804261543110.6453@sip2>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Aymeric Moizard <jack@atosc.org>
Cc: netfilter@vger.kernel.org


On Saturday 2008-04-26 16:07, Aymeric Moizard wrote:
>
>
> ipv4     2 udp      17 178 src=192.168.2.50 dst=212.27.XX.X sport=6010
> dport=5060 packets=48 bytes=4074 src=212.27.XX.X dst=88.171.XX.XX sport=5060
> dport=6010 packets=379 bytes=24499 [ASSURED] mark=0 secmark=0 use=1

Hiding IP addresses is totally meaninless, we all know it is
88.171.117.238--212.27.52.5 you are talking to. That probably
does not even buy us a beer. Anyway...

> Each 30minutes, the box is sengind an ARP request and suddenly, the incoming
> packets from 212.27.XX.X gets rejected with icmp "port unreachable" as if the
> conntrack was deleted upon receiving the arp request from the dsl box.

So, throw up the conntrack event listener (`conntrack -E`) next
to a tcpdump and see what happens on the conntrack table when
that ARP is seen.

Or maybe your keepalive packets come in intervals less than the
UDP timeout.
