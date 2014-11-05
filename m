From: Michael Schwartzkopff <ms@sys4.de>
Subject: Re: Linux Firewall Active/Active
Date: Wed, 05 Nov 2014 20:40:42 +0100
Message-ID: <4128127.KGiVEnbFtn@nb003>
References: <CADuigkVbB2nt5P6y-JCaW_bh6v_GhjL9BRBiHRyvA_yH81v4RA@mail.gmail.com>
Reply-To: ms@sys4.de
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2356901.bBCTo0mXHT"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sys4.de; h=
	content-type:content-type:mime-version:references:in-reply-to
	:user-agent:organization:message-id:date:date:subject:subject
	:reply-to:from:from; s=mail201310; t=1415216454; x=1417030855;
	 bh=/9AIyNoYBTxHWP4S2Iwrx4QYwTOSc+cLWA2+udKKe1k=; b=ZFFydTEuYnhK
	yzu4wU/4PjJQ5engZDO3QXjRc7nHOSAvfvN7tuoEAygVbppM96IC7Q4DXDHPSHNN
	tjU+/tGr+B/fwhI2t2rW1PjbtvH/pHOu1T2ziWbPmLw9Ve3TVRKLPIQNNA/LCb4x
	rFzo+QIEkahL+lOETMO0JtWdeh4RlTzmxgIMZBhU4ou4FQc5Ivf+sgjjVFhng6W4
	V0MqR0vjfEMckrr6n5sq08iNmFuAPjH34P5pzrUnJBHfADX9eVUI5a67Dxpxqf8Y
	RWFxBnI1fmgfdUtzw5Mhh9FZ02jwqsG1IbOarq8IAg4agN2aMViT7fPT9mwHdJqd
	Ci2/EAzSCQ==
In-Reply-To: <CADuigkVbB2nt5P6y-JCaW_bh6v_GhjL9BRBiHRyvA_yH81v4RA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter <netfilter@vger.kernel.org>
Cc: Ricardo Klein <klein.rfk@gmail.com>


--nextPart2356901.bBCTo0mXHT
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Am Mittwoch, 5. November 2014, 17:15:23 schrieben Sie:
> Hi there,
>=20
> I need to build a scenario with 2 linux servers (probably CentOS7)
> acting as active/active firewall servers. What tools should I use?
> I saw some articles with:
>  - conntrackd + keepalived
>  - conntrackd + corosync + pacemaker

Why? There is not reasonable cause to build an active/active firewall f=
rom two=20
nodes.

Any single hardware is fast enough to filter the speed of a WAN connect=
ion you=20
can afford. No need for load balanceing.

If one server breaks, the other has to bear the whole load. So you have=
 to=20
design your hardware for the whole load.

So please build an active/passive system.

keealive makes the things very simple. If you have just the firewall, g=
o for=20
it. If you waht a little bit more, i.e. conntrackd and a squid with=20
dependencies amongst all resources, go for pacemaker.

> But, what is the most used/stable?
>=20
>=20
> AND, if there is a chance, I have 4 lan networks (each one in a
> different VLAN) and it should be good if I can set something like
> "preffered master" to each one for load distribution, because I will
> run SQUID in those servers too.
>=20
> I just need to know which way to go, so, I can learn the tools and
> configure it all here.

Mit freundlichen Gr=FC=DFen,

Michael Schwartzkopff

--=20
[*] sys4 AG

http://sys4.de, +49 (89) 30 90 46 64, +49 (162) 165 0044
Franziskanerstra=DFe 15, 81669 M=FCnchen

Sitz der Gesellschaft: M=FCnchen, Amtsgericht M=FCnchen: HRB 199263
Vorstand: Patrick Ben Koetter, Marc Schiffbauer
Aufsichtsratsvorsitzender: Florian Kirstein
--nextPart2356901.bBCTo0mXHT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iF4EABEIAAYFAlRafToACgkQsmtesqLuBDSxZwD9E95docGyqA/qtYfZlUotZ4oM
zrutKUujJhsW5w9FZocBANAgMuK7QjoEEDNo5whchpMWYZbYHHufov5xJ/G7XVrJ
=Y9eT
-----END PGP SIGNATURE-----

--nextPart2356901.bBCTo0mXHT--

