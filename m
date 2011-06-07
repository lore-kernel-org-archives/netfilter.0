From: "Nikolay S." <nowhere@hakkenden.ath.cx>
Subject: RE: ipv6 link local address
Date: Tue, 07 Jun 2011 18:32:56 +0400
Message-ID: <1307457176.23737.12.camel@hakkenden>
References: <92A9C99A1E5FF14F8538DDEE14996A5203341F@chp-exg.coxhp.com>
	 <1307429067.7853.1.camel@hakkenden>
	 <92A9C99A1E5FF14F8538DDEE14996A5203365A@chp-exg.coxhp.com>
	 <1307456633.23737.11.camel@hakkenden>
	 <92A9C99A1E5FF14F8538DDEE14996A52033898@chp-exg.coxhp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <92A9C99A1E5FF14F8538DDEE14996A52033898@chp-exg.coxhp.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: bmcdowell@coxhealthplans.com
Cc: netfilter@vger.kernel.org

=D0=92 =D0=92=D1=82=D1=80, 07/06/2011 =D0=B2 14:26 +0000, bmcdowell@cox=
healthplans.com =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> I'm sorry, but that didn't parse.
>=20
> I won't, what?
>=20
> Skb's?

Ability to filter bridged frames with ip6tables :)

>=20
>=20
> Bob McDowell
> Network/Security Engineer=20
> Cox HealthPlans=20
>=20
> -----Original Message-----
> From: Nikolay S. [mailto:nowhere@hakkenden.ath.cx]=20
> Sent: Tuesday, June 07, 2011 9:24 AM
> To: Bob McDowell
> Cc: netfilter@vger.kernel.org
> Subject: RE: ipv6 link local address
>=20
> =D0=92 =D0=92=D1=82=D1=80, 07/06/2011 =D0=B2 12:44 +0000, bmcdowell@c=
oxhealthplans.com =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > Please understand that I do want to be able to use ip6tables to fil=
ter forwarded traffic.  I just do not want the interfaces speaking to a=
nyone while they're doing their job.
> >=20
> > Perhaps this example can explain it better than I have:  http://www=
=2Esjdjweis.com/linux/bridging/
> >=20
> >=20
> > Thanks again.
> >=20
>=20
> You won't. skb's are passed to ip6tables from bridge based on ipv6-
> header, not the state of the protocol on slave device. And bridge its=
elf
> does not filter incoming frames by L3-header.
>=20
> >=20
> > Bob McDowell
> > Network/Security Engineer=20
> > Cox HealthPlans=20
> >=20
> >=20
> > -----Original Message-----
> > From: Nikolay S. [mailto:nowhere@hakkenden.ath.cx]=20
> > Sent: Tuesday, June 07, 2011 1:44 AM
> > To: Bob McDowell
> > Cc: netfilter@vger.kernel.org
> > Subject: Re: ipv6 link local address
> >=20
> >=20
> > You can turn off ipv6 on interfaces. This should not prevent bridgi=
ng
> > ipv6, but will remove any ipv6 logic from them.
> >=20
> >=20
>=20
>=20


