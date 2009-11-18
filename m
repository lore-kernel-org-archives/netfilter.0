From: Eric Leblond <eric@inl.fr>
Subject: Re: BUG: soft lockup detected on CPU#6!
Date: Wed, 18 Nov 2009 08:27:03 +0100
Message-ID: <1258529223.14944.2.camel@ice-age>
References: <BC509C21E21C6D42B57342019E74B9D176679A@usmail.veveotv.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-qgGfV7XG9jvS/qDXeFxj"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BC509C21E21C6D42B57342019E74B9D176679A@usmail.veveotv.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Tim Fennelly <tfennelly@vtap.com>
Cc: netfilter@vger.kernel.org


--=-qgGfV7XG9jvS/qDXeFxj
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

Hi,

The problem does not seem related to Netfilter: the call trace does not
feature any Netfilter specific functions and as far as I know there is
no fork (see do_fork call) in Netfilter.

It thus should not be related to Netfilter.

BR,

Le mardi 17 novembre 2009 =E0 18:52 -0500, Tim Fennelly a =E9crit :
> Hello,
>   Has anyone received a similar alarm?
>=20
> Netfilter messages via NETLINK v0.30.
> ip_conntrack version 2.4 (8192 buckets, 65536 max) - 304 bytes per
> conntrack
> BUG: soft lockup detected on CPU#6!
>=20
> Call Trace:
>  <IRQ>  [<ffffffff800b2c85>] softlockup_tick+0xdb/0xed
>  [<ffffffff800933d1>] update_process_times+0x42/0x68
>  [<ffffffff80073d97>] smp_local_timer_interrupt+0x23/0x47
>  [<ffffffff80074459>] smp_apic_timer_interrupt+0x41/0x47
>  [<ffffffff8005bcc2>] apic_timer_interrupt+0x66/0x6c
>  [<ffffffff8021f45f>] dst_rcu_free+0x0/0x3a
>  [<ffffffff8006263c>] _spin_lock_bh+0xc/0x14
>  [<ffffffff8003cc82>] rt_run_flush+0x57/0xb8
>  [<ffffffff8003cc2b>] rt_run_flush+0x0/0xb8
>  [<ffffffff80092bf7>] run_timer_softirq+0x133/0x1b0
>  [<ffffffff80011c19>] __do_softirq+0x5e/0xd5
>  [<ffffffff8005c330>] call_softirq+0x1c/0x28
>  [<ffffffff8006a310>] do_softirq+0x2c/0x85
>  [<ffffffff8005bcc2>] apic_timer_interrupt+0x66/0x6c
>  <EOI>  [<ffffffff80008480>] copy_page_range+0x5cc/0x734
>  [<ffffffff80008466>] copy_page_range+0x5b2/0x734
>  [<ffffffff8003bb4c>] __get_free_pages+0xe/0x71
>  [<ffffffff800620b4>] __down_write_nested+0x12/0x92
>  [<ffffffff8001f1f4>] copy_process+0xcfb/0x155d
>  [<ffffffff800309f9>] do_fork+0x68/0x166
>  [<ffffffff8005b2c1>] tracesys+0xd1/0xdc
>  [<ffffffff8005b45b>] ptregscall_common+0x67/0xac
>=20
> Any help would be greatly appreciated!
>=20
> Thanks
>=20
> Tim Fennelly=20
> Customer Support
> Veveo Inc.
> http://vtap.com
>=20
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


--=20
Eric Leblond <eric@inl.fr>
INL: http://www.inl.fr/
NuFW: http://www.nufw.org/

--=-qgGfV7XG9jvS/qDXeFxj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Ceci est une partie de message
 =?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iD8DBQBLA6HBnxA7CdMWjzIRAlU4AJsGwMfdTXIx3bj6Pvt6W/KrK1+QSACfdTUp
sd94LTrB8tR+50U6tuKdSpM=
=YlSg
-----END PGP SIGNATURE-----

--=-qgGfV7XG9jvS/qDXeFxj--

