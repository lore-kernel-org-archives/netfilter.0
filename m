From: Eric Leblond <eric@regit.org>
Subject: Re: IPTABLES: How to NOT display MAC addr in log files
Date: Sat, 25 Jun 2011 22:29:17 +0200
Message-ID: <1309033770.4898.36.camel@tiger.regit.org>
References: <loom.20110625T212223-868@post.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-CI6NeHQ9NcnIIzIe8nrI"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <loom.20110625T212223-868@post.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: John Brown <john.gmane@bcgassets.com>
Cc: netfilter@vger.kernel.org


--=-CI6NeHQ9NcnIIzIe8nrI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Sat, 2011-06-25 at 19:25 +0000, John Brown wrote:
> Hi,
>=20
> How do I prevent IPTABLES from sending the MAC address data to a log file=
.
>=20
> Otherwords I don't wan the MAC=3D00:25....... data. Its useless to me and=
 wastes a
> ton of space in the log files.
>=20
> Jun 25 13:15:16 infodeli kernel: LOGDROP--IN=3Deth0 OUT=3D
> MAC=3D00:25:90:01:34:ec:00:09:44:02:2c:0a:08:00 SRC=3Dxxx.XXX.xxx.xxx
> DST=3Dyyy.yyy.yyy.yyy LEN=3D92 TOS=3D0x00 PREC=3D0x00 TTL=3D61 ID=3D23777=
 PROTO=3DUDP SPT=3D3001
> DPT=3D15029 LEN=3D72
>=20
> Many thanks in advance

You can fix the thing in your syslog. For example, in rsyslog;
	http://www.rsyslog.com/doc/property_replacer.html

If you are using the LOG target, there is nothing to do except patcking
kernel.
If you are using ULOG or NFLOG, you can patch ulogd ou ulogd2 to forget
about the MAC part. It should be easy.

BR,
--=20
Eric Leblond=20
Blog: http://home.regit.org/

--=-CI6NeHQ9NcnIIzIe8nrI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4GRR0ACgkQnxA7CdMWjzIIrwCeNMAtg7zRhAej5K7wR7jUYmv2
62kAn1gHPJSA9eRkKgEh+0ZU5xDXb7uM
=g/Fo
-----END PGP SIGNATURE-----

--=-CI6NeHQ9NcnIIzIe8nrI--

