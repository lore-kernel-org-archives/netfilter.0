From: Andy Smith <andy@strugglers.net>
Subject: Re: Why does this connection stop being tracked?
Date: Wed, 15 Jun 2005 16:10:55 +0000
Message-ID: <20050615161055.GT754@strugglers.net>
References: <20050614161105.GN750@strugglers.net>
	<Pine.LNX.4.58.0506151312470.27260@blackhole.kfki.hu>
	<20050615113045.GF754@strugglers.net>
	<Pine.LNX.4.60.0506151154340.25078@darkstar.sysinfo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="58yjuNbz5lCTNNJH"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.60.0506151154340.25078@darkstar.sysinfo.com>
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
To: netfilter@lists.netfilter.org


--58yjuNbz5lCTNNJH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 15, 2005 at 12:07:52PM -0400, R. DuFresne wrote:
> >> You have two choices: either disable TCP SACK support on all your
> >> real/virtual machines behind your firewall, or upgrade the kernel on t=
he
> >> firewall.
> >
> > Do you have any instructions or a pointer to documentation onhow to
> > temporarily disable SACK?  If it was a /proc setting that would be
> > ideal; I don't really want to have to recompile kernels though.
> >
>=20
> why?  you are certainly missing out on how to fix and patch a systems whe=
n=20
> bugs in the kernel affect it, to the ability to add features that your=20
> dist maintainer has not enabled by default, or to change params in the=20
> kernel such as moving away or to kernel modules as opposed to stack=20
> functionality mapping.

I'm sorry, I didn't phrase that very well.  I'm perfectly happy to
compile new kernels and indeed I am required to run a patched 2.6.11
plus some other patches that I have to apply manually in order to
use Xen.

$ uname -a
Linux curacao.strugglers.net 2.6.11curacaoxen0-steven-hand1 #1 Sat Jun 4 18=
:49:26 UTC 2005 i686 GNU/Linux

I just didn't want to make a new kernel and reboot in order to test
the suggestion of disabling SACK as the downtime of a reboot on a
machine with multiple virtual machines is unpopular.

--58yjuNbz5lCTNNJH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFCsFMPIJm2TL8VSQsRAnYUAKD+LL+qIe3i66bpM+TDWLKforLHOACg4kNq
UkKiWSqiiDJg0mrnCJqcCkQ=
=PKPi
-----END PGP SIGNATURE-----

--58yjuNbz5lCTNNJH--

