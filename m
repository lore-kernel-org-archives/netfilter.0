From: Harald Welte <laforge@netfilter.org>
Subject: Re: IPTables Performance...
Date: Fri, 30 Jul 2004 10:15:17 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040730081517.GM17067@sunbeam2>
References: <4104105C.4040306@switzer.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="o71xDhNo7p97+qVi"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <4104105C.4040306@switzer.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Scott Switzer <scott@switzer.org>
Cc: netfilter@lists.netfilter.org


--o71xDhNo7p97+qVi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Cc'ing netfilter list, since that is the right place for this kind of
question]

On Sun, Jul 25, 2004 at 08:56:12PM +0100, Scott Switzer wrote:

> My company serves thousands of small HTTP requests per second (roughly=20
> 3000 connections per second with a max of 10k request size - 50Mbps=20
> bandwidth), and we have just maxed out our Netscreen 204 (128,000=20
> simultanious sessions).  The next level of Netscreen is roughly $50K,=20
> and I received advice to use either iptables or pf rather than a=20
> proprietary firewall.  Since our requirements regarding the complexity=20
> of a firewall (outside of throughput) are reletively small (no complex=20
> rule sets), I am willing to look at this option.
>=20
> In short:
> Can iptables manage this kind of load?

sure!

> What are the hardware resources that are needed for this?  I have a AMD=
=20
> 2.2Ghz Opteron with 2Gb memory which could be used for this task.  It=20
> this sufficient?

I would say it's way more than sufficient ;)  I've been doing firewall
benchmarking at multiple gigabit speeds on dual opteron boxes ;)... with
a single opteron you should be able to do at least 250.000 packets per
second, even without any tuning and a very suboptimal ruleset.

> What kernel would you recommend for this?

2.6.7

> Cheers,
> Scott Switzer

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--o71xDhNo7p97+qVi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFBCgOVXaXGVTD0i/8RAj8bAKCAdGPu5VGiJ2qkJcO+AlVATh37TQCfXPjY
gRD2ABSDkT1A1N2JMAxx7Rk=
=/OZ4
-----END PGP SIGNATURE-----

--o71xDhNo7p97+qVi--

