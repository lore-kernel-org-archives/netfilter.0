From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: marking all h323 packets with some TOS
Date: 09 Jan 2003 10:44:18 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1042101858.26554.125.camel@rayw.knowledgefactory.co.za>
References: <3E1D2F29.6443D681@networkprograms.com>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-GErj172ppc/YOIIBHV6y"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E1D2F29.6443D681@networkprograms.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Upma Gandhi <upma@networkprograms.com>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-GErj172ppc/YOIIBHV6y
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Sounds like it doesn't understand the -j FTOS. Maybe a missing module or
not compiled into the kernel?

On Thu, 2003-01-09 at 10:13, Upma Gandhi wrote:
> Hello All,=20
>          I have a following setup=20
>=20
> Internet <-> Router with netfilter configure <-> LAN(192.9.201.0/24)=20
>=20
> lets supopose eth0 is LAN side Interface and=20
> eth1 is WAN side interface.=20
>=20
> what I want to do is "Mark all h323 packets with some tos value".=20
> for which my iptables  command seems to be like this-=20
>      iptables -t mangle -A FORWARD -o eth0 -d 192.9.201.0/24 -p tcp -m
> rtp -j FTOS --set-ftos 0xb8.=20
>=20
> but it's giving an error message -=20
> iptable: No chain/target/match by tha rule.=20
>=20
> Can anybody help me out.=20
>=20
> Thanks & Regards=20
> Upma=20
> =20
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

--=-GErj172ppc/YOIIBHV6y
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA+HTZih1fuR/Bv+ygRArE2AKCB8R4mDStoDYXRhyVqE9hHaS9J8QCeKeqW
Nvjwg/E7ovmftgo9TVOwS3Y=
=JHDm
-----END PGP SIGNATURE-----

--=-GErj172ppc/YOIIBHV6y--


