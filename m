From: Eric Leblond <eric@regit.org>
Subject: Re: Conntrackd and Stats
Date: Thu, 01 Aug 2013 10:31:34 +0200
Message-ID: <1375345894.11948.5.camel@ice-age.regit.org>
References: <ebed8973f57495e3091005d880fcb4ca@justnet.pl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-YyV3bb8Oszo9KLI2x9Iu"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <ebed8973f57495e3091005d880fcb4ca@justnet.pl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "Adam N." <adam.n@justnet.pl>
Cc: netfilter@vger.kernel.org


--=-YyV3bb8Oszo9KLI2x9Iu
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 01 ao=FBt 2013 =E0 09:46 +0200, Adam N. a =E9crit :
> Hello everyone,
> At the beginning I would like to thank everyone for the work put into=20
> the project netfilter.

Thanks Adam :)

> We use conntrackd projekt to save NAT connections. Recently we noticed=
=20
> that with the change of the kernel version also changed format logs(=20
> disappeared amount of transferred packets and bytes).
>=20
> My question is:
> Is it possible to restore the record containing the number of packets=20
> and bytes transferred in connection?

You can do
echo "1" > /proc/sys/net/netfilter/nf_conntrack_acct

If you want to have start time of the conntrack entries, you can also do

echo "1" > /proc/sys/net/netfilter/nf_conntrack_timestamp

BR,
--
Eric

--=-YyV3bb8Oszo9KLI2x9Iu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iD8DBQBR+hznnxA7CdMWjzIRAggeAKCE+O5wlfSKYF8GkN3PNFHU2lj88wCfbJjZ
tbAzO8RJEccEilk0/sr6vVU=
=G2Nm
-----END PGP SIGNATURE-----

--=-YyV3bb8Oszo9KLI2x9Iu--

