From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: empty filter on FORWARD chain with rp_filter means safe right?
Date: Fri, 8 Oct 2010 07:02:46 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1010080700580.15349@obet.zrqbmnf.qr>
References: <20101008043129.GA2017@omnius.omnisys.com> <4CAEA0D3.1020207@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CAEA0D3.1020207@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Payam Chychi <pchychi@gmail.com>
Cc: Scott Mcdermott <scott@omnisys.com>, netfilter@vger.kernel.org


On Friday 2010-10-08 06:40, Payam Chychi wrote:

> Thats correct Scott,
> in order for any systems to abuse your setup they will need to be directly
> connected to a segment that has knowledge of valid route to the end system...
> meaning if a computer is 2 hops away and the router in between has no knowledge
> of how to get to your private rfc1918 then pkts get dropped.
>
> Keep in mind that as ipv4 exhaustion gets extreme, some isps will use rcf1918
> blocks and route them either in their IGP or even EGP (aka internet routes)...

Internally yes, but externally no. And it's not really RFC1918 routes being
"used in the Internet" - instead, it is "enlarging our NAT domain". (Mobile
UMTS/HSDPA providers do this in Germany already.)
