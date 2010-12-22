From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: [ANNOUNCE] ipset-5.1 released
Date: Wed, 22 Dec 2010 11:20:58 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1012221115130.3482@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Hi,

I'm happy to announce the 5.1 version of the new ipset branch. Here 
follows the changelogs for the userspace and kernel parts:

userspace:
 - Test cases for IPv6 restore and more complex restore sessions added
 - Restore mode did not work for IPv6, fixed (reported by Elie Rosenblum)
 - libipset: static annotations (Jan Engelhardt)
 - libipset: const annotations (Jan Engelhardt)
 - libipset: remove redundant casts (Jan Engelhardt)
 - libipset: remove redundant indirection via union name (Jan Engelhardt) 
 - libipset: ipset_strncpy is really a strlcpy-type operation
   (Jan Engelhardt)
 - Prevent calling Makefile directly in the kernel/ subdirectory
 - Put back the Sparc specific workaround at getaddrinfo
   (reported by Jan Engelhardt)
 - Check old system kernel header files
 - Check from `configure` that the kernel source is patched with
   netlink.patch
 - Use configure to detect compiler warning flags
 - Try to solve PKG_CHECK_MODULES issue (reported by Rob Sterenborg)
 - Fix incorrect comparison in check_allowed (reported by Jan Engelhardt)

kernel part:
 - Kernel version compatibility: support bumped starting from 2.6.34
   (Supporting older kernel releases would mean too much burden for me,
   sorry.)
 - kernel: use EXPORT_SYMBOL_GPL (Jan Engelhardt)
 - kernel: const annotations (Jan Engelhardt)
 - kernel: use __read_mostly for registration-type structures
   (Jan Engelhardt)
 - kernel: do not mix const and __read_mostly (Jan Engelhardt)
 - xt_set: avoid user types in exported kernel headers (Jan Engelhardt)
 - build: enable parallel building (Jan Engelhardt)
 - Fix Kbuild for me to delete backup files

You can download the source code from:
        http://ipset.netfilter.org
        ftp://ftp.netfilter.org/pub/ipset/
        git://git.netfilter.org/ipset.git, ipset-5 branch

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
