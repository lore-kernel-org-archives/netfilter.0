From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: 1:1 NAT
Date: 22 Jan 2003 07:21:48 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1043212908.1541.67.camel@rayw.knowledgefactory.co.za>
References: <001301c2c166$2c7671a0$1e01a8c0@win2k.com>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-Z0Njcn7HFxV23cACaTGC"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001301c2c166$2c7671a0$1e01a8c0@win2k.com>
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


--=-Z0Njcn7HFxV23cACaTGC
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

There is a patch-o-matic patch called SAME which does 1:1 NAT.

iptables -t nat -A POSTROUTING -o eth1 -s 192.168.0.0/24 -j SAME
196.4.160.0/24

I forget the exact syntax ....

On Tue, 2003-01-21 at 18:00, Mike wrote:
> Can anyone point me to some docs on setting up 1:1 NAT on netfilter?
>=20
> What I am trying to do is like how its done on cisco PIX i.e
> "static (inside,outside) 208.15.232.12 192.168.1.167 netmask 255.255.255.=
255
> 0 0"
>=20
> That way I don't have to do IP alias on my ethernet card.
>=20
> Thanks,
>=20
> Mike
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

--=-Z0Njcn7HFxV23cACaTGC
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA+Liprh1fuR/Bv+ygRAt2aAKCQ5RGMY7NZS7Z3HaLGg1aN1IV7HgCfYB1A
8JMOHMYSw2SvRGr2Q+nAWeo=
=7UC5
-----END PGP SIGNATURE-----

--=-Z0Njcn7HFxV23cACaTGC--


