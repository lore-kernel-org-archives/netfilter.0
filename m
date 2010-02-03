From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [patch 1/1] net/ipv4/netfilter/nf_nat_snmp_basic.c: correct the
 size argument to kzalloc
Date: Tue, 2 Feb 2010 16:39:48 -0800
Message-ID: <20100202163948.fa2c8d1a.akpm@linux-foundation.org>
References: <201002022244.o12MiZGL019252@imap1.linux-foundation.org>
	<4B68C540.1060008@trash.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B68C540.1060008@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Patrick McHardy <kaber@trash.net>
Cc: netfilter@vger.kernel.org, julia@diku.dk, davem@davemloft.net

On Wed, 03 Feb 2010 01:37:20 +0100
Patrick McHardy <kaber@trash.net> wrote:

> akpm@linux-foundation.org wrote:
> > From: Julia Lawall <julia@diku.dk>
> > 
> > obj has type struct snmp_object **, not struct snmp_object *.  But indeed
> > it is not even clear why kmalloc is needed.  The memory is freed by the
> > end of the function, so the local variable of pointer type should be
> > sufficient.
> 
> This one is already queued in nf-next-2.6.git.

Recently?  It wasn't in today's linux-next.
