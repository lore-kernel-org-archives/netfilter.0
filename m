From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Interesting request. block x.x.0.0
Date: 22 Jan 2003 09:43:56 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1043221436.1541.112.camel@rayw.knowledgefactory.co.za>
References: <200301220116.18451.danielf@supportteam.net>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-osAVK/Uv9lXzy24+0iFS"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200301220116.18451.danielf@supportteam.net>
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


--=-osAVK/Uv9lXzy24+0iFS
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

What about :
iptable -A FORWARD -s x.x.0.0/0.0.255.255 -j DROP

On Wed, 2003-01-22 at 09:16, Daniel F. Chief Security Engineer - wrote:
> Anybody know of a way to block this traffic. Notice it's comming from jus=
t the=20
> 0.0 addresses obviously spoofed. But can you block x.x.0.0 with out block=
ing=20
> every thing else in the range with out a rule per IP.=20
>=20
> This is s snippit of a dDoS we seen recently.=20
>=20
> 01:19:57.644845 45.208.0.0.1669 > x.x.x.x.53: S 1685323776:1685323776(0)=20
> 01:19:57.651441 45.210.0.0.1434 > x.x.x.x.53: S 1296957440:1296957440(0)
> 01:19:57.659812 46.79.0.0.1738 > x.x.x.x.53: S 1536360448:1536360448(0)
> 01:19:57.668782 46.82.0.0.1099 > x.x.x.x.53: S 867631104:867631104(0)
> 01:19:57.693367 46.216.0.0.1627 > x.x.x.x.53: S 1775828992:1775828992(0)=20
> 01:19:57.699377 47.86.0.0.1712 > x.x.x.x.53: S 543227904:543227904(0)=20
> 01:19:57.717765 47.222.0.0.1109 > x.x.x.x.53: S 1708457984:1708457984(0)=20
> 01:19:57.733676 48.93.0.0.1669 > x.x.x.x.53: S 169934848:169934848(0)=20
>=20
> I ended up just blocking tcp tp port 53 and allowed UDP through which all=
owed=20
> our name servers to work fine. TCP is rarely used on the IPs that were be=
ing=20
> attacked.=20
>=20
> Thanks
>=20
> --
> Daniel Fairchild - Chief Security Engineer | danielf@supportteam.net
--=20
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
(  Raymond Leach                       )
 ) Knowledge Factory                  (
(                                      )
 ) Tel: +27 11 445 8100               (
(  Fax: +27 11 445 8101                )
 )                                    (
(  http://www.knowledgefactory.co.za/  )
 ) http://www.saptg.co.za/            (
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   o                                o
    o                              o
        .--.                  .--.
       | o_o|                |o_o |
       | \_:|                |:_/ |
      / /   \\              //   \ \
     ( |     |)            (|     | )
     /`\_   _/'\          /'\_   _/`\
     \___)=3D(___/          \___)=3D(___/

--=-osAVK/Uv9lXzy24+0iFS
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA+Lku8h1fuR/Bv+ygRAnB+AJ9vWI2+uv05vmAQ5hn9rXossGzqigCePEeM
qRtV1kZ9peftj5T6+/cfJNM=
=tmD5
-----END PGP SIGNATURE-----

--=-osAVK/Uv9lXzy24+0iFS--


