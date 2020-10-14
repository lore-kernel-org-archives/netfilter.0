From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: cannot use != with ct status
Date: Wed, 14 Oct 2020 20:54:11 +0200
Message-ID: <20201014185411.GA18063@salvia>
References: <CY4PR1001MB23116E94084D4CC5610C79C2E8050@CY4PR1001MB2311.namprd10.prod.outlook.com>
 <20201014100402.GA19556@salvia>
 <alpine.DEB.2.23.453.2010141221380.6472@localhost>
 <20201014103057.GA20717@salvia>
 <alpine.DEB.2.23.453.2010141825050.25415@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.23.453.2010141825050.25415@blackhole.kfki.hu>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@netfilter.org>
Cc: "Ramsay, Lincoln" <Lincoln.Ramsay@digi.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Wed, Oct 14, 2020 at 08:09:45PM +0200, Jozsef Kadlecsik wrote:
> On Wed, 14 Oct 2020, Pablo Neira Ayuso wrote:
> 
> > > > > I've just confirmed that I can't make a rule that matches ct 
> > > > > status != dnat.
> > > > 
> > > > ct status == dnat and ct state != dnat checks for _exact_ matching.
> > > > 
> > > > Then:
> > > > 
> > > >         ct status dnat
> > > > 
> > > > based on the datatype, provides a shortcut for
> > > > 
> > > >         ct status and dnat == dnat
> > > 
> > > Sorry, but it looks like really strange. "ct status nat" would be more 
> > > natural to me.
> > 
> > This is based on the ct status bits, so dnat is matching for
> > destination NAT updates (ie. IPS_DST_NAT). Then, snat is matching for
> > IPS_SRC_NAT.
> 
> I could not express myself properly. I had no problem with the shortcut 
> "ct status dnat" at all but with the expression "ct status and dnat == 
> dnat".
> 
> One could split it at the "and" part and thus the "dnat == dnat" part 
> looks confusing. If one splits at "==" then the "and" in "ct status and 
> dnat" is not quite intuitive. (I could not find the description of "and" 
> in the manpage, at least at 
> http://netfilter.org/projects/nftables/index.html.) Why is the "and" 
> keyword required? Why couldn't the same syntax be used like at "ct state"?

This uses the same syntax as ct state, for most cases:

        ct state new

is just enough.

The original thread refers to matching if the dnat bit is _unset_, ie.
inverted matching.

        # nft -i
        # add rule x y (ct status & dnat) != dnat

'&' is equivalent to 'and', it's the same token actually in the
parser. I was using 'and' instead because I was in the shell, and I
wanted to avoid escaping the &.

The parens are optional, without the parens, bitwise operation takes
precedence over comparison.

Still confusing?
