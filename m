From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Blocking in NAT
Date: Sat, 7 May 2011 16:54:04 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1105071653100.31190@obet.zrqbmnf.qr>
References: <C9EAA345.75ED%jlay@slave-tothe-box.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <C9EAA345.75ED%jlay@slave-tothe-box.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Lay <jlay@slave-tothe-box.net>
Cc: Netfilter <netfilter@vger.kernel.org>

On Saturday 2011-05-07 15:20, James Lay wrote:

>Hey All,
>
>So?once upon a time one could block using NAT, which was nice since I run
>a spamfilter that grabs everything coming in to port 25 with:
>
>iptables -t nat -A PREROUTING -m physdev --physdev-in eth0 ! -s 10.0.0.0/8
>-p tcp --dport 25 -j DNAT --to-destination 10.0.0.1:25
>
>For some reason, filtering in the nat table was deemed bad, so now I can
>no longer drop things there.  So my question is, how do I block say...a
>spammer from sending to port 25 now?  I can't use:
>
>iptables -t nat -i PREROUTING -m physdev --physdev-in eth0 -s naughty.ip
>-j DROP
>or
>iptables -t nat -i PREROUTING -m physdev --physdev-in eth0 -s naughty.ip
>-j REJECT


iptables -A INPUT (or FORWARD, depending on use case) -m physdev 
--physdev-in eth0 -s naughty.ip (-p tcp --dport 25) -j REJECT
