From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: iptables problem: conntrack rev 2 does not support port ranges
Date: Mon, 19 Sep 2011 13:44:22 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1109191343280.12698@frira.zrqbmnf.qr>
References: <4E772599.80602@lists.schang.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4E772599.80602@lists.schang.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brian Schang <netfilter@lists.schang.net>
Cc: netfilter@vger.kernel.org

On Monday 2011-09-19 13:20, Brian Schang wrote:

> I dug into this a little bit and discovered:
> # iptables -A test -m conntrack -p tcp --ctorigdstport 22 -j ACCEPT
> iptables v1.4.12.1: conntrack rev 2 does not support port ranges
> Try `iptables -h' or 'iptables --help' for more information.
>
> With some Googling, I discovered that Tom Eastep had encountered the same
> issue. He submitted a patch for iptables and Jan Engelhardt ultimately released
> 'iptables 1.4.12.1'.

(It was not me who released 1.4.12.1.)

Tom Eastep's fix was only merged after that release.
