From: Sebastian Siewior <bigeasy@foo.fh-furtwangen.de>
Subject: Re: IP sent an invalid ICMP type to a broadcast and
 icmp_ignore_bogus_error_responses
Date: Thu, 12 May 2005 09:05:18 +0200
Message-ID: <20050512090518.446d78e6@mikejones.ghb.fh-furtwangen.de>
References: <20050507212628.6fd43793@mikejones.ghb.fh-furtwangen.de>
	<4282FCC3.9090109@riverviewtech.net>
Mime-Version: 1.0
Content-Type: multipart/signed;
	boundary="Signature_Thu__12_May_2005_09_05_18_+0200_BEMzwJikJAIMf=b5"; 
	protocol="application/pgp-signature"; micalg=pgp-sha1
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4282FCC3.9090109@riverviewtech.net>
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

--Signature_Thu__12_May_2005_09_05_18_+0200_BEMzwJikJAIMf=b5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 12 May 2005 01:50:43 -0500
"Taylor, Grant" <gtaylor@riverviewtech.net> wrote:

>=20
> Would it be possible to get an output of your routing table?  I'm
> starting to think that this *might* be a routing issue that somehow
> your kernel thinks that systems are available via the wrong interface.
>=20

default via 172.20.1.25 dev eth0=20
172.20.1.24/30 dev eth0  proto kernel  scope link  src 172.20.1.26=20
172.20.130.0/24 via 172.20.71.2 dev eth1=20
172.20.131.0/24 via 172.20.71.2 dev eth1=20
172.20.33.0/24 via 172.20.71.2 dev eth1=20
172.20.34.0/24 via 172.20.71.2 dev eth1=20
172.20.35.0/24 via 172.20.71.2 dev eth1=20
172.20.36.0/24 via 172.20.71.2 dev eth1=20
172.20.37.0/24 via 172.20.71.2 dev eth1=20
172.20.38.0/24 via 172.20.71.2 dev eth1=20
172.20.39.0/24 via 172.20.71.2 dev eth1=20
172.20.40.0/24 via 172.20.71.2 dev eth1=20
172.20.41.0/24 via 172.20.71.2 dev eth1=20
172.20.42.0/24 via 172.20.71.2 dev eth1=20
172.20.43.0/24 via 172.20.71.2 dev eth1=20
172.20.44.0/24 via 172.20.71.2 dev eth1=20
172.20.45.0/24 via 172.20.71.2 dev eth1=20
172.20.46.0/24 via 172.20.71.2 dev eth1=20
172.20.47.0/24 via 172.20.71.2 dev eth1=20
172.20.64.0/24 via 172.20.71.2 dev eth1=20
172.20.65.0/24 via 172.20.71.2 dev eth1=20
172.20.67.0/24 dev eth5  proto kernel  scope link  src 172.20.67.254=20
172.20.68.0/24 dev eth2  proto kernel  scope link  src 172.20.68.254=20
172.20.70.0/24 via 172.20.71.2 dev eth1=20
172.20.71.0/24 dev eth1  proto kernel  scope link  src 172.20.71.1=20
172.20.73.0/24 dev eth4  proto kernel  scope link  src 172.20.73.254=20
172.20.78.0/24 dev eth3  proto kernel  scope link  src 172.20.78.254=20



>=20
>=20
> Grant. . . .
>=20
>=20


--=20
Sebastian Siewior

--Signature_Thu__12_May_2005_09_05_18_+0200_BEMzwJikJAIMf=b5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFCgwAumNVcHP4/RwYRAtlXAJ9/3ynqXMUtN1EiqZiwTx0LcC1vvwCfemkt
IeRn46sjvVPCMZ6GqARSx6w=
=pqkJ
-----END PGP SIGNATURE-----

--Signature_Thu__12_May_2005_09_05_18_+0200_BEMzwJikJAIMf=b5--

