From: Harald Welte <laforge@netfilter.org>
Subject: Re: question about pptp connection tracking
Date: Fri, 19 Dec 2003 09:22:52 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031219082252.GB2794@obroa-skai.de.gnumonks.org>
References: <3FE235CA.5050306@design-pt.com> <3FE24EB8.4080604@design-pt.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MfFXiAuoTsnnDAfZ"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3FE24EB8.4080604@design-pt.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Matthew Schumacher <schu@design-pt.com>
Cc: Netfilter Mailinglist <netfilter@lists.netfilter.org>


--MfFXiAuoTsnnDAfZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 18, 2003 at 04:04:56PM -0900, Matthew Schumacher wrote:
> Confirmed, compiling the pptp-conntrack-nat patch as modules and not=20
> loading them causes my pptpd server to work again, loading them causes=20
> it to break.  Since iptables doesn't seem to be dropping packets I'm=20
> assuming that either (1) I have not configured iptables correctly, (2) I=
=20
> have found a bug, or (3) this module isn't supposed to work that way.

*sigh*.  How often do I have to state this on the mailinglist:

a) which exact kernel version are you running? Plain source from
kernel.org, vendor sources?
b) which patches [apart from pptp] from what version_ of patch-o-matic
did you apply?

Do you have any idea how much changes there are in pom and the kernel
over time?  How can I guess whcih particular combination you are
running, and which potential bugs have been solved since then?

> >I'm using pptp-conntrack-nat from pom 20030912.

that's most likely the problem.   please try using a more recent version
(latest cvs snapshot or even CVS).


--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--MfFXiAuoTsnnDAfZ
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQE/4rVbXaXGVTD0i/8RAkcqAKCMQDN3Bbj1Br4tY9ILaz9ZsTPx9QCcDEeG
uN+0mPQR+Tzo5sEiPS5pQr4=
=j51Y
-----END PGP SIGNATURE-----

--MfFXiAuoTsnnDAfZ--

