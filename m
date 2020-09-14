From: Duncan Roe <duncan_roe@optusnet.com.au>
Subject: Re: Filter based on string (or other content)
Date: Mon, 14 Sep 2020 14:17:38 +1000
Message-ID: <20200914041738.GG15387@dimstar.local.net>
References: <d3356c66687003310366b87a69328d329074efcb.camel@neobits.nl>
 <20200913004552.GE15387@dimstar.local.net>
 <alpine.DEB.2.21.2009130918340.4722@piplus.local.jubileegroup.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2009130918340.4722@piplus.local.jubileegroup.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi Ged,

On Sun, Sep 13, 2020 at 09:49:44AM +0100, G.W. Haywood wrote:
> Hi there,
>
> On Sun, 13 Sep 2020, Duncan Roe wrote:
>
> > On Sat, Sep 12, 2020 at 03:41:00PM +0200, K. de Jong wrote:
> > > I switched to nftables, but I miss one key feature. That is the ability
> > > to filter packets based on a string.  ...
> > > Does anyone know a solution to do this with nftables?
> >
> > I think I have done something like what you're after using 'queue' target and
> > writing a netfilter-queue program. See https://github.com/duncan-roe/nfq
>
> Looks like good work.
>
> Shouldn't the TLDs be taken from the special use domains?
>
> https://www.iana.org/assignments/special-use-domain-names/special-use-domain-names.xhtml
>
> --
>
> 73,
> Ged.

Thank you for that URL! I didn't know about those reserved names before.

Seems to work really well: 'dig' Query time for sys8.admin.invalid was 1msec
while sys8.admin.inval was 200.

Normally queries for these names shouldn't happen and shouldn't make it to the
Internet if they do, but it would be neat to use them anyway so I'll put it on
my todo list.

Cheers ... Duncan.
