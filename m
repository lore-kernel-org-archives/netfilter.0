From: Pekka Enberg <penberg@kernel.org>
Subject: Re: [PATCH] slob: push the min alignment to long long
Date: Thu, 16 Jun 2011 19:48:48 +0300
Message-ID: <BANLkTim-C7=KVde=A-S5WXoHksaSZ0-wTw@mail.gmail.com>
References: <20110614201031.GA19848@Chamillionaire.breakpoint.cc>
	<alpine.DEB.2.00.1106141614480.10017@router.home>
Mime-Version: 1.0
Return-path: <owner-linux-mm@kvack.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=AA5c98WUxTHt45zQbAHA6OFCcSzE/ER06iKX6avxShA=;
        b=c1zzdJAZFj8szxRjf58p9k9NpHOj83fegw9rUqR+JvIZDQNfs8rSlHucl4xshnWKm4
         37kPjBFpwkTCEykcfsT6pYQcJwucZhlP2ecbgJBr9gCDru2YN9OTvF9KtkZP2QbEJnq3
         PRdnrs5cdQ7Ea8wkyz6iLdEjuPUNDVKvH4CcY=
In-Reply-To: <alpine.DEB.2.00.1106141614480.10017@router.home>
Sender: owner-linux-mm@kvack.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Lameter <cl@linux.com>
Cc: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>, Matt Mackall <mpm@selenic.com>, linux-mm@kvack.org, "David S. Miller" <davem@davemloft.net>, netfilter@vger.kernel.org, Pekka Enberg <penberg@cs.helsinki.fi>

On Wed, Jun 15, 2011 at 12:16 AM, Christoph Lameter <cl@linux.com> wrote:
> Maybe this would work too?
>
>
> Subject: slauob: Unify alignment definition
>
> Every slab has its on alignment definition in include/linux/sl?b_def.h. Extract those
> and define a common set in include/linux/slab.h.
>
> SLOB: As notes sometimes we need double word alignment on 32 bit. This gives all
> structures allocated by SLOB a unsigned long long alignment like the others do.
>
> SLAB: If ARCH_SLAB_MINALIGN is not set SLAB would set ARCH_SLAB_MINALIGN to
> zero meaning no alignment at all. Give it the default unsigned long long alignment.
>
> Signed-off-by: Christoph Lameter <cl@linux.com>

Applied, thanks!

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Fight unfair telecom internet charges in Canada: sign http://stopthemeter.ca/
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
