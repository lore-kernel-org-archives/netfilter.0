From: Harald Welte <laforge@netfilter.org>
Subject: Re: Latest POM and kernel 2.6
Date: Tue, 7 Oct 2003 11:50:11 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031007095011.GK18246@sunbeam.de.gnumonks.org>
References: <02aa01c38c22$0cc66090$6e69690a@rimas> <Pine.LNX.4.51.0310061805490.6963@dns.toxicfilms.tv>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vJguvTgX93MxBIIe"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.51.0310061805490.6963@dns.toxicfilms.tv>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Cc: Remus <rmocius@auste.elnet.lt>, netfilter@lists.netfilter.org


--vJguvTgX93MxBIIe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 06, 2003 at 06:10:40PM +0200, Maciej Soltysiak wrote:
> Hi,
>=20
> > Is any chance to apply the latest POM to kernel 2.6?
> Not all of it. Generally some pom patches will:

yes, I need to write the 2.6 version of the patch-o-matic 'runme' script
first.  Maybe I'll pick this up in the next couple of days.

(Rusty, who's certainly not reading this mail, has offered to work on
the testsuite if I rewrite patch-o-matic runme.  So there's quite some
motivation behind doing the pom-runme rewrite [in perl!])=20

> Regards,
> Maciej

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--vJguvTgX93MxBIIe
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQE/goxSXaXGVTD0i/8RAi3ZAJ9QCWKZN6Vwz6x/oBGvQ8z/w/5AVwCgrHG8
hEhEfEnkclX9O4JJOVAu+c8=
=J+V3
-----END PGP SIGNATURE-----

--vJguvTgX93MxBIIe--

