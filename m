From: "Michael H. Warfield" <mhw@wittsend.com>
Subject: Proto 41 filtering and processing...
Date: Mon, 13 Sep 2004 13:45:39 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040913174539.GA17190@alcove.wittsend.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
To: netfilter@lists.netfilter.org
Cc: mhw@wittsend.com


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey all,

	I've got some questions and some observations viv-a-vis proto 41
filtering (that "named" ipv6 but, what it really is, is 6over4 in the
IPv4 tables).  These are problems where IPv4 and IPv6 interreact or
interoperate and some recognition of both layers simultaniously is
required.

	There are cases where, in handling protocol 41 traffic, I want
to respond with IPv4 errors codes.  For instance, if I receive 6to4
traffic (protocol 41 traffic with IPv6 addresses in the 2002::/16
range) from an IPv6 range I don't want to talk to, I want to send back
and IPv4 ICMP protocol unreachable (indicating that I'm not going to
talk protocol 41 with him - think scanners).  To generate the IPv4 ICMP
unreachable error, this needs to be done in the IPv4 tables, correct?
But to select out the packets, I need to examine the IPv6 addresses in
the next header up.  So it's examination of the IPv6 information in the
6over4 protocol (proto 41) by the IPv4 iptables.

	Any thoughts on the best way to accomplish this?

	Second problem...

	Someone issues a proto 41 packet addressed to me but it doesn't
come FROM any source address I recognize in any of my SIT tunnels.  So,
it shows up as proto 41 in the IPv4 tables (does it?).  Does it show up
at all in any of the IPv6 tables?  If so, what input device?  If not, how
is the error generated?  Is it an IPv6 error from one of the IPv6 addresses
or is it an IPv4 error?  Thoughts on that?

	Mike
--=20
 Michael H. Warfield    |  (770) 985-6132   |  mhw@WittsEnd.com
  /\/\|=3Dmhw=3D|\/\/       |  (678) 463-0932   |  http://www.wittsend.com/=
mhw/
  NIC whois:  MHW9      |  An optimist believes we live in the best of all
 PGP Key: 0xDF1DD471    |  possible worlds.  A pessimist is sure of it!

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iQCVAwUBQUXcw+HJS0bfHdRxAQH/OAP/YWpYFEUttobHnf8tnegEQZDHDw5Ddcso
c5t/5l8S8xVvaun1kUgseMjntqbcamw8X8IwqhWJC/IBGPS6lGx44jnyJN2kJSlF
jawPNmKAvE/cuBDc901ho6iK4+kaBstcysvqAKxjwqtYVDAgWCKe0W+13RLqIkQJ
96NrCk00q6U=
=8YCW
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--

