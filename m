From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: time modules
Date: 18 Mar 2003 09:37:30 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1047973050.1483.8.camel@raylinux.internal>
References: <10112294515.20030318122425@fakt.tazovsky.ru>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-PeMa99Xhr1U9CpaUY7bn"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <10112294515.20030318122425@fakt.tazovsky.ru>
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


--=-PeMa99Xhr1U9CpaUY7bn
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

If you use SNAT (masquerade) then it may be bypassing the input chain
because of a prerouting rule ...

On Tue, 2003-03-18 at 09:24, netfilter-maillist wrote:
> Hello
>=20
> iptables -I INPUT 1 -p tcp -s 192.168.1.2/32 -m time --timestart \
> 11:00 --timestop 17:00 --days Sun,Mon,Tue,Wed,Thu,Fri,Sat \
> -d 192.168.1.1/32 --j DROP =20
> Defaul policy in INPUT chain - DROP
> But... packets allows to 192.168.1.240 (server) in this
> time --> 11:00-17:00.
>=20
> Why?
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
(  http://www.mapnet.co.za/            )
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


--=-PeMa99Xhr1U9CpaUY7bn
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+dsy6h1fuR/Bv+ygRAuT/AJ4zh2+N1qoaLv76wIME+XW6juia/QCgqIoy
612xrfgWqvoRcVxV8Qbj3ZU=
=fBJ2
-----END PGP SIGNATURE-----

--=-PeMa99Xhr1U9CpaUY7bn--


