From: Alexander Samad <alex@samad.com.au>
Subject: Re: Redirect ports on localhost
Date: Wed, 24 Mar 2004 14:14:27 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040324031427.GO3387@samad.com.au>
References: <406099AD.2070403@verio.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QGBKWVSgmlsIyJ+t"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <406099AD.2070403@verio.net>
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


--QGBKWVSgmlsIyJ+t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 23, 2004 at 01:10:21PM -0700, Ben Yerushalmi wrote:
> Hi,
>=20
> I'm trying to redirect traffic on my DNS server. I have bind listening=20
> on port 5300 (UDP) instead of 53. I've got it working from the internal=
=20
> network but seem to have problem on redirecting localhost traffic. I've=
=20
> tried changing both PREROUTING and OUTPUT chains in the nat table but it=
=20
> doesn't seem to help.
>=20
> iptables -A PREROUTING -t nat -p udp -i lo --dport domain -j REDIRECT=20
> --to-ports 5300
>=20
> and
>=20
> iptables -A OUTPUT -t nat -p udp -d localhost  --dport domain -j=20
> REDIRECT --to-ports 5300
might be of target but will the destination be localhost or the real ip
address ?

A

>=20
>=20
> Anyone have luck doing this? What am I missing?
>=20
> Thanks,
> Ben
>=20
>=20
>=20
>=20

--QGBKWVSgmlsIyJ+t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAYP0TkZz88chpJ2MRAs2OAJ0WTbv/F2W4FhZKjvjc3eqZiGXUvQCfS5P5
yXXBcDYUYUfkeSA5B230eFY=
=D+hs
-----END PGP SIGNATURE-----

--QGBKWVSgmlsIyJ+t--

