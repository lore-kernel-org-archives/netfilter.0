From: michel@mitch-it.com (Michel van der Klei)
Subject: Re: VPN over netfilter NAT
Date: Fri, 12 Nov 2004 14:54:42 +0100
Message-ID: <20041112135442.GA31720@debian>
References: <200409161436.26695.apapadop@alumni.carnegiemellon.edu>
	<025601c4c8b8$e81b2fd0$49caa8c0@caris.priv>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <025601c4c8b8$e81b2fd0$49caa8c0@caris.priv>
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
To: Peter Marshall <peter.marshall@caris.com>
Cc: Alexandros Papadopoulos <apapadop@alumni.carnegiemellon.edu>, netfilter@lists.netfilter.org


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 12, 2004 at 09:09:55AM -0400, Peter Marshall wrote:

> What most of the docs are refering to with "No NAT" is that for most vpn
> servers, you can not have the VPN server on an internal IP address .... it
> has to have a public address.
>=20

I don't know if you've looked at pptpproxy. I use it very often and it works
great for me.

You can find more info aon this site:

http://www.mgix.com/pptpproxy/

Greetz,

Michel
>=20

> ----- Original Message -----=20
> From: "Alexandros Papadopoulos" <apapadop@alumni.carnegiemellon.edu>
> To: <netfilter@lists.netfilter.org>
> Sent: Thursday, September 16, 2004 7:36 AM
> Subject: VPN over netfilter NAT
>=20
>=20
> I stumbled across
> http://www.linuxhomenetworking.com/linux-adv/vpn-linux.htm today, which
> states that "NAT breaks VPNs".
>=20
> Is this just an over-simplifying statement that really means "if you're
> reading this, then don't even try setting up a NAT-traversing VPN"?
>=20
> This is exactly what I'm planning to do; I've got my mind set on having
> the two VPN endpoints inside two NATed networks, both managed by
> respective dedicated linux boxes running only netfilter.
>=20
> If that is indeed possible (and doable for a first timer), could anyone
> provide some relevant pointers to documentation?
>=20
> Cheers
>=20
> -A
>=20

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFBlMCiD0Uhhw+kquIRAmZlAJ9tL5wzpBxgJzEk9WUTnNF2JOMxSgCeOM+X
bdouvZe4ktv8A9MOglk8nsk=
=5teP
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--

