From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Iptables efficiency
Date: 11 Mar 2003 15:13:40 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1047388420.11445.6.camel@raylinux.internal>
References: <007b01c2e72f$76712180$0200a8c0@rinse>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-EsuDnebhGtZ2fviUAMfG"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <007b01c2e72f$76712180$0200a8c0@rinse>
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


--=-EsuDnebhGtZ2fviUAMfG
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2003-03-10 at 20:04, Rinse Kloek wrote:
> We use a RedHat 7.3 machine as bridge on a P3 1.8 Ghz with 2 64 bits
> Gigabit interfaces. On the machine we have a lot of iptables rules like :
>             all  --  213.134.x.0        0.0.0.0/0
>             all  --  0.0.0.0/0            213.134.x.0
> TOS    all  --  213.134.x.4        0.0.0.0/0          TOS set 0x08
>             all  --  0.0.0.0/0            213.134.x.4
>=20
> We have about 3200 iptables rules on our bridge. I've tested today to
> remove 1000 of these rules. The load dropped from about 40% to 25%. So I
> think the iptables rule take up the most of the CPU load. Do you think th=
is
> is a problem of ineffeciency of iptables or just a 'limitation' in the
> TCP/IP stack of linux ?
>=20
Probably the packet parser having a hard time trying to make sense of
that many rules ...

> regards Rinse
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


--=-EsuDnebhGtZ2fviUAMfG
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+beEEh1fuR/Bv+ygRAj0RAJ9iarURsnbcD16Bi5bgFdwzmfBHgwCfeT5U
jCsoIowhjjos2bd/OEl9CV8=
=dQlh
-----END PGP SIGNATURE-----

--=-EsuDnebhGtZ2fviUAMfG--


