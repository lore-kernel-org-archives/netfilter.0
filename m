From: Christoph Lameter <cl@linux.com>
Subject: Re: [PATCH] slob: push the min alignment to long long
Date: Tue, 14 Jun 2011 15:40:16 -0500 (CDT)
Message-ID: <alpine.DEB.2.00.1106141538560.1613@router.home>
References: <20110614201031.GA19848@Chamillionaire.breakpoint.cc>
Mime-Version: 1.0
Return-path: <owner-linux-mm@kvack.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1308084019; bh=rLM5FPKTjIWLXeDrSCkO8jaAWb9u0Qv4Y2/YkjYkJ4Q=; h=X-Yahoo-Newman-Property:X-YMail-OSG:X-Yahoo-SMTP:Received:Received:Date:From:X-X-Sender:To:cc:Subject:In-Reply-To:Message-ID:References:User-Agent:MIME-Version:Content-Type; b=A99f3u6Zd6pHUYwa8T5T4z6kKxIubz6HwRd4lWIlNgJgEFlzzxzKGI1WiD0QaFNjSJMi9U0jhz+So1uzDSHS1+sSuBie9RYUkcKr95kQY37doVKpgFNLG0uC4cr/qJuhUslgHstu+qRSZ6fXb/1Oy2z4pFj3W8rowDcjDrAkNeg=
In-Reply-To: <20110614201031.GA19848@Chamillionaire.breakpoint.cc>
Sender: owner-linux-mm@kvack.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
Cc: Pekka Enberg <penberg@kernel.org>, Matt Mackall <mpm@selenic.com>, linux-mm@kvack.org, "David S. Miller" <davem@davemloft.net>, netfilter@vger.kernel.org

On Tue, 14 Jun 2011, Sebastian Andrzej Siewior wrote:

> Therefore I'm changing the default alignment of SLOB to 8. This fixes my
> netfilter problems (and probably other) and we have consistent behavior
> across all SL*B allocators.

If you do that then all slab allocators do the same and we may move
that alignment stuff into include/linux/slab.h instead.

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Fight unfair telecom internet charges in Canada: sign http://stopthemeter.ca/
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
