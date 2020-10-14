From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: cannot use != with ct status
Date: Wed, 14 Oct 2020 12:30:57 +0200
Message-ID: <20201014103057.GA20717@salvia>
References: <CY4PR1001MB23116E94084D4CC5610C79C2E8050@CY4PR1001MB2311.namprd10.prod.outlook.com>
 <20201014100402.GA19556@salvia>
 <alpine.DEB.2.23.453.2010141221380.6472@localhost>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.23.453.2010141221380.6472@localhost>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@netfilter.org>
Cc: "Ramsay, Lincoln" <Lincoln.Ramsay@digi.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi Jozsef,

On Wed, Oct 14, 2020 at 12:25:40PM +0200, Jozsef Kadlecsik wrote:
> On Wed, 14 Oct 2020, Pablo Neira Ayuso wrote:
> 
> > On Wed, Oct 14, 2020 at 04:16:40AM +0000, Ramsay, Lincoln wrote:
> > > Hi,
> > > 
> > > I've just confirmed that I can't make a rule that matches ct status != dnat.
> > 
> > ct status == dnat and ct state != dnat checks for _exact_ matching.
> > 
> > Then:
> > 
> >         ct status dnat
> > 
> > based on the datatype, provides a shortcut for
> > 
> >         ct status and dnat == dnat
> 
> Sorry, but it looks like really strange. "ct status nat" would be more 
> natural to me.

This is based on the ct status bits, so dnat is matching for
destination NAT updates (ie. IPS_DST_NAT). Then, snat is matching for
IPS_SRC_NAT.

It should be possible to add ct status nat but such nat would be
(IPS_SRC_NAT | IPS_DST_NAT)
