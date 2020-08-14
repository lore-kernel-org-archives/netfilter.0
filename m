From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Is it possible to change a chains default policy when rules are
 already present?
Date: Fri, 14 Aug 2020 16:37:47 +0200
Message-ID: <20200814143747.GA5892@salvia>
References: <AM0PR06MB4628C196EBABF0FD53AA8006C5430@AM0PR06MB4628.eurprd06.prod.outlook.com>
 <20200814110749.GA30331@salvia>
 <c0afef4e-7276-a368-226a-cb315ea1ab69@tootai.net>
 <1ed447f1-da05-38c7-e86e-4451f8040c88@thelounge.net>
 <2b96d288-50d9-b64b-f5ac-3343d3b9f631@tootai.net>
 <20200814130842.GF1660@breakpoint.cc>
 <VI1PR06MB4639D0AB412AA72F75A96A06C5400@VI1PR06MB4639.eurprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <VI1PR06MB4639D0AB412AA72F75A96A06C5400@VI1PR06MB4639.eurprd06.prod.outlook.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Andreas Hoefler <andreas.hoefler@hitachi-powergrids.com>
Cc: Florian Westphal <fw@strlen.de>, Daniel <tech@tootai.net>, Reindl Harald <h.reindl@thelounge.net>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Fri, Aug 14, 2020 at 01:21:08PM +0000, Andreas Hoefler wrote:
> > Daniel <tech@tootai.net> wrote:
> > >
> > > Le 14/08/2020 =E0 13:36, Reindl Harald a =E9crit :
> > > >
> > > > Am 14.08.20 um 13:21 schrieb Daniel:
> > > > > Le 14/08/2020 =E0 13:07, Pablo Neira Ayuso a =E9crit :
> > > > > > On Thu, Aug 13, 2020 at 12:28:34PM +0000, Andreas Hoefler wrote:
> > > > > > > Hi
> > > > > > >
> > > > > > > I have a chain with default policy drop.
> > > > > > > I would like to first have the default policy set to accept, =

> > > > > > > then add rules and later change it to drop.
> > > > > > > Is this possible?
> > > > > > For the record:
> > > > > >
> > > > > >    nft add chain x y { policy accept\; }
> > > > > >
> > > > > > Assuming an existing basechain 'y'. The backlash (\) before the=
=20
> > > > > > semicolon is there in case of invoking this from bash.
> > > > >  From bash how to you set priority leaded by - like priority -150=
=20
> > > > > \; We always get invalid option
> > > > >
> > > > > dh@peech:~$ sudo nft add chain ip6 mangle output { type nat hook =

> > > > > prerouting priority -350 \; policy accept \; }
> > > > > nft: invalid option -- '3'
> > > > because you don't escape - with \-
> > > I already tested by escaping - sign, same error
> > > > don't nft understand quoted params?
> > > >
> > > > nft add chain ip6 mangle output "{ type nat hook prerouting priority
> > > > -350 ; policy accept ; }"
> > > Not working either
> > >
> > > dh@peech:~$ sudo nft add chain ip6 mangle prerouting "{ type nat hook=
=20
> > > prerouting priority -350 ; policy accept ; }"
> > > Error: Could not process rule: Operation not supported add chain ip6 =

> > > mangle prerouting { type nat hook prerouting priority -350; policy=20
> > > accept; }
> >=20
> > Historic artifact, try a value larger than -200, e.g. -199.
> > I've sent a patch to zap this outdated check.
>=20
> Didn't work for me either:
> #nft add chain ip6 x y {type filter hook input priority \-100\;}
> nft: invalid option -- '1'

This is fixed in recent nftables version there is no need to disable
the getopt_long() parser anymore via --

nft -- add chain ip6 x y {type filter hook input priority -100 \;}

see:

commit fb9cea50e8b370b6931e7b53b1a881d3b95b1c91
Author: Pablo Neira Ayuso <pablo@netfilter.org>
Date:   Fri Dec 13 11:32:46 2019 +0100

    main: enforce options before commands

