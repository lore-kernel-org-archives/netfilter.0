From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: [ANNOUNCE] ipset 6.12 released
Date: Thu, 10 May 2012 17:27:16 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1205101724370.19418@blackhole.kfki.hu>
References: <alpine.DEB.2.00.1205101211080.18562@blackhole.kfki.hu> <alpine.LNX.2.01.1205101238020.20012@frira.vanv.qr> <alpine.DEB.2.00.1205101316470.18862@blackhole.kfki.hu> <alpine.LNX.2.01.1205101327310.12733@frira.vanv.qr> <alpine.DEB.2.00.1205101337160.19028@blackhole.kfki.hu>
 <CAMQP0sn=2jKYzoiUVu+oTRYj-niL84Lg2Z1UoO0UnFXJjV8Ggw@mail.gmail.com> <CAMQP0s=uSzOn-o7jwKLyhTaZud4d04hMN=JXrCQLrFD+6Zinkw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <CAMQP0s=uSzOn-o7jwKLyhTaZud4d04hMN=JXrCQLrFD+6Zinkw@mail.gmail.com>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Neutron Soutmun <neo.neutron@gmail.com>
Cc: Jan Engelhardt <jengelh@inai.de>, netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Hi,

On Thu, 10 May 2012, Neutron Soutmun wrote:

> > However, I'll find the solution for the build system when the
> > --disable-dependency-tracking is being parse.
> 
> The attached file is a patch to solve the
> --disable-dependency-tracking is being parse issue and also fixes the
> ipset does not build out of the source tree as the configure script
> could not check for the lib/ipset_*.c.

What about the next much simpler patch to force dependency tracking?

diff --git a/configure.ac b/configure.ac
index d9a71d3..af8fe0b 100644
--- a/configure.ac
+++ b/configure.ac
@@ -145,6 +145,9 @@ AM_CONDITIONAL([ENABLE_SHARED], [test 
"x$enable_shared" = xyes])
 dnl Checks for programs
 : ${CFLAGS=""}
 
+dnl Enable dependency tracking unconditionally
+: ${enable_dependency_tracking=yes}
+
 AC_PROG_CC
 AM_PROG_CC_C_O
 AC_PROG_LIBTOOL

It seems to solve the issue just fine.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
