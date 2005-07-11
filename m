From: Harald Welte <laforge@netfilter.org>
Subject: Re: netfilter on ia64
Date: Mon, 11 Jul 2005 09:40:36 +0200
Message-ID: <20050711074036.GI15121@sunbeam.de.gnumonks.org>
References: <200506230707.56224.mueller@rz.uni-karlsruhe.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xQR6quUbZ63TTuTU"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200506230707.56224.mueller@rz.uni-karlsruhe.de>
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
To: Matthias Mueller <mueller@rz.uni-karlsruhe.de>
Cc: netfilter@lists.netfilter.org


--xQR6quUbZ63TTuTU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 23, 2005 at 07:07:55AM +0200, Matthias Mueller wrote:
> Hi,
>=20
> I'm currently setting up a natting router (simple setup: 1:1 for about 25=
=20
> host, routing the other traffic, no filters) and got an itanium 2 box for=
=20
> that job.

ouch, ia64 is probably the most expensive overkill you can get for a
firewall.  I personally don't have any ia64 experience.  But since
iptables works fine on x86_64 and ppc64, I don't think ia64 should have
any problems.

--=20
- Harald Welte <laforge@netfilter.org>                 http://netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--xQR6quUbZ63TTuTU
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFC0iJ0XaXGVTD0i/8RAsOpAKCHYxMhZjIWsbl8/qat0NIPyjJj7ACeKdKL
3QNH6ACGbHaj0wZAfyDc8zM=
=uZLB
-----END PGP SIGNATURE-----

--xQR6quUbZ63TTuTU--

