From: Harald Welte <laforge@gnumonks.org>
Subject: Re: where are www.netfilter.org and www.iptables.org
Date: Tue, 21 Jan 2003 12:57:15 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030121115715.GC17348@sunbeam.de.gnumonks.org>
References: <200301201723.46845.snpe@snpe.co.yu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mojUlQ0s9EVzWg2t"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200301201723.46845.snpe@snpe.co.yu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: snpe <snpe@snpe.co.yu>
Cc: netfilter@lists.netfilter.org


--mojUlQ0s9EVzWg2t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2003 at 05:23:46PM +0000, snpe wrote:
> I can't get this sites.

The problem has been fixes yesterday.

> What is wrong ?

The proble was that DNS was unable at the time the apache logfiles have
been rotated.  This resulted in apache not understanding it's own
configuration file.

> Thanks
> Haris Peco

--=20
- Harald Welte / laforge@gnumonks.org               http://www.gnumonks.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
"If this were a dictatorship, it'd be a heck of a lot easier, just so long
 as I'm the dictator."  --  George W. Bush Dec 18, 2000

--mojUlQ0s9EVzWg2t
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE+LTWbXaXGVTD0i/8RAsNiAJ0a7n5TvAB5HXdZe03l2t2kibxA0QCggFrl
MdwGYkLMAkjSQGFcyM8xEFE=
=mf7D
-----END PGP SIGNATURE-----

--mojUlQ0s9EVzWg2t--

