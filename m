From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Troubles with MARK target in 2.6.28
Date: Mon, 12 Jan 2009 08:15:51 +0100 (CET)
Message-ID: <alpine.LSU.2.00.0901120814250.21692@fbirervta.pbzchgretzou.qr>
References: <86617ABF8F494F2A940C18251E3DC8D0@Hakkenden> <496AE0E3.1030009@trash.net> <496AEC64.5040202@trash.net>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <496AEC64.5040202@trash.net>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick McHardy <kaber@trash.net>
Cc: "Nikolay S. Rybalov" <nowhere@hakkenden.ath.cx>, netfilter@vger.kernel.org, Netfilter Development Mailinglist <netfilter-devel@vger.kernel.org>


On Monday 2009-01-12 08:08, Patrick McHardy wrote:
> Patrick McHardy wrote:
>> Does this patch fix it?
>
> Jan, display of NFPROTO_UNSPEC targets and matches in
> /proc/net/ip_tables_targets etc. is also broken.

I can tell it is not (more like a missing feature if you will),
because /proc/net/ip_t* is for IPv4 only, and /proc/net/ip6_t*
is for IPv6 only. I had a patch somewhere that added a better
overview, let's see where in my git realms that disappeared...

