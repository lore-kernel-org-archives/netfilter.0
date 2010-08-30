From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: IPv6 routing
Date: Mon, 30 Aug 2010 12:43:34 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1008301242380.15716@obet.zrqbmnf.qr>
References: <4C7B8741.3030908@abpni.co.uk> <4C7B89EB.7090807@abpni.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C7B89EB.7090807@abpni.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Tripathy <jonnyt@abpni.co.uk>
Cc: netfilter@vger.kernel.org

On Monday 2010-08-30 12:37, Jonathan Tripathy wrote:
>
> 06:29:37.241590 IP6 2001:470:1f09:dc5::1 > ff02::1:ff00:2: ICMP6, neighbor
> solicitation, who has 2001:470:1f09:dc5::2, length 32
> 06:29:37.241800 IP6 2001:470:1f09:dc5::2 > 2001:470:1f09:dc5::1: ICMP6,
> neighbor advertisement, tgt is 2001:470:1f09:dc5::2, length 32
>
> It seems like netfilter isn't marking the advertisements as "related" to the
> solicitation request. I think that this is becuase the request was sent to
> ff02::1:ff00:2, but the reply came from 2001:470:1f09:dc5::2.

advertisements need not strictly be a reply to a solicit.
