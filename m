From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: How to enable jhash for nftables v0.8
Date: Thu, 26 Oct 2017 11:34:09 +0200
Message-ID: <20171026093409.GA6149@salvia>
References: <CAG1z+79Ed9-U4XbU3As1Yc6QVi61Wro0PA4eUVmx=RSdjvFj3w@mail.gmail.com>
 <CAF90-WiarOqxC4=OALo4gdsit4sohWmJR1rp+KXr+WecSvPiJg@mail.gmail.com>
 <CAE=SJfDohSBgye64-upou+GrmNaOHa0x0KPwrRLnzvu4iO426g@mail.gmail.com>
 <20171026092202.GA2589@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171026092202.GA2589@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Laura =?iso-8859-1?Q?Garc=EDa_Li=E9bana?= <laura.garcia@zevenet.com>
Cc: netfilter@vger.kernel.org

On Thu, Oct 26, 2017 at 11:22:02AM +0200, Pablo Neira Ayuso wrote:
> On Thu, Oct 26, 2017 at 11:09:26AM +0200, Laura Garc=EDa Li=E9bana wrote:
> > > From: Zheng konia <konianet@gmail.com>
> > > Date: Thu, Oct 26, 2017 at 10:48 AM
> > > Subject: How to enable jhash for nftables v0.8
> > > To: Netfilter Users Mailing list <netfilter@vger.kernel.org>
> > >
> > >
> > > Hi,
> > >
> > >    I'm have some error with configureing nftables-nat with loading
> > > balance when I trying `jhash`.
> > >
> > >    # nft add rule nat prerouting mark set jhash ip saddr . tcp dport =
mod 2
> > >          Error: Could not process rule: Invalid argument
> > >          add rule nat prerouting mark set jhash ip saddr . tcp dport =
mod 2
> > >         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^
> >=20
> > Hi, the jhash expression it's correct but you should try with:
> >=20
> > # nft add rule ip nat prerouting ct mark set jhash ...
>=20
> Probably he doesn't want to set the mark... but match on it based on
> the jhash result.

I mean, the rule is valid. Although it may not make much sense? It's
just marking the first packet only.

Anyway, I suspect Zheng is running a kernel with no jhash support.

It would be good to document on the wiki since what kernel version
this is supported.
