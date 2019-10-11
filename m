From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nft -- documentation on fib_addrtype missing, more data
Date: Fri, 11 Oct 2019 12:04:04 +0200
Message-ID: <20191011100404.ta2jwird3s5peq4d@salvia>
References: <5fbab89f-ee32-44f7-b8d7-cf63ba65bc0e@satchell.net>
 <20191011082926.4wfyhysc6joofuel@salvia>
 <20191011094721.GL25052@breakpoint.cc>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191011094721.GL25052@breakpoint.cc>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Westphal <fw@strlen.de>
Cc: Stephen Satchell <list@satchell.net>, netfilter@vger.kernel.org

On Fri, Oct 11, 2019 at 11:47:21AM +0200, Florian Westphal wrote:
> Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> > # nft describe fib saddr type
> > fib expression, datatype fib_addrtype (fib address type) (basetype integer), 32 bits
> > 
> > pre-defined symbolic constants (in decimal):
> [..]
> 
> It might make sense to teach nft describe to also work with the type,
> so you could get the symbolic constants via
> 
> nft describe fib_addrtype
> 
> What do you think?

That's doable, yes.
