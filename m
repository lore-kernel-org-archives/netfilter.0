From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Restricting IP addresses from ports
Date: 26 Feb 2003 14:11:23 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1046261483.1405.4.camel@rayw.knowledgefactory.co.za>
References: <Pine.LNX.4.44.0302260931300.23134-100000@ns1.teamraf.com>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-Ow7+8RJdTdWe7O7AiBmE"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0302260931300.23134-100000@ns1.teamraf.com>
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


--=-Ow7+8RJdTdWe7O7AiBmE
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2003-02-26 at 17:33, Bob wrote:
>   Or better yet, how do I allow a specific IP address access to a port=20
> like SSH?  I want to deny all access to ports on a system that I manage=20
> except for specific addresses.
>=20
To specifically allow only one IP address access to a specific port on
the machine running iptables use an input rule:

iptables -A INPUT -p tcp --dport 22 -s 10.0.0.100 -j ACCEPT

This assumes that your default policy for INPUT is DROP (or REJECT), or
this rule comes before any rule that would drop this traffic.

10.0.0.100 is your client machine.

>   Thanks!
>    Bob
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

--=-Ow7+8RJdTdWe7O7AiBmE
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA+XK7qh1fuR/Bv+ygRAsIrAJ437TRBLR4lXMeCY/K+f5T6nZ9R8QCfUGbJ
9Rk5cqsErH+cgxs9MUZbkWA=
=6Swt
-----END PGP SIGNATURE-----

--=-Ow7+8RJdTdWe7O7AiBmE--


