From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: block kazaa
Date: 26 Mar 2003 07:22:17 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048656136.6602.11.camel@raylinux.internal>
References: <20030325144636.21700.qmail@web80403.mail.yahoo.com>
	 <20030326012710.2c9f4e37.scott@radsy.com>
	 <Pine.LNX.4.51.0303251655060.11657@dns.toxicfilms.tv>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-MzeJ95j9mWTNgcpANQhG"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.51.0303251655060.11657@dns.toxicfilms.tv>
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


--=-MzeJ95j9mWTNgcpANQhG
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi

Even if kazaa uses ports that can be set by the user, there must surely
be some kind of control connection when the client starts up that it
uses to establish connection to the kazaa network and tell other clients
about it's port number.

Just try to figure out (ethereal, tcpdump) what the initial connection
is. With gnutella there is an initial http connection to the 'servers'.

Ray

On Tue, 2003-03-25 at 17:57, Maciej Soltysiak wrote:
> > I am unaware of any specific netfilter technique to simply block the
> > newer versions of kazaa. Wish I could help you further. Good Luck.
> I have heard of people using the string match to reject packets with
> "X-Kazaa-User" or some other string.
>=20
> Also, you could try to block access to the network pool of dns.kazaa.com.
> I think this way if the clients have not been ever using kazaa, will not
> get addresses of other kazaa nodes. But it is a wild guess.
>=20
> Regards,
> Maciej Soltysiak
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


--=-MzeJ95j9mWTNgcpANQhG
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+gTkIh1fuR/Bv+ygRAi6ZAJ9jy6ysoczfP6sTxIo/9IA/04ZFuwCePxDk
Y/UPX6rO3AcfUOEM39Qu5IE=
=n3Tk
-----END PGP SIGNATURE-----

--=-MzeJ95j9mWTNgcpANQhG--


