From: "Nikolay S." <nowhere@hakkenden.ath.cx>
Subject: [Fwd: RE: ipv6 link local address]
Date: Tue, 07 Jun 2011 18:35:01 +0400
Message-ID: <1307457301.23737.14.camel@hakkenden>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: bmcdowell@coxhealthplans.com
Cc: netfilter@vger.kernel.org

-------- =D0=9F=D0=B5=D1=80=D0=B5=D1=81=D1=8B=D0=BB=D0=B0=D0=B5=D0=BC=D0=
=BE=D0=B5 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B5 ------=
--
> =D0=9E=D1=82: Nikolay S. <nowhere@hakkenden.ath.cx>
> =D0=9A=D0=BE=D0=BC=D1=83: bmcdowell@coxhealthplans.com
> =D0=9A=D0=BE=D0=BF=D0=B8=D1=8F: netfilter@vger.kernel.org
> =D0=A2=D0=B5=D0=BC=D0=B0: RE: ipv6 link local address
> =D0=94=D0=B0=D1=82=D0=B0: 	Tue, 07 Jun 2011 18:32:56 +0400
>=20
> =D0=92 =D0=92=D1=82=D1=80, 07/06/2011 =D0=B2 14:26 +0000, bmcdowell@c=
oxhealthplans.com =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > I'm sorry, but that didn't parse.
> >=20
> > I won't, what?
> >=20
> > Skb's?
>=20
> Ability to filter bridged frames with ip6tables :)

Sorry again :)
You will not loose ability to filter bridged frames with ip6tables.

>=20
> >=20
> >=20
> > Bob McDowell
> > Network/Security Engineer=20
> > Cox HealthPlans=20
> >=20
> > -----Original Message-----
> > From: Nikolay S. [mailto:nowhere@hakkenden.ath.cx]=20
> > Sent: Tuesday, June 07, 2011 9:24 AM
> > To: Bob McDowell
> > Cc: netfilter@vger.kernel.org
> > Subject: RE: ipv6 link local address
> >=20
> > =D0=92 =D0=92=D1=82=D1=80, 07/06/2011 =D0=B2 12:44 +0000, bmcdowell=
@coxhealthplans.com =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > > Please understand that I do want to be able to use ip6tables to f=
ilter forwarded traffic.  I just do not want the interfaces speaking to=
 anyone while they're doing their job.
> > >=20
> > > Perhaps this example can explain it better than I have:  http://w=
ww.sjdjweis.com/linux/bridging/
> > >=20
> > >=20
> > > Thanks again.
> > >=20
> >=20
> > You won't. skb's are passed to ip6tables from bridge based on ipv6-
> > header, not the state of the protocol on slave device. And bridge i=
tself
> > does not filter incoming frames by L3-header.
> >=20
> > >=20
> > > Bob McDowell
> > > Network/Security Engineer=20
> > > Cox HealthPlans=20
> > >=20
> > >=20
> > > -----Original Message-----
> > > From: Nikolay S. [mailto:nowhere@hakkenden.ath.cx]=20
> > > Sent: Tuesday, June 07, 2011 1:44 AM
> > > To: Bob McDowell
> > > Cc: netfilter@vger.kernel.org
> > > Subject: Re: ipv6 link local address
> > >=20
> > >=20
> > > You can turn off ipv6 on interfaces. This should not prevent brid=
ging
> > > ipv6, but will remove any ipv6 logic from them.
> > >=20
> > >=20
> >=20
> >=20
>=20
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


