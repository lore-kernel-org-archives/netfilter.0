From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: QoS using HTB and SFQ ...
Date: 12 Dec 2002 11:17:03 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1039684623.4085.47.camel@rayw.knowledgefactory.co.za>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-Jj6DsR/+8jCi4MyqRWtP"
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


--=-Jj6DsR/+8jCi4MyqRWtP
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi

Does anyone have any experience (good or bad) with using htb and sfq to
do QoS using 2.4.20 kernels?

I compiled the kernel, installed the image, but tc tells me that htb is
an unknown qdisc. I checked that I did select htb in the QoS section.

Any ideas?

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

--=-Jj6DsR/+8jCi4MyqRWtP
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA9+FQOh1fuR/Bv+ygRAoS3AKCo8wSiYip4TkJlrjLulc49y9HOhQCfXVrj
i8om1OzCpweoSNEZi5nfYXc=
=6DN+
-----END PGP SIGNATURE-----

--=-Jj6DsR/+8jCi4MyqRWtP--


