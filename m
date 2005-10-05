From: Harald Welte <laforge@netfilter.org>
Subject: Re: ip_nat_pptp ICMP rejected failures
Date: Wed, 5 Oct 2005 17:44:53 +0200
Message-ID: <20051005154453.GC4184@rama>
References: <20051005151309.GA28129@domsch.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cvVnyQ+4j833TQvp"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20051005151309.GA28129@domsch.com>
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
To: Matt Domsch <matt@domsch.com>
Cc: netfilter@lists.netfilter.org


--cvVnyQ+4j833TQvp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 05, 2005 at 10:13:09AM -0500, Matt Domsch wrote:
> Harald, thanks much for your efforts on the ip_nat_pptp helper.  I've
> been using a 2.2 kernel on my firewall for years simply because it had
> this functionality.

there have been patches for lots of 2.4 and 2.6 releases, though.

thanks for the detailed bugreport, I'll try to analyze the problem once
I'm back from http://workshop.netfilter.org/

Please try to explicitly add a drop rule for the ICMP packets and see
whether it works then.  Sounds strange, but I have my reasons for asking
;)

Thanks

--=20
- Harald Welte <laforge@netfilter.org>                 http://netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--cvVnyQ+4j833TQvp
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQFDQ/T1XaXGVTD0i/8RAkXKAKCQ99tygpGT14/zvVmvT4/iQb8vlgCgmZNt
YHWtNNI980yM0MgMHDa0+WI=
=kL24
-----END PGP SIGNATURE-----

--cvVnyQ+4j833TQvp--

