From: Harald Welte <laforge@netfilter.org>
Subject: Re: [netfilter-core] ip6tables question
Date: Wed, 30 Mar 2005 17:23:16 +0200
Message-ID: <20050330152316.GH21867@sunbeam.de.gnumonks.org>
References: <200503301301.j2UD10rV019959@future.co.kr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3TQuZyvpu40ebvIM"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200503301301.j2UD10rV019959@future.co.kr>
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
To: kesan <kesan@future.co.kr>
Cc: coreteam@netfilter.org, netfilter@lists.netfilter.org


--3TQuZyvpu40ebvIM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 30, 2005 at 10:19:11PM +0900, kesan wrote:
> Hello?
>=20
> I need to capture IPv6 packets in the prerouting stage and redirect them =
to
> another host/port. Is there a target extension for ip6tables for
> redirecting, like "REDIRECT" for iptables?=20

Please read http://www.netfilter.org/contact.html.  Don't ask usage
questions to the core team, please.

Regarding your question: There is unfortunately no REDIRECT for
ip6tables at this moment.  We're currently discussing some ideas how to
implement REDIRECT like functionality (for transparent proxes on the
local host) without requiring NAT.  This discussion is not finished, and
there is no implementation so far.

> When is support NAT table for Ip6tables?

Only over my dead body.  We will never implement ipv6-to-ipv6 network
address translation as long as I have any say in netfilter/iptables
development.  NAT is evil and causes horrible breakage of end-to-end on
the internet.  IPv6 has enough addresses and therefore no justification
for NAT.

--=20
- Harald Welte <laforge@netfilter.org>                 http://netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--3TQuZyvpu40ebvIM
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQFCSsRkXaXGVTD0i/8RAhWXAJ9hSC36BwXdBFqUYSYFJBO0+mEL1ACdGCMe
J6eBLC5PrW/GAKM9Zp5XxR4=
=87/w
-----END PGP SIGNATURE-----

--3TQuZyvpu40ebvIM--

