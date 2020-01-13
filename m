From: Florian Westphal <fw@strlen.de>
Subject: Re: nftables static routing fails
Date: Mon, 13 Jan 2020 22:40:02 +0100
Message-ID: <20200113214002.GJ795@breakpoint.cc>
References: <967a25ca-ed80-b13e-a301-0907081debbf@hajes.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <967a25ca-ed80-b13e-a301-0907081debbf@hajes.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: david NEW <david@hajes.org>
Cc: netfilter@vger.kernel.org

david NEW <david@hajes.org> wrote:
> hi,
>=20
> I am trying to route blocked ip set to IP:8080 where is info about "you h=
ave
> been blocked"
>=20
> table ip raw {
> =A0=A0=A0 set bad_ip {'
> =A0=A0=A0=A0=A0=A0=A0 type ipv4_addr
> =A0=A0=A0=A0=A0=A0=A0 elements =3D { xxx.xxx.xxx.xxx }
> =A0=A0=A0 }
>=20
> chain prerouting {
>=20
> =A0=A0=A0 type filter hook prerouting priority -500; policy accept;
> =A0=A0=A0 nft add raw preroute ip saddr @bad_ip tcp dport { 80, 443 } ip =
daddr set
> xxx.xxx.xxx.xxx tcp dport set 8080 notrack
> }
>=20
>=20
> netfilter doesn't complain about this rule but nothing happens...connecti=
on
> timed out and nothing happened. I see no errors in Apache2 logs.
>=20
> I can see connection attempt in tcpdump but it is not redirected.

How do you know from tcpdump?  tcpdump occurs before port rewrite.

You should see syn to foo:80, then a syn-ack from xxx.xxx.xxx.xxx:8080.

As original client connected to foo:80, the syn-ack is dropped on client
side.

You need to add a reverse xlate rule if you really want this, or use
normal redirect via nat.
