From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: RE: portfw on iptables 2.4 kernel problem.
Date: 10 Dec 2002 14:12:18 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1039522338.1713.118.camel@rayw.knowledgefactory.co.za>
References: <Pine.LNX.4.33.0212101245300.9625-100000@blackhole.kfki.hu>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-r8Bd5aRi3NTYCtgfa606"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.33.0212101245300.9625-100000@blackhole.kfki.hu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: rsterenborg@xs4all.nl, 'Paulo Andre' <pandre@darkstar.nom.za>, 'louie miranda' <lmiranda@chikka.com>, 'netfilter' <netfilter@lists.netfilter.org>


--=-r8Bd5aRi3NTYCtgfa606
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Thank you for clearing that up. I must have not installed/invoked the
ftp connection tracking modules for iptables then...

Ray

On Tue, 2002-12-10 at 13:52, Jozsef Kadlecsik wrote:
> On 10 Dec 2002, Raymond Leach wrote:
>=20
> > OK, then how does connection tracking work for passive ftp?
>=20
> The FTP connection tracking and NAT helper modules support active (PORT,
> EPRT) and passive (PASV, EPSV responses) ftp as well. In both cases the
> command channel is monitored and the commands/responses are parsed. As th=
e
> appropriate patterns detected, the system digs out the announced
> port (address) and prepares to accept the data channel.
>=20
> At iptables level there is no difference whatsoever between active/passiv=
e
> modes in letting in/NATing them.
>=20
> Regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : KFKI Research Institute for Particle and Nuclear Physics
>           H-1525 Budapest 114, POB. 49, Hungary
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

--=-r8Bd5aRi3NTYCtgfa606
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA99doih1fuR/Bv+ygRAklRAJwLCstv+PHvzwAmtTQIrrpDKay5XQCePYYh
FJEGv6KdrrOxTBEaOZvD6sw=
=6Z65
-----END PGP SIGNATURE-----

--=-r8Bd5aRi3NTYCtgfa606--


