From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Logging to pgSQL
Date: 20 Feb 2003 13:37:56 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1045741074.18829.127.camel@rayw.knowledgefactory.co.za>
References: <1045543090.710.37.camel@monster.thevirtual.co.nz>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-YJ6F73Un2RoAoTGwvJwj"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1045543090.710.37.camel@monster.thevirtual.co.nz>
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


--=-YJ6F73Un2RoAoTGwvJwj
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2003-02-18 at 06:38, William Hamilton wrote:
> Is there a method to log all output to PostgreSQL database?  If so any
> pointers to some docs please?
>=20
You need to use the ULOG patch from patch-o-matic on www.netfilter.org.

> tia
>=20
> William
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

--=-YJ6F73Un2RoAoTGwvJwj
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA+VL4Rh1fuR/Bv+ygRAuCHAKCJUynbUetU1hHTd3uSl2lWk2jGHQCgtNkP
YmK0M7g6mS5o5K3m+3SfnD4=
=amCd
-----END PGP SIGNATURE-----

--=-YJ6F73Un2RoAoTGwvJwj--


