From: Harald Welte <laforge@netfilter.org>
Subject: Re: [ANNOUNCE] Proceedings of Netfilter Developer Workshop 2004
Date: Mon, 27 Sep 2004 19:20:08 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040927172007.GY3236@sunbeam.de.gnumonks.org>
References: <20040925213322.GJ3236@sunbeam.de.gnumonks.org>
	<4158452F.1040904@lanl.gov>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TSQuSDCK3qmuQpCh"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <4158452F.1040904@lanl.gov>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
To: Stephen J Smoogen <smoogen@lanl.gov>
Cc: Robert Olsson <Robert.Olsson@data.slu.se>, netfilter@lists.netfilter.org


--TSQuSDCK3qmuQpCh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 27, 2004 at 10:51:59AM -0600, Stephen J Smoogen wrote:

> Is there more publishing on Rober Olsson's benchmarks and findings. We=20
> are doing various testing here and while the numbers look similar, I=20
> would like to get an established testing methodology so that we can=20
> confirm/help results from baseline tests.

http://robur.slu.se/Linux/net-development/experiments/2004/
http://robur.slu.se/Linux/net-development/experiments/10G.html
http://robur.slu.se/Linux/net-development/experiments/
=20
> Our next line of testing is to find out which network cards will give us=
=20
> the best bang for the buck on 10 gig testing. We currently have 300kpps=
=20
> at 1 gig (E1000 + 2.4.2x kernel) but not sure if we are reaching the=20
> limitations of the E1000 fibre optics or the PCI-X bus.

300kpps is bad, even for a 32bit/33MHz  PCI bus, and definitely way too
bad for any kind of PCI-X

> Stephen John Smoogen	        | CCN-5 Security Team
> LANL SIRT Team Leader           | SMTP:  smoogen@lanl.gov
> Los Alamos National Laboratory  | Voice: 505.664.0645

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--TSQuSDCK3qmuQpCh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBWEvHXaXGVTD0i/8RAksNAKCKCRGAmO5htHy4b4EHgmWP3AY3FQCeL1cU
AwImrcWDCVmsWmq3x/O6YDw=
=LJV1
-----END PGP SIGNATURE-----

--TSQuSDCK3qmuQpCh--

