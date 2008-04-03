From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: connlimit: 2.6.24.4 + p-o-m 20080331 compile problems
Date: Thu, 3 Apr 2008 16:36:00 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804031635250.1301@fbirervta.pbzchgretzou.qr>
References: <47F4C8AE.4050801@bgs.hu> <alpine.LNX.1.10.0804031427500.1301@fbirervta.pbzchgretzou.qr> <47F4DE29.5000206@bgs.hu> <47F4DFF6.5000107@bgs.hu> <alpine.LNX.1.10.0804031613590.1301@fbirervta.pbzchgretzou.qr> <47F4EA96.1010004@bgs.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47F4EA96.1010004@bgs.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Bgs <bgs@bgs.hu>
Cc: netfilter@vger.kernel.org


On Thursday 2008-04-03 16:32, Bgs wrote:

> Just recompiled the latest iptables (1.4.0) from vanilla source:
>
> root@db05:/usr/src/iptables# iptables -A INPUT -p tcp -m tcp --tcp-flags 
> FIN,SYN,RST,ACK SYN -m connlimit --connlimit-above 20 --connlimit-mask 32 -j 
> DROP
> iptables: Invalid argument
> root@db05:/usr/src/iptables/root# dmesg
> cannot load conntrack support for address family 2

Fix your kernel, you need connection tracking enabled. :D



-- 
make boldconfig -- to boldly select what no one has selected before
