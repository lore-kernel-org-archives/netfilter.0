From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables snat map with ports
Date: Sat, 23 Apr 2022 18:11:24 +0200
Message-ID: <YmQlLE1uXCj36ZuR@salvia>
References: <CAPXsr7qDzkOEgEAGs6iGMLBMuCbJhgLeELXcoGOWAmC+WbcTtA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAPXsr7qDzkOEgEAGs6iGMLBMuCbJhgLeELXcoGOWAmC+WbcTtA@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Patrick =?utf-8?Q?Brand=C3=A3o?= <patrickbrandao@gmail.com>
Cc: netfilter@vger.kernel.org

On Fri, Apr 22, 2022 at 08:22:25PM -0300, Patrick Brand=C3=A3o wrote:
> Hi Pablo,
>=20
> first, congratulations for the great work on the netfilter project.
>=20
> After seeing your presentation at
> https://people.netfilter.org/pablo/nft-tutorial.pdf
> I have a question (and a problem):
> Is it possible to map networks and ports on the snat map?
>=20
> # Example: 100.80.0.0/30 snat to 45.255.128.0/30
> add rule ip nat POSTROUTING snat ip prefix to ip saddr map {
> 100.80.0.0/30:45.255.128.0/30 }
>=20
> # Solution need: 100.80.0.0/30 snat to 45.255.128.0/30 ports 1000-2000
> add rule ip nat POSTROUTING snat ip prefix to ip saddr map {
> 100.80.0.0/30:45.255.128.0/30 tcp 1000-2000 }
>=20
> Is it possible to do something like this?

add rule x y meta l4proto tcp snat ip prefix to ip saddr map { 100.80.0.0/3=
0 : 45.255.128.0/30 . 1000-2000 }
