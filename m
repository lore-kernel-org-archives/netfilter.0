From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: connlimit: 2.6.24.4 + p-o-m 20080331 compile problems
Date: Thu, 3 Apr 2008 15:47:15 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804031546330.1301@fbirervta.pbzchgretzou.qr>
References: <47F4C8AE.4050801@bgs.hu> <alpine.LNX.1.10.0804031427500.1301@fbirervta.pbzchgretzou.qr> <47F4DE29.5000206@bgs.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47F4DE29.5000206@bgs.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Bgs <bgs@bgs.hu>
Cc: netfilter@vger.kernel.org


On Thursday 2008-04-03 15:39, Bgs wrote:

> My problem is that it doesn't seem to work with the merged version:
>
> iptables -A INPUT -p tcp -m tcp --tcp-flags FIN,SYN,RST,ACK SYN -m connlimit 
> --connlimit-above 20 --connlimit-mask 32 -j DROP
> iptables: Invalid argument

Try looking in the kernel log (dmesg) what ip_tables has to say.
