From: Martin Tomasek <mtd@mk.cvut.cz>
Subject: Re: hosts.deny
Date: Mon, 8 Jul 2002 02:14:10 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020708001410.GA27192@mt.mk.cvut.cz>
References: <007301c22610$e152fe00$0a01a8c0@ed> <20020707235549.ONWM23840.mta03-svc.ntlworld.com@there>
Reply-To: mtd@mk.cvut.cz
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <20020707235549.ONWM23840.mta03-svc.ntlworld.com@there>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.samba.org


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment
Content-Transfer-Encoding: quoted-printable

> I most commonly see it in port scans, and probes for http / sql holes.

You cannot use random spoofed ip adresses with stateful protocol such as
tcp. In tcp is possible to do only SYN floods with random ips -- which
could be solved for example by syncookies.

What you see in portscans or probes are real ips (excluding some
portscan types, which uses "proxy" host).

--=20
Martin Tomasek, mtd@email.cz
BOFH excuse #293:
You must've hit the wrong anykey.

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9KNlSzWKqGie3rqoRAp8hAJ0cxvQklFsdo9k6yf9I1zn0bK+udgCfbgY4
ObfhSaXPjR/EjR0FpIu1FX4=
=lONB
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--

