From: Stephan Uhlmann <su@su2.info>
Subject: Re: nat:REDIRECT on localhost not working in Kernel 2.6
Date: Fri, 19 Nov 2004 19:03:41 +0100
Message-ID: <200411191903.41692.su@su2.info>
References: <200411191836.07261.su@su2.info>
	<20041119174100.GA20905@bender.817west.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1369447.TrVClQBVJh";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041119174100.GA20905@bender.817west.com>
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
To: Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

--nextPart1369447.TrVClQBVJh
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Friday 19 November 2004 18:41, Jason Opperisano wrote:
> are all kernels in question compiled with:  IP_NF_NAT_LOCAL

No, all kernels I tested have that option not set. They are default kernels=
=20
from the distributions and that option seems not to be enabled by default.

Strangely the option is also not set on the kernel 2.4 machine where the=20
redirect worked.

Anyway I guess the problem will go away if I set this option. Thank you for=
=20
the hint and your quick response!


Cheers,
Stephan

--nextPart1369447.TrVClQBVJh
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBBnjV90TAeRPnvmyERAr6MAJ4jKodwKQaOUNU4XVhSj43sAtLIiACeOuzK
P5JCjxG+fCJja8aCz40C4vo=
=ay7v
-----END PGP SIGNATURE-----

--nextPart1369447.TrVClQBVJh--

