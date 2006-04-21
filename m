From: Harald Welte <laforge@netfilter.org>
Subject: Re: iptables is complaining with bogus unknown error
	18446744073709551615
Date: Fri, 21 Apr 2006 08:15:30 -0300
Message-ID: <20060421111530.GE5286@rama>
References: <a06230910c06e2510acfa@[129.98.90.227]>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="X3gaHHMYHkYqP6yf"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <a06230910c06e2510acfa@[129.98.90.227]>
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


--X3gaHHMYHkYqP6yf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Maurice.

Didn't you report this bug already to bugzilla.netfilter.org (and maybe
eben to the bugme.osdl.org)?  Reporting a bug in three distinct places,
even though it has been replied to at one place is not really going to
use developer resources efficiently, don't you think?

On Fri, Apr 21, 2006 at 02:21:17AM -0400, Maurice Volaski wrote:
> At least since 2.6.1.16.1, many calls to iptables no longer function at l=
east under 64-bit x86,=20
> presumably due to a bug in the netfilter kernel code.

It probably was since 2.6.16 then, that was when the x_tables patches
were merged, the code most likely to have affected any such
incompatibility of the binary interface.  It was tested thoroughlt,
especially on x86_64, whihc is my main development platform.

However, your problem seems to be something different.  I suspect that
all rules with '-p tcp' or '-p udp' don't work, whereas others do.  You
seem to be missing the xt_tcpudp.ko module, which implements that
feature in 2.6.17-rcX kernels.=20

Please refer to
https://bugzilla.netfilter.org/bugzilla/show_bug.cgi?id=3D467

--=20
- Harald Welte <laforge@netfilter.org>                 http://netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--X3gaHHMYHkYqP6yf
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQFESL7SXaXGVTD0i/8RAiCRAJ9j+B18/ejuvsnRkQM/4rP4gesOJACggyWp
2IkQcQ2gFwZv87stcXjS04Y=
=aPbT
-----END PGP SIGNATURE-----

--X3gaHHMYHkYqP6yf--

