From: Harald Welte <laforge@netfilter.org>
Subject: Re: iptables and SMP performance
Date: Tue, 1 Feb 2005 15:17:32 +0100
Message-ID: <20050201141732.GU6878@sunbeam.de.gnumonks.org>
References: <1106588554.8961.41.camel@d-phiggins-lnx.rovingplanet.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DS29MnVNPmky9ZU5"
Content-Disposition: inline
In-Reply-To: <1106588554.8961.41.camel@d-phiggins-lnx.rovingplanet.com>
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
To: Patrick Higgins <phiggins@rovingplanet.com>
Cc: netfilter@lists.netfilter.org


--DS29MnVNPmky9ZU5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 24, 2005 at 10:42:33AM -0700, Patrick Higgins wrote:

> The rules are being applied to eth0 in our simplified test, and it
> looks like the interrupts are only being serviced by CPU0. It appears
> the iptables rules are also being tested on CPU0.

Yes, the whole network stack is traversed on the CPU that has received
the innterrupt from the nic.

> Could we get better performance by balancing the eth0 interrupts
> across CPUs? If not, how about balancing the testing of iptables
> rules?

You should set irq affinity so that e.g. eth0->cpu0, eth1->cpu1, etc.

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--DS29MnVNPmky9ZU5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFB/498XaXGVTD0i/8RAklhAJ4nQFUrvZ1LGWtSVi4hQZNLbi2pBACfU1We
qqV6Hh6mE/evWjSMApBk+7A=
=i9wp
-----END PGP SIGNATURE-----

--DS29MnVNPmky9ZU5--

