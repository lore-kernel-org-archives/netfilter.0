From: Bruno Wallace <bruno.wallace@gmail.com>
Subject: Re: how to block udp frag?
Date: Mon, 3 Jan 2005 10:38:54 -0200
Message-ID: <1139dfe205010304387b3b072@mail.gmail.com>
References: <1139dfe2050101155841faa4d0@mail.gmail.com>
	<20050102000845.GA11550@bender.817west.com>
Reply-To: Bruno Wallace <bruno.wallace@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050102000845.GA11550@bender.817west.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

the iptables dont see this traffic..


On Sat, 1 Jan 2005 19:08:45 -0500, Jason Opperisano <opie@817west.com> wrot=
e:
> On Sat, Jan 01, 2005 at 09:58:41PM -0200, Bruno Wallace wrote:
> > hello,
> > how to block this?????
> >
> > 20:53:44.628586 83.102.166.15 > xxx.xxx.151.35: udp (frag 1720:25@512)
> > (ttl 53, len 45)
> > 0x0000   4500 002d 06b8 0040 3511 2599 5366 a60f        E..-...@5.%.Sf.=
.
> > 0x0010   c896 9723 11ef 0035 0019 1e70 71f7 0100        ...#...5...pq..=
.
> > 0x0020   0001 0000 0000 0000 0000 0200 0100             ..............
> > 20:53:47.197264 83.102.166.24 > xxx.xxx.151.34: udp (frag
> > 48577:25@512) (ttl 53, len 45)
> > 0x0000   4500 002d bdc1 0040 3511 6e87 5366 a618        E..-...@5.n.Sf.=
.
> > 0x0010   c896 9722 11ef 0035 0019 1e68 71f7 0100        ..."...5...hq..=
.
> > 0x0020   0001 0000 0000 0000 0000 0200 0100             ..............
> > 20:53:49.306206 83.102.166.76 > xxx.xxx.145.115: udp (frag
> > 21990:25@512) (ttl 53, len 45)
> > 0x0000   4500 002d 55e6 0040 3511 dbdd 5366 a64c        E..-U..@5...Sf.=
L
> > 0x0010   c896 9173 11ef 0035 0019 23e3 71f7 0100        ...s...5..#.q..=
.
> > 0x0020   0001 0000 0000 0000 0000 0200 0100             ..............
> > 20:53:49.529603 83.102.166.7 > xxx.xxx.146.119: udp (frag
> > 26427:25@512) (ttl 53, len 45)
> > 0x0000   4500 002d 673b 0040 3511 c9c9 5366 a607        E..-g;.@5...Sf.=
.
> > 0x0010   c896 9277 11ef 0035 0019 2324 71f7 0100        ...w...5..#$q..=
.
> > 0x0020   0001 0000 0000 0000 0000 0200 0100
> >
> > thanks
> > Bruno Wallace
>=20
> either (a) use a default deny policy that doesn't allow UDP traffic or
> (b) in your rules where you accept UDP traffic, specify "! -f" which,
> according to the man page:
>=20
>   When the "!" argument precedes the "-f" flag, the rule will only match
>   head  fragments, or unfragmented packets.
>=20
> -j
>=20
>=20


--=20
abra=E7o,
Bruno Wallace

