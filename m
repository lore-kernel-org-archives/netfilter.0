From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: QoS limitations ....
Date: 17 Dec 2002 13:16:53 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1040123813.1886.89.camel@rayw.knowledgefactory.co.za>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-v0Q1ipdrgEbeJlI9Gfbs"
Return-path: <netfilter-admin@lists.netfilter.org>
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


--=-v0Q1ipdrgEbeJlI9Gfbs
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi all

Does anyone know of a limit to the number of filters or classes that can
be attached to a single qdisc (let's say CBQ or HTB)?

I have a client that want to do bandwidth throttling per ip across 10
class C subnets.

What problems can I expect, and does anyone have any other suggestions
on how to accomplish this?

Ray

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

--=-v0Q1ipdrgEbeJlI9Gfbs
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA9/wekh1fuR/Bv+ygRAqC1AKCGgs7sRhCOZfqaWlj/Z5+ryANHPACfQz5f
P989v/Mb15P+IRCOiifmLng=
=8R+h
-----END PGP SIGNATURE-----

--=-v0Q1ipdrgEbeJlI9Gfbs--


