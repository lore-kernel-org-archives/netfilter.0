From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Two IP add
Date: 05 Jun 2003 15:29:06 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1054819746.13885.39.camel@raylinux.internal>
References: <200306051156.45624.pandre@darkstar.nom.za>
	 <1054813152.1206.9.camel@india>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-+OcrCJQUEYH9406YT58O"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1054813152.1206.9.camel@india>
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


--=-+OcrCJQUEYH9406YT58O
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2003-06-05 at 13:38, Dharmendra.T wrote:
> On Thu, 2003-06-05 at 15:26, Paulo Andre wrote:=20
>         I would like to do the following:
>        =20
>         Stop MASQUESRADING to two servers say. 10.10.10.5 and 10.10.10.8,=
 how would i=20
>         do this with a rule.
>        =20
>         iptables -t nat -A POSTROUTING -s x.x.x.x -d ! 'servers ip' -j MA=
SQUERADE=20
>         now how would i put in two ip address's ?
>        =20
>        =20
>         	Hi
> iptables -t nat -A POSTROUTING -s 10.10.10.5 -d 'sever ip' -j DROP=20
> iptables -t nat -A POSTROUTING -s 10.10.10.8 -d 'sever ip' -j DROP=20
>=20
> Should work=20
No, that will drop the packets and they won't traverse any more
tables/chains.

the -j return tells iptables to leave the POSTROUTING chain and
continue, so no more POSTROUTING rules will be checked for that packet.

the nat table has these chains:

PREROUTING
POSTROUTING
OUTPUT

A target of -j return means leave this chain and continue to the next.

Ray

> --=20
> Regards
> Dharmendra.T
>=20
>=20
> This message is intended for the addressee only. It may contain privilege=
d or Confidential information. If you have received this message in error,p=
lease notify the sender and destroy the message immediately.Unauthorised us=
e or reproduction of this message is strictly prohibited.
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--


--=-+OcrCJQUEYH9406YT58O
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+30Wih1fuR/Bv+ygRAniGAKCoyx7UUIRVq8Emh6Wx5R0UH2f16QCfSvN6
lJZbC7CaFnFCv4oBpK3XBw4=
=Eo00
-----END PGP SIGNATURE-----

--=-+OcrCJQUEYH9406YT58O--


