From: Harald Welte <laforge@netfilter.org>
Subject: Re: iptables-1.2.8-20030929 does not compile connmark match lib module
Date: Fri, 3 Oct 2003 12:30:31 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031003103031.GY5758@sunbeam.de.gnumonks.org>
References: <3F79D80E.2010903@uga.com.br>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6+nW2YxI2ktSxLND"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3F79D80E.2010903@uga.com.br>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Carlo Pires <carlo@uga.com.br>
Cc: netfilter@lists.samba.org


--6+nW2YxI2ktSxLND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 30, 2003 at 04:22:54PM -0300, Carlo Pires wrote:
> Well, after compile k2.4.22 with patch-o-matic-20030929 from snapshot I=
=20
> had some problems to compile iptables-1.2.8-20030929. The match lib=20
> module libipt_connmark didn't compile.
>=20
> iptables-1.2.8-20030929 seens to lack some .xxx-test file in extensions=
=20
> after I check this I found missing the following files:
>=20
> .NETLINK.test

This file is perfectly included in my  CVS tree.

> .connmark-test

this is no longer needed, since ipt_connmark.h is included in the
iptables/include/linux/netfilter_ipv4 directory.

If you have any compile errors, please give me a complete output of your
'make' process, including the exact make commandline you used.

> Then I just put these files from iptables-1.2.8.tar.bz2 package to=20
> extensions dir of iptables-1.2.8-20030929 package and everything=20
> compiled well.

this might be a workaround, but it is _not_ the solution.

> []s
> Carlo

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--6+nW2YxI2ktSxLND
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/fU/HXaXGVTD0i/8RAo4LAKCLuNCCTPPZgsq+qYaoVUg/u+JL1wCfeBdY
bxsVHCiE1ufOFrzgOcxsmmc=
=8mni
-----END PGP SIGNATURE-----

--6+nW2YxI2ktSxLND--

