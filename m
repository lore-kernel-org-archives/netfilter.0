From: "David S. Miller" <davem@davemloft.net>
Subject: Re: Netfilter ipt_hashlimit
Date: Mon, 14 Mar 2005 21:41:38 -0800
Message-ID: <20050314214138.025b2e43.davem@davemloft.net>
References: <20050310222934.C1044@flint.arm.linux.org.uk>
	<E1D9itD-00039G-00@gondolin.me.apana.org.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <E1D9itD-00039G-00@gondolin.me.apana.org.au>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: rmk+lkml@arm.linux.org.uk, linux-kernel@vger.kernel.org, netfilter@lists.netfilter.org

On Fri, 11 Mar 2005 23:05:11 +1100
Herbert Xu <herbert@gondor.apana.org.au> wrote:

> Russell King <rmk+lkml@arm.linux.org.uk> wrote:
> > With current-ish Linus 2.6 BK, I'm seeing this:
> > 
> > net/ipv4/netfilter/ipt_hashlimit.c:96: warning: type defaults to `int' in declaration of `DECLARE_LOCK'
> > net/ipv4/netfilter/ipt_hashlimit.c:96: warning: parameter names (without types) in function declaration
> > 
> > Looks like ipt_hashlimit.c is missing an include?
> 
> Indeed.  It should include lockhelp.h directly.
> 
> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

Applied, thanks Herbert.
