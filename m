From: Athan <netfilter@miggy.org>
Subject: Re: error Invalid kernel header inluded in user space
Date: Mon, 10 Mar 2003 16:13:25 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030310161325.GJ1025@miggy.org>
References: <1047034725.3e687b653bce1@lavache.alinto.com> <1047311307.3e6cb3cbf12c5@lavache.alinto.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="M0YLxmUXciMpOLPE"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1047311307.3e6cb3cbf12c5@lavache.alinto.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Sabrina Lautier <slautier@lavache.com>
Cc: Netfilter mailing list <netfilter@lists.netfilter.org>


--M0YLxmUXciMpOLPE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 10, 2003 at 04:48:27PM +0100, Sabrina Lautier wrote:
> > When I try to compile here is the error I get:
> >=20
> **********************************************************************
> > $ make KERNEL_DIR=3D/usr/src/kernel/linux
> > Extentions found:
> > cc -02 ...
> > In file included from
> > /usr/src/kernel/linux/include/linux/config.h:4,
> > from /usr/src/kernel/linux/include/linux/netfilter_ipv4.h:8,
> > from
> > /usr/src/kernel/linux/include/linux/netfilter_ipv4/iptables.h:25,
> > from include/libiptc.h:6,
> > from include/iptables.h:5,
> > from extentions/libipt_ah.c:8,
> > /usr/include/linux/autoconf.h:1:2: #error Invalid kernel
> > header
> > inluded in user space
> > make: ** [extentions/libipt_ah_sh.o] Error 1

  This implies something is defining __KERNEL__ (or not) when it
shouldn't (or should) be.  Yes, I'm being vague as I've not tried it
myself.  I notice the "cc -O2 ..." above, the full line might help.
Also the actual error is from "/usr/include/linux/autoconf.h", do
symlinks make that the same as
"/usr/src/kernel/linux/include/linuxautoconf.h" or is it part of some
'stub' headers package on your system?  A mismatch could cause such a
problem.

-Ath
--=20
- Athanasius =3D Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME

--M0YLxmUXciMpOLPE
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj5suaUACgkQzbc+I5XfxKd2bQCgixB2gQtUWgXc8y7fAKXVCcEu
fUwAn0nUCeSz2TD/W2YKXnEFaDn3GgOf
=tciG
-----END PGP SIGNATURE-----

--M0YLxmUXciMpOLPE--

