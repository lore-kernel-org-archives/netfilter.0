From: Tony Earnshaw <tonni@billy.demon.nl>
Subject: Re: Requestion for help with GRE tunnel
Date: 18 Jun 2002 22:55:43 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <1024433743.2763.141.camel@billy.demon.nl>
References: <20020618063945.A2662@inxservices.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-dgZiL6Kt+8huUYaeGRBE"
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020618063945.A2662@inxservices.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: George Garvey <tmwg-netfilter@inxservices.com>
Cc: netfilter@lists.samba.org


--=-dgZiL6Kt+8huUYaeGRBE
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

tir, 2002-06-18 kl. 15:39 skrev George Garvey:
> I'm trying to make a tunnel between 2 LANs, 192.168.1 and 192.168.2.
> Eventually over the internet, right now between 2 computers. Both
> 2.4.19.

> Everything is hooked up to a gigE switch right now. I've set the
> tunnel's IPs to LAN addresses for testing.

[Off list, because off topic]

To my mind everything's horribly complicated here. Begin with an easy
one. The point about this approach is, that you begin with something
simple that you know works and you can take one step at a time.

Connect 2 Linux routers/GRE gateways (2 NICs each, eth0 and eth1) with a
crossover cable on NIC eth0.

Make a lan each side of each route, left and right (enough with one
single machine and one crossover cable for each LAN). So that's 4
machines and 3 crossover cables.

Left hand LAN is 192.168.1., right hand LAN is 192.168.2.

Each eth0 (the NICs connecting the routers) on each router can/must have
a completely different IP number from the 2 LAN IP numbers. It doesn't
matter what, as long as the eth0s are on the same physical network.

There's no natting in any of this! You're dealing with *pure routers*.
Even when you get to the internet stage, it's still pure routing with no
natting, in principle. Nothing's got anything to do with IP tables!

Make your tunnel, set it up and ping the right hand machine on
192.168.2. from the left hand machine on 192.168.1.

When that works, optional step (since you'll have to have it on the
Internet later): stick another Linux router in the middle  and do the
same. Obviously all the IP numbers on the routers should be changed to
suit. So that's one extra machine, 2 extra NICs and 2 extra crossover
cables.

When that works, substitute your switch for the router in the middle, if
you really want it.

I've done this with FreeS/WAN x509 VPN tunnels - though never with GRE -
so I know it works :-)

Best,

Tony

--=20

Tony Earnshaw

e-post:		tonni@billy.demon.nl
www:		http://www.billy.demon.nl
gpg public key:	http://www.billy.demon.nl/tonni.armor

Telefoon:	(+31) (0)172 530428
Mobiel:		(+31) (0)6 51153356

GPG Fingerprint =3D 3924 6BF8 A755 DE1A 4AD6 FA2B F7D7 6051 3BE7 B981
3BE7B981



--=-dgZiL6Kt+8huUYaeGRBE
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dette er en digitalt signert meldingsdel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA9D55P99dgUTvnuYERAnNLAJ9759fbeSD/942s96EfIE6TRzitjQCfWwm6
Q79tKydYFArmLDZM4MbgCgo=
=lyrq
-----END PGP SIGNATURE-----

--=-dgZiL6Kt+8huUYaeGRBE--


