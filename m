From: Alan Ezust <alan.ezust@presinet.com>
Subject: Re: Patch for h323 conntack for certain kernels
Date: Wed, 27 Dec 2006 15:00:26 -0800
Message-ID: <200612271500.29460.alan.ezust@presinet.com>
References: <59064.195.55.244.106.1164885677.squirrel@www.arcoscom.com>
	<200612201258.02920.alan.ezust@presinet.com>
	<200612201317.13361.alan.ezust@presinet.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1361560.YXxX9kHGEq";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200612201317.13361.alan.ezust@presinet.com>
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

--nextPart1361560.YXxX9kHGEq
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

H323 and SIP patches from older PATCH-O-Matic-ng tarballs=20
both work fine for me on linux 2.6.16.29. The way I verified they work is
by testing them with ekiga 2.0 using both SIP and H323 protocols.

> > On Thursday 30 November 2006 03:21, ArcosCom Linux User wrote:
> > > Hi, I'm trying to patch kernel 2.6.16.34 with h323 conntrack patches,
> > > but I don't found it in pom-ng.
> > >
> > > I'm thinking in take it from 2.6.19 kernel (the *h323* files and take=
 a
> > > view in Kconfigs and Makefiles files).
> > >
> > > I know from 2.6.17 series, h323 where into kernel and they patched
> > > sometimes h323 sources.
> > >
> > > Could anybody say me if copying the files into 2.6.16.34 sources and
> > > modifiying Kconfig and Makefile files it will work?
> > >
> > > Thanks

=2D-=20
Alan Ezust            www.presinet.com
Presinet, inc         alan.ezust@presinet.com
           Victoria, BC, Canada

--nextPart1361560.YXxX9kHGEq
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQBFkvsNsJbtw6GURksRAqSaAJ9y8a0qRLi1Te1HyoOiIXu6k49AaACfVnDv
WkqnuCRSfbRbkIPs+M6J494=
=V2mY
-----END PGP SIGNATURE-----

--nextPart1361560.YXxX9kHGEq--

