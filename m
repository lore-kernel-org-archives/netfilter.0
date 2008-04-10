From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: Ranges and Single IPs
Date: Thu, 10 Apr 2008 11:26:29 +0300
Message-ID: <1207815989.29847.3.camel@casper.meteor.dp.ua>
References: <d95317090804091138t3f12f5feo51d16968715ede7b@mail.gmail.com>
	 <d95317090804091140l3643357fj79ffe44128202ef6@mail.gmail.com>
	 <alpine.LNX.1.10.0804092113260.17930@fbirervta.pbzchgretzou.qr>
	 <d95317090804091217y339b9361vad400ef810c1157b@mail.gmail.com>
	 <alpine.LNX.1.10.0804092226520.17930@fbirervta.pbzchgretzou.qr>
	 <Pine.LNX.4.64.0804100918210.2089@blackhole.kfki.hu>
Reply-To: casper@meteor.dp.ua
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0804100918210.2089@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Jan Engelhardt <jengelh@computergmbh.de>, Gilad Benjamini <gilad.benjamini@gmail.com>, netfilter@vger.kernel.org

=F7 =FE=D4=D7, 10/04/2008 =D7 09:21 +0200, Jozsef Kadlecsik =D0=C9=DB=C5=
=D4:
> On Wed, 9 Apr 2008, Jan Engelhardt wrote:
>=20
> > On Wednesday 2008-04-09 21:17, Gilad Benjamini wrote:
> >=20
> > >True, but I am looking for a more optimized solution
> >=20
> > I assume ipset's iptree is smart enough to do short-circuiting
> > if you have /24, /16 or /8 networks.
>=20
> If you have got whole networks (/n), then ipset is smart enough to ha=
ndle=20
> it (nethash type). If you have got ranges, then iptreemap type is the=
 best=20
> choice.

But, regarding this question, is there any way one can use IP-networks
and single IP-addresses in the same set? Personally I was unable to do
that since ipset doesn't accepts netmask of 32 or 31.

Say, I have the following set of ips and nets, could I and how could I
keep that in one set?:

192.168.0.0/24
192.168.1.128/30
192.168.2.1/32

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

