From: Eric Leblond <eric@inl.fr>
Subject: Re: iptables error limit match: invalid size
Date: Fri, 29 Feb 2008 09:13:48 +0100
Message-ID: <20080229081348.GB18864@bayen.regit.org>
References: <5db5e03e0802200617t9bf4d03ufe27fec5c80bf0bd@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yEPQxsgoJgBvi8ip"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5db5e03e0802200617t9bf4d03ufe27fec5c80bf0bd@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Marc Franquesa <marc.franquesa@gmail.com>
Cc: netfilter@vger.kernel.org


--yEPQxsgoJgBvi8ip
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wednesday, 2008 February 20 at 15:17:36 +0100, Marc Franquesa wrote:
> I get this error when I try to use 'limit' rule:
>=20
> idoru:~# iptables -I INETIN -p icmp --icmp-type 8 -m limit --limit
> 1/sec --limit-burst 5 -j ACCEPT
> iptables: Invalid argument
>=20
> And in the kernel messages (dmesg) appears this:
>=20
> ip_tables: limit match: invalid size 40 !=3D 32
>=20
> This is on a Debian (etch) mips (SGI O2) machine, exactly the same
> command on another Debian (etch) machine (x86) gives no problem.

Could you confirm the kernel version and iptables version you are using ?

> I haven't found anything on google.

Googling a bit give me this:
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D316201

> =BFAny suggestions?

Upgrade kernel and iptables to latest versions :/ and report bug to
netfilter-devel ML if bug persists.

BR,
--=20
Eric Leblond
INL: http://www.inl.fr/
NuFW: http://www.nufw.org/

--yEPQxsgoJgBvi8ip
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFHx767nxA7CdMWjzIRAqD/AJ9zQ6vwL88FhySXhTfv8nRy/fj1DwCfd4uY
1g6bCqmRp/6qzGj/WLamzg0=
=ECHL
-----END PGP SIGNATURE-----

--yEPQxsgoJgBvi8ip--
