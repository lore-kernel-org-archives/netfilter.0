From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Kernel 6.0.0 bug pptp not work
Date: Thu, 6 Oct 2022 13:01:28 +0200
Message-ID: <Yz61iLY1dud0roEB@salvia>
References: <3D70BC1B-A19E-45E3-B6BC-6B2719BA9B46@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3D70BC1B-A19E-45E3-B6BC-6B2719BA9B46@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Zaharinov <micron10@gmail.com>
Cc: Florian Westphal <fw@strlen.de>, Paolo Abeni <pabeni@redhat.com>, netfilter-devel@vger.kernel.org, netfilter <netfilter@vger.kernel.org>

On Thu, Oct 06, 2022 at 02:34:48AM +0300, Martin Zaharinov wrote:
> Hi Team
> 
> I make test image with kernel 6.0.0 and schem is :
> 
> internet <> router NAT <> windows client pptp
> 
> with l2tp all is fine and connections is establesh.
> 
> But when try to make pptp connection  stay on finish phase and not connect .
> 
> try to remove module : nf_conntrack_pptp and same not work.
> 
> 
> how to debug and find why not work ?

Can you see events via:

conntrack -E expect

?

With debugfs, you can also enable a few pr_debug() in
nf_conntrack_pptp.c, maybe they provide a hint.

Can you see the GRE flow?

I assume this is without the flowtable?
