From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: Iptables special config
Date: Thu, 12 Mar 2009 16:41:53 +0200
Message-ID: <1236868913.4151.61.camel@casper.meteor.dp.ua>
References: <web-35205651@av.it.pt>
Reply-To: casper@meteor.dp.ua
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <web-35205651@av.it.pt>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Vitor =?ISO-8859-1?Q?Ant=F3nio?= das Neves Pinto <vpinto@av.it.pt>
Cc: netfilter@vger.kernel.org

=D0=92 =D0=A7=D1=82=D0=B2, 12/03/2009 =D0=B2 11:32 +0000, Vitor Ant=C3=B3=
nio das Neves Pinto =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Dear all,
>=20
> I have a question regarding a special configuration with=20
> iptables, I hope you can help me:
> - Behind the NAT there=E2=80=99s a terminal with IP1 that sends a=20
> UDP packet to a host outside the NAT with IP2 (Source=20
> port=3D1033 Dport=3D 123)
> - The response to this packet (due to load balancing=20
> issues) comes from a machine outside the NAT with IP3 (not=20
> from IP2!!) with Source port=3D123 Dport=3D1033
>=20
> Since iptables is configured as a port restricted NAT the=20
> response packet is dropped not reaching terminal with IP1=E2=80=A6=20
> Any idea how to make the packet reach the terminal with=20
> IP1?
> I know that with a full cone nat this wouldn=E2=80=99t happen=E2=80=A6

On machine with IP3 try to do SNAT to IP2 for those packets. This shoul=
d
fix your problem.

--=20
=D0=9F=D0=BE=D0=BA=D0=BE=D1=82=D0=B8=D0=BB=D0=B5=D0=BD=D0=BA=D0=BE =D0=9A=
=D0=BE=D1=81=D1=82=D0=B8=D0=BA <casper@meteor.dp.ua>

