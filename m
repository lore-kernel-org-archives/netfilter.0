From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: examining data portion of packet
Date: Wed, 24 Mar 2004 09:18:58 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1080112737.2387.47.camel@raylinux.internal>
References: <20040324054521.27142.qmail@web60002.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-RBQcsw8VfswCBjVbjNor"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040324054521.27142.qmail@web60002.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-RBQcsw8VfswCBjVbjNor
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2004-03-24 at 07:45, Sandy C wrote:
>    I would like to be able to be able to examine the
> data portion of a network packet after matching it.=20
>=20
>    I figured there would be some kind of target for
> this, but there isn't...or at least I couldn't find
> any.
>=20
>    What is the best way to go about this? Should I be
> thinking of writing a target extension?
>=20
You could use something like ntop or tcpdump.

> Thanks!
> S C
>=20
>=20
> __________________________________
> Do you Yahoo!?
> Yahoo! Finance Tax Center - File online. File on time.
> http://taxes.yahoo.com/filing.html
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-RBQcsw8VfswCBjVbjNor
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBAYTZhh1fuR/Bv+ygRAp8dAJ9FJSAZjBkQ6SP2wIpZXXXXlcGIuQCfRqB/
GFkiWTH/yYbZJPSXYKiEOZo=
=Mf60
-----END PGP SIGNATURE-----

--=-RBQcsw8VfswCBjVbjNor--


