From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: connlimit: 2.6.24.4 + p-o-m 20080331 compile problems
Date: Thu, 3 Apr 2008 16:18:32 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804031613590.1301@fbirervta.pbzchgretzou.qr>
References: <47F4C8AE.4050801@bgs.hu> <alpine.LNX.1.10.0804031427500.1301@fbirervta.pbzchgretzou.qr> <47F4DE29.5000206@bgs.hu> <47F4DFF6.5000107@bgs.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47F4DFF6.5000107@bgs.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bgs <bgs@bgs.hu>
Cc: netfilter@vger.kernel.org


(please keep the mailing list in Cc)

On Thursday 2008-04-03 15:47, Bgs wrote:
>
> Sorry for spamming, but forgot this from my previous mail:
>
> ip_tables: connlimit match: invalid size 32 != 16
>
> This is the error I get since 2.6.23 if I try the merged connlimit.
>

Fix your iptables package, it still runs with the old connlimit.
