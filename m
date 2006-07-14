From: Tom Eastep <teastep@shorewall.net>
Subject: Re: Strange NAT Behavior
Date: Fri, 14 Jul 2006 07:29:26 -0700
Message-ID: <44B7AA46.7080105@shorewall.net>
References: <005a01c6a750$847a7d00$e30da8c0@tmilawton.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig75D9C25B7755905311C1274E"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <005a01c6a750$847a7d00$e30da8c0@tmilawton.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: "Anthony R. Vallario" <avallario@tecmasters.com>, netfilter@lists.netfilter.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig75D9C25B7755905311C1274E
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Anthony R. Vallario wrote:
> Sure enough, there are logged events
> from when one of the LAN pc's was blocked from going to say yahoo, adob=
e
> or google. Weird thing is, it's random. Ports are random to.I can't mak=
e
> heads or tales out of a pattern or reason why. So why on earth would a
> nat firewall with no outgoing drop rules all of a sudden block these la=
n
> pc's?

Check the DROP log messages -- is the IN=3D interface your LAN interface =
or your
WAN interface? If it is the WAN interface, check your cabling to be sure =
that
you haven't bridged the LAN and WAN sides of your firewall.

-Tom
--=20
Tom Eastep    \ Nothing is foolproof to a sufficiently talented fool
Shoreline,     \ http://shorewall.net
Washington USA  \ teastep@shorewall.net
PGP Public Key   \ https://lists.shorewall.net/teastep.pgp.key


--------------enig75D9C25B7755905311C1274E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFEt6pLO/MAbZfjDLIRAkRJAJwKRxjHCdsr3FM1n3h9ERj8ZUxxdQCeOsMn
d3EfKQoV/a53y63r7V3pprY=
=HXbs
-----END PGP SIGNATURE-----

--------------enig75D9C25B7755905311C1274E--

