From: David Rientjes <rientjes@google.com>
Subject: Re: [PATCH] slob: push the min alignment to long long
Date: Wed, 22 Jun 2011 16:41:54 -0700 (PDT)
Message-ID: <alpine.DEB.2.00.1106221641120.14635@chino.kir.corp.google.com>
References: <20110614201031.GA19848@Chamillionaire.breakpoint.cc> <alpine.DEB.2.00.1106141614480.10017@router.home>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=google.com; s=beta;
	t=1308786125; bh=Nawl37jQFCIUjhT1jqOwy+LDVaU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type;
	b=Q2uZAYre+uKtxLDcBHWEz0LHAuj4S7+WMZ3nu3+Wfyh19tHM1IQ0Pkv6o7IoZnf60
	 Kth9IQdU6uMA1xVDWmd7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=beta;
        h=domainkey-signature:date:from:x-x-sender:to:cc:subject:in-reply-to
         :message-id:references:user-agent:mime-version:content-type;
        bh=pQN+f5LESyWNtR7oJBmW4ulzO2qndCbmBjkWjMmGi7M=;
        b=diYWwlQUpt2cUHikIrp0Zbzy89CCLzATFJT1chDCAX05LDZyyLKXmHG70SuooQRPp5
         eDvSdOddCiWIwHLD6vOw==
In-Reply-To: <alpine.DEB.2.00.1106141614480.10017@router.home>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Lameter <cl@linux.com>
Cc: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>, Pekka Enberg <penberg@kernel.org>, Matt Mackall <mpm@selenic.com>, linux-mm@kvack.org, "David S. Miller" <davem@davemloft.net>, netfilter@vger.kernel.org, Pekka Enberg <penberg@cs.helsinki.fi>

On Tue, 14 Jun 2011, Christoph Lameter wrote:

> Index: linux-2.6/include/linux/slab.h
> ===================================================================
> --- linux-2.6.orig/include/linux/slab.h	2011-06-14 15:46:38.000000000 -0500
> +++ linux-2.6/include/linux/slab.h	2011-06-14 15:46:59.000000000 -0500
> @@ -133,6 +133,16 @@ unsigned int kmem_cache_size(struct kmem
>  #define KMALLOC_MAX_SIZE	(1UL << KMALLOC_SHIFT_HIGH)
>  #define KMALLOC_MAX_ORDER	(KMALLOC_SHIFT_HIGH - PAGE_SHIFT)
> 
> +#ifdef ARCH_DMA_MINALIGN
> +#define ARCH_KMALLOC_MINALIGN ARCH_DMA_MINALIGN
> +#else
> +#define ARCH_KMALLOC_MINALIGN __alignof__(unsigned long long)
> +#endif
> +
> +#ifndef ARCH_SLAB_MINALIGN
> +#define ARCH_SLAB_MINALIGN __alignof__(unsigned long long)
> +#endif
> +
>  /*
>   * Common kmalloc functions provided by all allocators
>   */
> Index: linux-2.6/include/linux/slab_def.h
> ===================================================================
> --- linux-2.6.orig/include/linux/slab_def.h	2011-06-14 15:47:04.000000000 -0500
> +++ linux-2.6/include/linux/slab_def.h	2011-06-14 15:50:04.000000000 -0500
> @@ -18,32 +18,6 @@
>  #include <trace/events/kmem.h>
> 
>  /*
> - * Enforce a minimum alignment for the kmalloc caches.
> - * Usually, the kmalloc caches are cache_line_size() aligned, except when
> - * DEBUG and FORCED_DEBUG are enabled, then they are BYTES_PER_WORD aligned.
> - * Some archs want to perform DMA into kmalloc caches and need a guaranteed
> - * alignment larger than the alignment of a 64-bit integer.
> - * ARCH_KMALLOC_MINALIGN allows that.
> - * Note that increasing this value may disable some debug features.
> - */
> -#ifdef ARCH_DMA_MINALIGN
> -#define ARCH_KMALLOC_MINALIGN ARCH_DMA_MINALIGN
> -#else
> -#define ARCH_KMALLOC_MINALIGN __alignof__(unsigned long long)
> -#endif
> -
> -#ifndef ARCH_SLAB_MINALIGN
> -/*
> - * Enforce a minimum alignment for all caches.
> - * Intended for archs that get misalignment faults even for BYTES_PER_WORD
> - * aligned buffers. Includes ARCH_KMALLOC_MINALIGN.
> - * If possible: Do not enable this flag for CONFIG_DEBUG_SLAB, it disables
> - * some debug features.
> - */
> -#define ARCH_SLAB_MINALIGN 0
> -#endif
> -
> -/*
>   * struct kmem_cache
>   *
>   * manages a cache.

Looks like we lost some valuable information in the comments when this got 
moved to slab.h :(
