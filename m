From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Using an device alias?
Date: 06 Jan 2003 07:30:32 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1041831032.5194.21.camel@rayw.knowledgefactory.co.za>
References: <b74ecb8788.b8788b74ec@cvip.net>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-sXoDYDIzpUVvoOLnGfap"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <b74ecb8788.b8788b74ec@cvip.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Steve M Bibayoff <smb23@csufresno.edu>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-sXoDYDIzpUVvoOLnGfap
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi

It doesn't make sense to attach rules to alias interfaces, since the
packets are coming in the same physical interface whether it is eth0:1
or eth0.

So if you use just eth0 your rules should work as expected as long as
you qualify them further with the correct (alias)ip.

Ray

On Fri, 2003-01-03 at 21:28, Steve M Bibayoff wrote:
> Sorry if everyone gets this twice, this one is a
> second posting when I realized this was a closed list.
>=20
> Original question:
> Is it possible to use iptables with a device alias
> (ex.. eth0:1)? I tries to add a filter rule and got
> an error:
> % iptables -t filter -I INPUT -i eth0:1 -j ACCEPT
> Warning: wierd character in interface `eth0:1' (No
> aliases, :, ! or *).
>=20
> If i list the rules, it's listed, but it doesn't
> appear to be working. I was wondering if someone had
> a definite answer.
>=20
> TIA
>=20
> Steve
>=20
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

--=-sXoDYDIzpUVvoOLnGfap
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA+GRR4h1fuR/Bv+ygRAiSDAKCV7HmI5CMLR7y/Dd4PZb2AxV9M2wCfR2+l
IpxH7VWwQP6jj+f01v94Sc0=
=epsf
-----END PGP SIGNATURE-----

--=-sXoDYDIzpUVvoOLnGfap--


