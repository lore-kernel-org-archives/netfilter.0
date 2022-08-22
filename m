From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Optimization works only on specific syntax? (was [ANNOUNCE]
 nftables 1.0.5 release)
Date: Mon, 22 Aug 2022 22:53:49 +0200
Message-ID: <YwPs3eBF/7IOhlHS@salvia>
References: <YvK7fkPf6P52MV+w@salvia>
 <fff1fe66-9bad-a732-12ad-133bd9c40218@gmail.com>
 <71eda095-f021-3d00-7ad8-568b934ac194@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <71eda095-f021-3d00-7ad8-568b934ac194@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Amish <anon.amish@gmail.com>
Cc: netfilter <netfilter@vger.kernel.org>, netfilter-devel <netfilter-devel@vger.kernel.org>

Hi,

On Mon, Aug 22, 2022 at 08:53:39PM +0530, Amish wrote:
> On 15/08/22 06:30, Amish wrote:
> > On 10/08/22 01:24, Pablo Neira Ayuso wrote:
> > > - Fixes for the -o/--optimize, run this --optimize option to
> > > automagically
> > >    compact your ruleset using sets, maps and concatenations, eg.
> > > 
> > >       # cat ruleset.nft
> > >       table ip x {
> > >              chain y {
> > >                      type nat hook postrouting priority srcnat;
> > > policy drop;
> > >                      ip saddr 1.1.1.1 tcp dport 8000 snat to 4.4.4.4:80
> > >                      ip saddr 2.2.2.2 tcp dport 8001 snat to 5.5.5.5:90
> > >              }
> > >       }
> > > 
> > >       # nft -o -c -f ruleset.nft
> > >       Merging:
> > >       ruleset.nft:4:3-52:                ip saddr 1.1.1.1 tcp dport
> > > 8000 snat to 4.4.4.4:80
> > >       ruleset.nft:5:3-52:                ip saddr 2.2.2.2 tcp dport
> > > 8001 snat to 5.5.5.5:90
> > >       into:
> > >              snat to ip saddr . tcp dport map { 1.1.1.1 . 8000 :
> > > 4.4.4.4 . 80, 2.2.2.2 . 8001 : 5.5.5.5 . 90 }
> > 
> > This optimization seems to be working only on specific syntax.
> > 
> > If I mention same thing with alternative syntax, there is no suggestion
> > to optimize.
> > 
> > # cat ruleset.nft
> > add table ip x
> > add chain ip x y { type nat hook postrouting priority srcnat; policy
> > drop; }
> > add rule ip x y ip saddr 1.1.1.1 tcp dport 8000 snat to 4.4.4.4:80
> > add rule ip x y ip saddr 2.2.2.2 tcp dport 8001 snat to 5.5.5.5:90
> > 
> > # nft -o -c -f ruleset.nft
> > <no output with exit code 0>
> > 
> > Which means that no optimization is suggested but check passed
> > successfully.
> > 
> > I was expecting that it will reply with:
> > 
> > Merging:
> >  ...
> > into:
> >     add rule ip x y snat to ip saddr . tcp dport map { 1.1.1.1 . 8000 :
> > 4.4.4.4 . 80, 2.2.2.2 . 8001 : 5.5.5.5 . 90 }
> > 
> > OR if it can not translate to exact syntax then atleast it should
> > mention that there is possibility to optimize the rules.
> > 
> > Is there any reason? Am I doing something wrong?

The plain syntax is not supported yet, that's all, it needs a bit of work.
