From: Harald Welte <laforge@netfilter.org>
Subject: Re: iptables is complaining with bogus unknown error
	18446744073709551615
Date: Thu, 27 Apr 2006 10:51:19 -0300
Message-ID: <20060427135119.GB5177@rama>
References: <200604210738.k3L7cBGO010103@mailgw.aecom.yu.edu>
	<a06230901c075ca078b8d@[129.98.90.227]>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yNb1oOkm5a9FJOVX"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <a06230901c075ca078b8d@[129.98.90.227]>
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
To: Maurice Volaski <mvolaski@aecom.yu.edu>
Cc: netfilter@lists.netfilter.org, linux-kernel@vger.kernel.org


--yNb1oOkm5a9FJOVX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 26, 2006 at 09:12:38PM -0400, Maurice Volaski wrote:
> Automatic kernel module loading! That is an option and it's off by
> default. When it's off, attempts to load kernel modules are ignored
> internally, and that's why iptables was failing. It tried to load=20
> xt_tcpudp, but was ignored by the kernel.

What do you mean by "it's an option" and "is off by default".  I would
claim that any major linux distribution that I've seen in the last ten
years has support for module auto loading (enabled by default).

There are many userspace programs that try to autoload modules, such as
device-mapper, ipsec, etc. =20

If you disable module autoloading, it's your own responsibility to load
modules manually.

So the only thing that I really consider a bug is that bogus error
message of iptables.  This has been fixed in SVN, case closed.

--=20
- Harald Welte <laforge@netfilter.org>                 http://netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--yNb1oOkm5a9FJOVX
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQFEUMxXXaXGVTD0i/8RAk4rAJsHQ3b+gPR4259+l1AUEIeS1fdAlgCcDD3b
a9ytrRZZ11XgkS75AVTn9/s=
=efeV
-----END PGP SIGNATURE-----

--yNb1oOkm5a9FJOVX--

