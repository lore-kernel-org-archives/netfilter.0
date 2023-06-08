From: Florian Westphal <fw@strlen.de>
Subject: Re: IPv4 Evil Bit
Date: Thu, 8 Jun 2023 10:03:31 +0200
Message-ID: <20230608080331.GB27126@breakpoint.cc>
References: <20230607131743.309d5aff@parrot>
 <20230607143019.65e7f5ec1a21db391071a4d4@plushkava.net>
 <20230608095138.409d3303@parrot>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20230608095138.409d3303@parrot>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Marek =?iso-8859-15?Q?K=FCthe?= <m-k-mailling-list@mk16.de>
Cc: netfilter@vger.kernel.org

Marek K=FCthe <m-k-mailling-list@mk16.de> wrote:
> > > 1) Is it possible to perform OR operations in nftables? For example
> > > `ip6 saddr ::/128 OR ip saddr 127.0.0.1/8 accept;` As far as I
> > > understand it, everything else is concatenated with AND. =20
> >=20
> > No. Nor would a set suffice, as ipv4_addr and ipv6_addr elements cannot=
 be mixed.
>=20
> Too bad nftables doesn't have something like that.

Anon chain would come closest:

 iifname "lo" jump {
   ip saddr 127.0.0.0/8 accept
   ip6 saddr ::1 accept
 }
