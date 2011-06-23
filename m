From: David Rientjes <rientjes@google.com>
Subject: Re: [PATCH] slob: push the min alignment to long long
Date: Thu, 23 Jun 2011 13:24:04 -0700 (PDT)
Message-ID: <alpine.DEB.2.00.1106231323470.32059@chino.kir.corp.google.com>
References: <20110614201031.GA19848@Chamillionaire.breakpoint.cc> <alpine.DEB.2.00.1106141614480.10017@router.home> <alpine.DEB.2.00.1106221641120.14635@chino.kir.corp.google.com> <alpine.DEB.2.00.1106230934250.19668@router.home>
Mime-Version: 1.0
Return-path: <owner-linux-mm@kvack.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=google.com; s=beta;
	t=1308860654; bh=egbf1bbqCpry+rn7pAYT5BiXXEc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type;
	b=QFMiwjVfeyqyCuGSf7P1yEQbhDmMNuK3eq9ceEevt5KofX7C2hKHYL5kaPk1nIe0p
	 TOGZ51p6XjipvpzVOJqdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=beta;
        h=domainkey-signature:date:from:x-x-sender:to:cc:subject:in-reply-to
         :message-id:references:user-agent:mime-version:content-type;
        bh=gmOwg6lo81Nn2oF0HHmZHaJOvf8WnyBzqbgF0Vwm3KQ=;
        b=wHChNHiUb2Ohz88lMynTaa0VVGIRSR7zq8/byDdMu5xsqNAiJLnMWd7D+VOFGqHNFM
         Ub4IvjR8HxeUSbCjhqBg==
In-Reply-To: <alpine.DEB.2.00.1106230934250.19668@router.home>
Sender: owner-linux-mm@kvack.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Lameter <cl@linux.com>
Cc: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>, Pekka Enberg <penberg@kernel.org>, Matt Mackall <mpm@selenic.com>, linux-mm@kvack.org, "David S. Miller" <davem@davemloft.net>, netfilter@vger.kernel.org, Pekka Enberg <penberg@cs.helsinki.fi>

On Thu, 23 Jun 2011, Christoph Lameter wrote:

> Subject: slab allocators: Provide generic description of alignment defines
> 
> Provide description for alignment defines.
> 
> Signed-off-by: Christoph Lameter <cl@linux.com>

Acked-by: David Rientjes <rientjes@google.com>

Thanks!

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Fight unfair telecom internet charges in Canada: sign http://stopthemeter.ca/
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
