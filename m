From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Qos using htb and transparent squid proxy
Date: 29 Jan 2003 11:35:17 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1043832917.4693.8.camel@rayw.knowledgefactory.co.za>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-EImauHzimkBXKIKl4Ct0"
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


--=-EImauHzimkBXKIKl4Ct0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi

Has anyone had any experience with QoS using htb on a Linux internet
gateway with a transparent squid proxy installed?

I'm battling to get the bandwidth limiting to work on a per ip basis
while going through the transparent proxy. I think the proxy is doing
all the downloading (as it should be) and therefore does not obey the
bandwidth limits imposed on the requesting user.

Does anyone know how to accomplish this?

Regards

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

--=-EImauHzimkBXKIKl4Ct0
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA+N6BVh1fuR/Bv+ygRAsQsAJ9KoZ8/d3H0E4jlDRKCXktMq1Mn8QCcC19B
ck7Q3sAB1OQhw20jLfjNQ+s=
=NlH2
-----END PGP SIGNATURE-----

--=-EImauHzimkBXKIKl4Ct0--


