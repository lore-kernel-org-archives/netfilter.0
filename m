From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Can netfilter do this?
Date: Thu, 25 Mar 2004 14:33:38 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1080218017.2388.125.camel@raylinux.internal>
References: <4062C994.5000506@rochester.rr.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-RuNQeyhQ1kvak/bnxZhO"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4062C994.5000506@rochester.rr.com>
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


--=-RuNQeyhQ1kvak/bnxZhO
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2004-03-25 at 13:59, Joe Mott wrote:
> I have been searching the archived lists without any success to have the=20
> following question answered:
>=20
> Is netfilter capable of knowing when someone is crafting SMTP (or FTP or=20
> HTTP or ...) packets that violate RFC rules to exploit a vulnerability=20
> in some server?

As the other replies say, the short answer is no.

You can do some filtering using the netfilter POM patches, like string
matching, TOS, TCP flags.

Regards

Ray
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-RuNQeyhQ1kvak/bnxZhO
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBAYtGhh1fuR/Bv+ygRAqocAJ93Cq3Hd2fQkuqUuuJAiXqFU4M6hgCgrp0r
4dFEcOmqy29ioyST5LebpIM=
=xXtC
-----END PGP SIGNATURE-----

--=-RuNQeyhQ1kvak/bnxZhO--


