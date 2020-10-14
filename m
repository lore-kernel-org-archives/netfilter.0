From: Jozsef Kadlecsik <kadlec@netfilter.org>
Subject: Re: cannot use != with ct status
Date: Wed, 14 Oct 2020 20:09:45 +0200 (CEST)
Message-ID: <alpine.DEB.2.23.453.2010141825050.25415@blackhole.kfki.hu>
References: <CY4PR1001MB23116E94084D4CC5610C79C2E8050@CY4PR1001MB2311.namprd10.prod.outlook.com> <20201014100402.GA19556@salvia> <alpine.DEB.2.23.453.2010141221380.6472@localhost> <20201014103057.GA20717@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20201014103057.GA20717@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: "Ramsay, Lincoln" <Lincoln.Ramsay@digi.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Wed, 14 Oct 2020, Pablo Neira Ayuso wrote:

> > > > I've just confirmed that I can't make a rule that matches ct 
> > > > status != dnat.
> > > 
> > > ct status == dnat and ct state != dnat checks for _exact_ matching.
> > > 
> > > Then:
> > > 
> > >         ct status dnat
> > > 
> > > based on the datatype, provides a shortcut for
> > > 
> > >         ct status and dnat == dnat
> > 
> > Sorry, but it looks like really strange. "ct status nat" would be more 
> > natural to me.
> 
> This is based on the ct status bits, so dnat is matching for
> destination NAT updates (ie. IPS_DST_NAT). Then, snat is matching for
> IPS_SRC_NAT.

I could not express myself properly. I had no problem with the shortcut 
"ct status dnat" at all but with the expression "ct status and dnat == 
dnat".

One could split it at the "and" part and thus the "dnat == dnat" part 
looks confusing. If one splits at "==" then the "and" in "ct status and 
dnat" is not quite intuitive. (I could not find the description of "and" 
in the manpage, at least at 
http://netfilter.org/projects/nftables/index.html.) Why is the "and" 
keyword required? Why couldn't the same syntax be used like at "ct state"?

Best regards,
Jozsef 
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.hu
PGP key : https://wigner.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics
          H-1525 Budapest 114, POB. 49, Hungary
