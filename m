From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Problems after recompiling iptables 1.2.7 ..
Date: 20 Jan 2003 09:59:50 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1043049590.1543.5.camel@rayw.knowledgefactory.co.za>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-3BJsblbe9A7Ps8HynMG7"
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


--=-3BJsblbe9A7Ps8HynMG7
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi

I have a problem with NAT after recompiling iptables and my kernel.

This line gives an 'invalid argument' error:
iptables -t nat -A PREROUTING -i eth0 -s 192.168.0.0/24 -j SNAT
--to-source 196.4.160.2

Is there something wrong with the above line, or is there something
wrong with my kernel or iptables?

kernel version =3D 2.4.20 - 'Full Nat' is enabled
patch-o-matic 'time' patch applied
iptables version =3D 1.2.7

There were no errors during compile. Although, after rebooting the
machine complains about a missing map file.

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

--=-3BJsblbe9A7Ps8HynMG7
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA+K6x2h1fuR/Bv+ygRAumCAJ4pgZmYWN3qSvmAknE+OUPWEIjyswCeMBX6
PAXmf5kHxS2KY1vYQFJ0YVM=
=9Bp7
-----END PGP SIGNATURE-----

--=-3BJsblbe9A7Ps8HynMG7--


