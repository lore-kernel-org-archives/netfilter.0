From: Alexander Samad <alex@samad.com.au>
Subject: Re: network range
Date: Sun, 4 Apr 2004 20:40:46 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040404104046.GA2821@samad.com.au>
References: <web-275929490@mail01.infosat.net> <1081029737.24410.2.camel@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1081029737.24410.2.camel@localhost>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org


--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 03, 2004 at 05:03:04PM -0500, John A. Sullivan III wrote:
> On Sat, 2004-04-03 at 15:53, IT Clown wrote:
 --- snip ---
> I usually implement anti-spoofing in two steps.  For both public and
> private interfaces I set up a rule to drop any packets from the address
> bound to the interface if it appears on a different interface.  Thus:
> iptables -t mangle -A PREROUTING -s 10.0.0.0/24 -i ! eth1 -j DROP
> iptables -t mangle -A PREROUTING -s 1.1.1.0/24 -i ! eth0 -j DROP

Isn't that what rp_filter does ?

> This is to prevent someone from using my own addresses against me.
>=20
 --- snip ---
>=20
> Someone else may have a better way but that's how I do it. I use the
> mangle table rather than filter so that I can drop bad packets ASAP.=20
> Good luck - John
> --=20
> John A. Sullivan III
> Chief Technology Officer
> Nexus Management
> +1 207-985-7880
> john.sullivan@nexusmgmt.com
> ---
> If you are interested in helping to develop a GPL enterprise class
> VPN/Firewall/Security device management console, please visit
> http://iscs.sourceforge.net
>=20
>=20
>=20
>=20

--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAb+YukZz88chpJ2MRAsGLAKDS+TsJqRPQqdXoUIKb7szdmPl85QCgsx8p
DCF5CMNmNQKtkHG5EC5fob8=
=YyMY
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--

