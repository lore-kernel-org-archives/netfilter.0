From: Florian Westphal <fw@strlen.de>
Subject: Re: Is it possible to change a chains default policy when rules are
 already present?
Date: Fri, 14 Aug 2020 15:08:42 +0200
Message-ID: <20200814130842.GF1660@breakpoint.cc>
References: <AM0PR06MB4628C196EBABF0FD53AA8006C5430@AM0PR06MB4628.eurprd06.prod.outlook.com>
 <20200814110749.GA30331@salvia>
 <c0afef4e-7276-a368-226a-cb315ea1ab69@tootai.net>
 <1ed447f1-da05-38c7-e86e-4451f8040c88@thelounge.net>
 <2b96d288-50d9-b64b-f5ac-3343d3b9f631@tootai.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2b96d288-50d9-b64b-f5ac-3343d3b9f631@tootai.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Daniel <tech@tootai.net>
Cc: Reindl Harald <h.reindl@thelounge.net>, Pablo Neira Ayuso <pablo@netfilter.org>, Andreas Hoefler <andreas.hoefler@hitachi-powergrids.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Daniel <tech@tootai.net> wrote:
>=20
> Le 14/08/2020 =E0 13:36, Reindl Harald a =E9crit=A0:
> >=20
> > Am 14.08.20 um 13:21 schrieb Daniel:
> > > Le 14/08/2020 =E0 13:07, Pablo Neira Ayuso a =E9crit=A0:
> > > > On Thu, Aug 13, 2020 at 12:28:34PM +0000, Andreas Hoefler wrote:
> > > > > Hi
> > > > >=20
> > > > > I have a chain with default policy drop.
> > > > > I would like to first have the default policy set to accept, then=
 add
> > > > > rules and later change it to drop.
> > > > > Is this possible?
> > > > For the record:
> > > >=20
> > > >  =A0 nft add chain x y { policy accept\; }
> > > >=20
> > > > Assuming an existing basechain 'y'. The backlash (\) before the
> > > > semicolon is there in case of invoking this from bash.
> > >  From bash how to you set priority leaded by - like priority -150 \; =
We
> > > always get invalid option
> > >=20
> > > dh@peech:~$ sudo nft add chain ip6 mangle output { type nat hook
> > > prerouting priority -350 \; policy accept \; }
> > > nft: invalid option -- '3'
> > because you don't escape - with \-
> I already tested by escaping - sign, same error
> > don't nft understand quoted params?
> >=20
> > nft add chain ip6 mangle output "{ type nat hook prerouting priority
> > -350 ; policy accept ; }"
> Not working either
>=20
> dh@peech:~$ sudo nft add chain ip6 mangle prerouting "{ type nat hook
> prerouting priority -350 ; policy accept ; }"
> Error: Could not process rule: Operation not supported
> add chain ip6 mangle prerouting { type nat hook prerouting priority -350;
> policy accept; }

Historic artifact, try a value larger than -200, e.g. -199.
I've sent a patch to zap this outdated check.
