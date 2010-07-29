From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: strange log on gateway inside []
Date: Thu, 29 Jul 2010 10:52:46 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1007291051570.10386@obet.zrqbmnf.qr>
References: <4C513E0B.6040005@unipex.it>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C513E0B.6040005@unipex.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michele Petrazzo - Unipex <michele.petrazzo@unipex.it>
Cc: netfilter@vger.kernel.org

On Thursday 2010-07-29 10:38, Michele Petrazzo - Unipex wrote:

> Hi list,
> I have a firewall that log some strange, for me, packets on the OUTPUT chain
> that I haven't see before. This is a typical log:
>
> Firewall DROPOUT- IN= OUT=eth0 SRC=MYPUBBIP DST=188.153.11.87
>    LEN=92 TOS=0x00 PREC=0xC0 TTL=64 ID=49303 PROTO=ICMP TYPE=3 CODE=3
> [SRC=188.153.11.87 DST=MYADDITIONALIP LEN=64 TOS=0x00 PREC=0x00 TTL=118
> ID=28851 DF PROTO=TCP SPT=12387 DPT=51684 WINDOW=17424 RES=0x00 ACK SYN URGP=0
> ]
>
> My output chain:
> *filter
> :OUTPUT DROP [4831251:620928037]
> -A OUTPUT -o lo -j ACCEPT
> -A OUTPUT -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
> -A OUTPUT -j LOG --log-prefix "Firewall DROPOUT- "

So what's left is INVALID packets.

> The question. Why I see this log and why my fw want to talk with external and,
> the last, why the kernel double log talk and one is inside the brackets  [ ] ?

Because those are the contents of the ICMP packet. See the RFC.
