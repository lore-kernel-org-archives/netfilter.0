From: Eric Leblond <eleblond@inl.fr>
Subject: Re: nf_conntrack -> table full, dropping packet; problem with
 counting   sessions
Date: Sat, 29 Aug 2009 12:22:27 +0200
Message-ID: <1251541347.31688.5.camel@ice-age>
References: <875a14c20908270413y3849eabdq3f1465288d024943@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <875a14c20908270413y3849eabdq3f1465288d024943@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?Q?Micha=C5=82?= Sewera <michal.sewera@gmail.com>
Cc: netfilter@vger.kernel.org

Hi,

Could you please specify your kernel version ?

BR,

Le jeudi 27 ao=C3=BBt 2009 =C3=A0 13:13 +0200, Micha=C5=82 Sewera a =C3=
=A9crit :
> Hi,
>=20
> I have a strange problem with nf_conntrack:
>=20
> If I will try to generate small amount of TCP sessions, (i.e. 10
> sessions), then after closing this sessions (on the client side, by
> closing application) output from:
> wc /proc/net/ip_conntrack
> and
> cat /proc/sys/net/nf_conntrack_count
>=20
> is the same -> so I can see the same amount of sessions tracked by nf=
_conntrack.
>=20
>=20
> But during testing the system with i.e. 100 new TCP sessions/sec
> (terminated to the same server), after closing the sessions output
> from wc /proc/net/ip_conntrack if correct (near 0), but all this
> sessions seems to be staying in cat /proc/sys/net/nf_conntrack_count.
>=20
> After exceeding the condition nf_conntrack_count < nf_conntrack_max,
> of course I am getting table full, dropping packet info in log.
>=20
> Some workaround is to set max value to very huge number i.e.
> 1000000000, but after some times eventually I will get the same
> problem and reebot will be required.
>=20
> So, if anyone from experts here will know anything about the cause of
> this problem I will be very gratefull,
>=20
> thanks for any support
>=20
> m
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--=20
Eric Leblond <eleblond@inl.fr>
INL: http://www.inl.fr/
NuFW: http://www.nufw.org/
EdenWall: http://www.edenwall.com/

