From: Alan Ezust <alan.ezust@presinet.com>
Subject: Re: Patch for h323 conntack for certain kernels
Date: Thu, 30 Nov 2006 09:29:39 -0800
Message-ID: <200611300929.42277.alan.ezust@presinet.com>
References: <59064.195.55.244.106.1164885677.squirrel@www.arcoscom.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1258356.6OmY20EuUI";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <59064.195.55.244.106.1164885677.squirrel@www.arcoscom.com>
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
To: netfilter@lists.netfilter.org, linux@arcoscom.com

--nextPart1258356.6OmY20EuUI
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline


I grabbed the h323 patch from the svn repository, since it is still availab=
le=20
(out of trunk, though). I wanted to apply it to 2.6.16.29.

I haven't been able to verify that it actually works yet though. I'm trying=
 to=20
use it with l7 filters and so far, it doesn't detect any of our h323 traffi=
c.

Your idea is probably better, but I'll be interested to know what works for=
=20
you since we're in the same boat.


On Thursday 30 November 2006 03:21, ArcosCom Linux User wrote:
> Hi, I'm trying to patch kernel 2.6.16.34 with h323 conntrack patches, but
> I don't found it in pom-ng.
>
> I'm thinking in take it from 2.6.19 kernel (the *h323* files and take a
> view in Kconfigs and Makefiles files).
>
> I know from 2.6.17 series, h323 where into kernel and they patched
> sometimes h323 sources.
>
> Could anybody say me if copying the files into 2.6.16.34 sources and
> modifiying Kconfig and Makefile files it will work?
>
> Thanks

=2D-=20
Alan Ezust            www.presinet.com
Presinet, inc         alan.ezust@presinet.com
           Victoria, BC, Canada

--nextPart1258356.6OmY20EuUI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQBFbxUGsJbtw6GURksRAlTyAJ9MA7sW9aI9Wz8Mz62d0uCGXLSCUgCgo/7F
S9g0wGuxP8wr/Pq5y5IcER0=
=Rbss
-----END PGP SIGNATURE-----

--nextPart1258356.6OmY20EuUI--

