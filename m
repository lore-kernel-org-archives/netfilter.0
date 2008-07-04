From: Simon Perreault <simon.perreault@viagenie.ca>
Subject: Re: NFQUEUE hello world-style program
Date: Fri, 4 Jul 2008 08:28:37 -0400
Message-ID: <200807040828.37923.simon.perreault@viagenie.ca>
References: <200807031607.21168.simon.perreault@viagenie.ca> <20080704092637.GA30729@bayen.regit.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20080704092637.GA30729@bayen.regit.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Eric Leblond <eric@inl.fr>
Cc: netfilter@vger.kernel.org

On Friday 04 July 2008 05:26:38 Eric Leblond wrote:
> You are missing the unbind  bind
>
> 	nfq_unbind_pf(h, AF_INET);
> 	nfq_bind_pf(h, AF_INET);
>
> You can have a look at for working  code:
>  * utils/nfqnl_test.c in libnetfilter_queue sources
>  *
> http://software.inl.fr/trac/browser/mirror/edenwall/nufw/trunk/nufw/src/nuf
>w/packetsrv.c#L219

Many thanks!

I suppose if I want to bind to multiple families I do as in packetsrv.c, 
right?

nfq_unbind_pf(h, AF_INET);
nfq_bind_pf(h, AF_INET);
nfq_unbind_pf(h, AF_INET6);
nfq_bind_pf(h, AF_INET6);

And out of curiosity, is the unbind really needed or is it a relic of the 
past? :)

Thanks again,
Simon

-- 
Please try Numb, a STUN/TURN server implementation.
Free access at http://numb.viagenie.ca/.
