From: Paul Evans <paul@mxtelecom.com>
Subject: Re: Help deleting a rule
Date: Tue, 17 Nov 2009 13:10:47 +0000
Message-ID: <20091117131047.1265d134@nacelle.mxtelecom.com>
References: <edc0e50f0911161339x1ceed507vc4baffa428cad1b7@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
 boundary="Sig_/aiGkctCgYpbxvJZpV78fO5U"; protocol="application/pgp-signature"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <edc0e50f0911161339x1ceed507vc4baffa428cad1b7@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Cameron Smith <velvetpixel@gmail.com>
Cc: netfilter@vger.kernel.org

--Sig_/aiGkctCgYpbxvJZpV78fO5U
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 16 Nov 2009 13:39:38 -0800
Cameron Smith <velvetpixel@gmail.com> wrote:

> Hello,
>=20
> If I run:
> iptables -L -n -v |grep xx.xx.xx.xx
>=20
> I get:
> 112  6272 DROP       all  --  eth+   *       xx.xx.xx.xx
> 0.0.0.0/0
>=20
> I want to delete this specific rule.
> From what is printed above how do I know what line this is to use
> this command?
>=20
> iptables -D INPUT x
>=20
> Where x is the line number?

Or you can -D based on the specification of the rule

 iptables -D INPUT -o eth+ -s xx.xx.xx.xx -j DROP

--=20
Paul Evans <paul@mxtelecom.com>
Tel: +44 (0) 845 666 7778
Fax: +44 (0) 870 163 4694
http://www.mxtelecom.com

--Sig_/aiGkctCgYpbxvJZpV78fO5U
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksCoNcACgkQcGehlx3Gqx4n1ACgktOfw3HmBhhkCQ11PxSDs72a
oHEAoJjlk5BbjoM5oAYxr9My9H3QtM6W
=sVhR
-----END PGP SIGNATURE-----

--Sig_/aiGkctCgYpbxvJZpV78fO5U--
