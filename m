From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Block for MAC Address
Date: 17 Feb 2003 08:28:19 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1045463298.17705.15.camel@rayw.knowledgefactory.co.za>
References: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAFXnZnPTWmEuxnKJINDeV5MKAAAAQAAAAbn072oWMbEu2LnhUyjfPEwEAAAAA@prodigy.net.mx>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-Pi50rkBtOchX6E1icqW6"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAFXnZnPTWmEuxnKJINDeV5MKAAAAQAAAAbn072oWMbEu2LnhUyjfPEwEAAAAA@prodigy.net.mx>
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


--=-Pi50rkBtOchX6E1icqW6
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: quoted-printable

You need to get the POM (patch-o-matic) from the netfilter site and
apply the MAC address match patch for netfilter to your kernel source
and then recompile your kernel and select the MAC address matching in
the netfilter section of the kernel config.


On Wed, 2003-02-12 at 20:31, Juan Carlos Hernandez Gonzalez wrote:
> Hi list:
>=20
> =20
>=20
> I have a linux red hat and need configure my iptables for permit only
> mac address of clients =85=85 some know how make this .. Thanks
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

--=-Pi50rkBtOchX6E1icqW6
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA+UIECh1fuR/Bv+ygRAiuMAKCutzu170Y0r7e2utXQeeN8yTcEjgCeKiXk
nd+szpi8iZEEnj6QzowrCKQ=
=8Jo1
-----END PGP SIGNATURE-----

--=-Pi50rkBtOchX6E1icqW6--


