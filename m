From: Harald Welte <laforge@gnumonks.org>
Subject: Re: 2.4.20-pre7: ip_conntrack: table full, dropping packet.
Date: Mon, 21 Oct 2002 23:55:34 +0200
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <20021021215534.GB3039@naboo.club.berlin.ccc.de>
References: <20021021201644.166db824.skraw@ithnet.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20021021201644.166db824.skraw@ithnet.com>
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephan von Krawczynski <skraw@ithnet.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, Netfilter Mailinglist <netfilter@lists.netfilter.org>

On Mon, Oct 21, 2002 at 08:16:44PM +0200, Stephan von Krawczynski wrote:
> Hello all,

Hi Stephan. Don't know if you remember me, but we've met at some IN e.V.
meetings in the past ;)

> After several days running kernel 2.4.20-pre7 I came across the syslogged
> message:
> 
> kernel: ip_conntrack: table full, dropping packet.
> 
> This box runs about 10 rules for destination nat. My simple question:
> is this a bug, or a need to tune something? If it is a bug, is there a
> later kernel that has it fixed?

it's not about the number of NAT rules, but the number of connections
going on through your machine.

the FAQ (to be found at www.netfilter.org) describes how to raise the
number of connection tracking table entries.

> Regards,
> Stephan

-- 
Live long and prosper
- Harald Welte / laforge@gnumonks.org               http://www.gnumonks.org/
============================================================================
GCS/E/IT d- s-: a-- C+++ UL++++$ P+++ L++++$ E--- W- N++ o? K- w--- O- M- 
V-- PS+ PE-- Y+ PGP++ t++ 5-- !X !R tv-- b+++ DI? !D G+ e* h+ r% y+(*)
