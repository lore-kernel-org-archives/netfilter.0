From: Harald Welte <laforge@netfilter.org>
Subject: Re: Small question
Date: Thu, 21 Oct 2004 17:35:04 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041021153504.GI3551@sunbeam.de.gnumonks.org>
References: <E73D9A5BC4A2D711BBC600065BF3595F14D432AF@il06exm10>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Yia77v5a8fyVHJSl"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <E73D9A5BC4A2D711BBC600065BF3595F14D432AF@il06exm10>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
To: Reddy Sreenivasulu-FSR224 <Sreeni@motorola.com>
Cc: Netfilter Mailinglist <netfilter@lists.netfilter.org>


--Yia77v5a8fyVHJSl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 21, 2004 at 10:08:46AM -0500, Reddy Sreenivasulu-FSR224 wrote:
> Hello,
> 	I am using iptables and want to know what class of NAT ( Full
> 	cone NAT, Restricted, Port Restricted or Symmetric) does the
> 	iptables support. If this is not the right place ..please direct
> 	me to the right place...thanks

the right place is netfilter@lists.netfilter.org

iptable_nat is fully symmetric NAT.

> Regards,
> Sreeni

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--Yia77v5a8fyVHJSl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBd9coXaXGVTD0i/8RAm2eAJsEd9e0ZCUGdUBOl/xNjFBbydJERACbBYXs
PKDH3ZcN+TkplSMOTACRtgA=
=/D/g
-----END PGP SIGNATURE-----

--Yia77v5a8fyVHJSl--

