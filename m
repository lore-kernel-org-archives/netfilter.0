From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: iptables masquerade cache  problems
Date: Mon, 29 Sep 2003 13:19:26 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1064834366.16245.24.camel@raylinux.internal>
References: <001e01c38662$f2a93bc0$01070a0a@858sxt07>
	 <200309291304.46583.woksy@ether.net1.nerim.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-qdrluyzjfnJLTOV75Vd3"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200309291304.46583.woksy@ether.net1.nerim.net>
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


--=-qdrluyzjfnJLTOV75Vd3
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, 2003-09-29 at 13:04, Mickael DILY wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Hi, i have already had this problem with windows clients. It seems it's n=
ot a=20
> bug from your linux box, but only from the windows client, whose still ha=
ve=20
> your old ip in cache. For my part, i don't know how to work around for th=
is=20
> bug
>=20
You need to use ipconfig on the windows clients to flush the dns and
routing cache. See the docs on ipconfig /? on winblows.

> Le Lundi 29 Septembre 2003 10:23, lu a =E9crit :
>  Hi,
>  I have two lines that were masqueraded, one ADSL and another is ISDN for
>  backup. When the line ADSL is broken  I switch the line to ISDN. The pro=
blem
>  is: when I use ping to test (ping -t from windows client), after the lin=
e
>  was switched to ISDN, the source address was still that of ADSL  instead=
 of
>  ISDN. But, when I stopped the ping from client for a while, all things w=
ent
>  well. It seems a problem of cache. What is the work-around for it? At a
>  moment I just down the ADSL interface.  You can do this test with two la=
n
>  interfaces.
>  The Configuration is:
>  	iptables -t nat -A POSTROUTING -o hsb0 -j MASQUERADE    # for ADSL
>  	iptables -t nat -A POSTROUTING -o ippp0 -j MASQUERADE    # for ISDN
>=20
>  	default gw dev was hsb0  (ADSL)
>  	when ADSL was down then :
>  	route del default dev hsb0
>  	route add default dev ippp0
>=20
>=20
>  Best regards,
>  Jianliang Lu
>=20
>  TieSse s.p.a      Ivrea (to) Italy
>  j.lu@tiesse.com
>  luj@libero.it
>  http://www.tiesse.com
>=20
> - --=20
> - - M. DILY, administrateur r=E9seau, geek :-)
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.0.7 (GNU/Linux)
>=20
> iD8DBQE/eBHIzEzekoYhlpsRAnbvAJwMYms5Vg+d0gVfoPH3rJ/jV7s1LgCfTyKN
> SJ8P+jawRbS97afL3VxnNKg=3D
> =3DZeBt
> -----END PGP SIGNATURE-----
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-qdrluyzjfnJLTOV75Vd3
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2-rc1-SuSE (GNU/Linux)

iD8DBQA/eBU9h1fuR/Bv+ygRAqCAAJ9gC9hDYik9aJnbKR4N7foiZVF+fwCeNWbK
sJgndMhxRd478yf+lAZF2fQ=
=3RNq
-----END PGP SIGNATURE-----

--=-qdrluyzjfnJLTOV75Vd3--


