From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: [RFC] SLOB breaks netfilter
Date: Tue, 7 Jun 2011 23:27:25 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1106072316370.3052@frira.zrqbmnf.qr>
References: <20110607210651.GA11159@Chamillionaire.breakpoint.cc>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <20110607210651.GA11159@Chamillionaire.breakpoint.cc>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
Cc: Patrick McHardy <kaber@trash.net>, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org, tglx@linutronix.de

On Tuesday 2011-06-07 23:06, Sebastian Andrzej Siewior wrote:

>After more debugging I found the root cause: In
>check_entry_size_and_hooks() I see:
>              if ((unsigned long)e % __alignof__(struct arpt_entry) != 0 ||
>
>and SLOB defines:
>
>|#ifdef ARCH_DMA_MINALIGN
>|#define ARCH_KMALLOC_MINALIGN ARCH_DMA_MINALIGN
>|#else
>|#define ARCH_KMALLOC_MINALIGN __alignof__(unsigned long)
>|#endif
>| 
>|#ifndef ARCH_SLAB_MINALIGN
>|#define ARCH_SLAB_MINALIGN __alignof__(unsigned long)
>|#endif
>
>Using u64 instead solved the problem. So my question is this check
>really required?

The e % .. check is strictly needed. We might be doing *(uint64_t *)e
at some point, and so alignment is of utmost importance.

THOUGH: I notice that alignof(uint64_t) yields 8 even for i586-linux-gnu
mode, but for 32-bit mode, e % 4 is enough.
To be investigated more tomorrow :)
