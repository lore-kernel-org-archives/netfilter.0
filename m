From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
Subject: Re: [PATCH] slob: push the min alignment to long long
Date: Wed, 15 Jun 2011 22:12:02 +0200
Message-ID: <20110615201202.GB19593@Chamillionaire.breakpoint.cc>
References: <20110614201031.GA19848@Chamillionaire.breakpoint.cc>
 <1308089140.15617.221.camel@calx>
Mime-Version: 1.0
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
In-Reply-To: <1308089140.15617.221.camel@calx>
Sender: owner-linux-mm@kvack.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Mackall <mpm@selenic.com>
Cc: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>, Christoph Lameter <cl@linux-foundation.org>, Pekka Enberg <penberg@kernel.org>, linux-mm@kvack.org, "David S. Miller" <davem@davemloft.net>, netfilter@vger.kernel.org

* Matt Mackall | 2011-06-14 17:05:40 [-0500]:

>Ok, so you claim that ARCH_KMALLOC_MINALIGN is not set on some
>architectures, and thus SLOB does the wrong thing.
>
>Doesn't that rather obviously mean that the affected architectures
>should define ARCH_KMALLOC_MINALIGN? Because, well, they have an
>"architecture-specific minimum kmalloc alignment"?

nope, if nothing is defined SLOB asumes that alignment of long is the way
go. Unfortunately alignment of u64 maybe larger than of u32.

>This change will regress SLOB everywhere where '4' was the right answer.
I doubt that 4 was the correct answer. On x86_32 you still get 4.
Everything else might be miss-aligned for u64 types.

Sebastian

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Fight unfair telecom internet charges in Canada: sign http://stopthemeter.ca/
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
