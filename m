From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: hi..
Date: 09 Dec 2002 13:31:19 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1039433479.1713.24.camel@rayw.knowledgefactory.co.za>
References: <3DF47485.6040709@inbox.lv>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-ZWG+R1XbUzlNOMCjHWe/"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3DF47485.6040709@inbox.lv>
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


--=-ZWG+R1XbUzlNOMCjHWe/
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2002-12-09 at 12:46, Arindam Haldar wrote:
> hi all,
>=20
> just a thought....
> i want to know if the -N  flag is avaiable for PREROUTING/POSTROUTING=20
> mangle/nat etc ?
> i know the below is possible ...
> iptables -N myTable
> iptables -A INPUT -s <ip> -j myTable
>=20
> but if want to do this-->>
> iptables -A POSTROUTING -t nat -s <> -j myTableTwo
> or
> iptables -A PRETROUTING -t mangle -s <> -j myTableTwo
> is it possible ?.. how do i create a new table for this ?

try this:
iptables -t nat -N test
iptables -A PREROUTING -t nat -s <> -j test



> thanking in advance..
> A.H
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

--=-ZWG+R1XbUzlNOMCjHWe/
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA99H8Hh1fuR/Bv+ygRAnnYAJ45KLz9orC7+2BNyWe4nEK8yvus9ACfXETB
M62fthHMIYNxawwop6ztYlE=
=HCE3
-----END PGP SIGNATURE-----

--=-ZWG+R1XbUzlNOMCjHWe/--


