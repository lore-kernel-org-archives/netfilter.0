From: Alexander Samad <alex@samad.com.au>
Subject: Re: SNAT and IPSEC
Date: Thu, 14 Apr 2005 15:05:56 +1000
Message-ID: <20050414050556.GC29686@samad.com.au>
References: <1113329293.29536.13.camel@fly.in.iantel.com.uy>
	<1113408523.8270.16.camel@plasma.starken.com>
	<425DB04D.4060304@riverviewtech.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JgQwtEuHJzHdouWu"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <425DB04D.4060304@riverviewtech.net>
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
To: netfilter@lists.netfilter.org


--JgQwtEuHJzHdouWu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 13, 2005 at 06:50:37PM -0500, Taylor Grant wrote:
> >Couldn't he just SNAT the packets on his side when they become un-
> >encapsulated?  I'm doing this on a couple of my vpn links.
>=20
> I don't think that you could just SNAT the packets that are on the way ou=
t=20
> because as I understand it SNAT happens in nat:POSTROUTING *after* the=20
> routing decision has been made.  I had originally thought that the IPSec=
=20
> traffic did pass through IPTables a couple of times, once unencrypted and=
=20
> then again encrypted.  But based on the LOG entries that he has presented=
=20
> the traffic only passes through IPTables one time on it's way out, and a=
=20
> couple of times on it's way in.  Seeing as how the traffic is only passin=
g=20
> through IPTables one time on it's way out, it is coming in to the system=
=20
> from the LAN and immediately going in to the IPSec stack and being=20
> encrypted and then sent out directly, leaving no chance for it to be SNAT=
ed=20
> before it enters the IPSec stack.  Reportedly there are some kernel patch=
es=20
> to fix this issues thus causing the packets to traverse IPTables twice,=
=20
> once unencrypted and once encrypted.  If the packets did indeed pass=20
> through IPTables twice they could be SNATe
> d before they did enter the IPSec VPN.  The only caveat would be that the=
=20
> IPSec VPN would have to be configured to allow traffic from the 10.3.3.x/=
24=20
> network vs his 10.2.2.x/24 network, this would have to be done on both en=
ds=20
> too.

these pacthes exist in pom-ng and I believe have made it into 2.6.8 and
above (not sure about the entry version)

>=20
>=20
>=20
> Grant. . . .
>=20
>=20

--JgQwtEuHJzHdouWu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFCXfo0kZz88chpJ2MRAnuXAJ9UGMyVqVcfdrGJdJtKW6gmCWmTZgCfWlKM
O9jET6PQKYTcnwQMnIBEaho=
=pp2x
-----END PGP SIGNATURE-----

--JgQwtEuHJzHdouWu--

