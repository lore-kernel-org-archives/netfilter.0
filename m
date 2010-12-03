From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: cross compilation of xtables fails
Date: Fri, 03 Dec 2010 19:31:34 +0000
Message-ID: <4CF94596.4080002@googlemail.com>
References: <4CF8F67B.8010504@googlemail.com> <alpine.LNX.2.01.1012031456370.22038@obet.zrqbmnf.qr> <4CF8F8B3.5080100@googlemail.com> <alpine.LNX.2.01.1012031522040.22038@obet.zrqbmnf.qr> <4CF8FF76.8040709@googlemail.com> <alpine.LNX.2.01.1012031539310.11961@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080209090509030401020402"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type;
        bh=FSlJeU52h42lD4w++DqNcqxoA8wI6XK5eYhgGvuMB/w=;
        b=XxhwJ0tMRTdBm8Z7eCkHHsqtTx5JRSQoVlN0JzrEby4SHoJxm5DM6dkg5Rpf0hRvQp
         gGxAoKqhvu1rCV7hEJyB0myOTbZR4xIB8k/L8caOH2BsAwfP2WEhDOJ5RPh5EXb+sshe
         wOCzvuLaQJFuiGIGxfgkvpSoaRi3f5WzZqivc=
In-Reply-To: <alpine.LNX.2.01.1012031539310.11961@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

This is a multi-part message in MIME format.
--------------080209090509030401020402
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


> Then do so when time comes :)
>   
Here goes, the full monty: ;-)

LANG=C
export LANG
./autogen.sh
CFLAGS='-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions 
-fstack-protector --param=ssp-buffer-size=4 -m32 -march=i686 
-mtune=pentium2 -fasynchronous-unwind-tables'
export CFLAGS
CXXFLAGS='-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions 
-fstack-protector --param=ssp-buffer-size=4 -m32 -march=i686 
-mtune=pentium2 -fasynchronous-unwind-tables'
export CXXFLAGS
FFLAGS='-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions 
-fstack-protector --param=ssp-buffer-size=4 -m32 -march=i686 
-mtune=pentium2 -fasynchronous-unwind-tables -I/usr/lib/gfortran/modules'
export FFLAGS
./configure --build=x86_64-redhat-linux-gnu --host=i686-redhat-linux-gnu 
--program-prefix= --prefix=/usr --exec-prefix=/usr --bindir=/usr/bin 
--sbindir=/usr/sbin --sysconfdir=/etc --datadir=/usr/share 
--includedir=/usr/include --libdir=/usr/lib --libexecdir=/usr/libexec 
--localstatedir=/var --sharedstatedir=/var/lib --mandir=/usr/share/man 
--infodir=/usr/share/info --with-xtlibdir=/lib/xtables
make V=1 -j3

and that's where I end up with the error. I also use a patch (which 
executes prior to starting this whole process - as soon as I extract the 
code from the .xz source file) to disable all kernel probing during the 
build-up process (see attached that file as well).

--------------080209090509030401020402
Content-Type: text/plain;
 name="xtables-addons-userspace.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline;
 filename="xtables-addons-userspace.patch"

diff -urP xtables-addons-1.30.org/configure.ac xtables-addons-1.30/configure.ac
--- xtables-addons-1.30.org/configure.ac	2010-05-31 09:47:58.385362271 +0800
+++ xtables-addons-1.30/configure.ac	2010-05-31 10:01:32.727112933 +0800
@@ -9,18 +9,6 @@
 AC_DISABLE_STATIC
 AC_PROG_LIBTOOL
 
-AC_ARG_WITH([kbuild],
-	AS_HELP_STRING([--with-kbuild=PATH],
-	[Path to kernel build directory [[/lib/modules/CURRENT/build]]]),
-	[kbuilddir="$withval"],
-	[kbuilddir="/lib/modules/$(uname -r)/build"])
-#
-# check for --without-kbuild
-#
-if [[ "$kbuilddir" == no ]]; then
-	kbuilddir="";
-fi
-
 AC_ARG_WITH([xtlibdir],
 	AS_HELP_STRING([--with-xtlibdir=PATH],
 	[Path where to install Xtables extensions [[LIBEXECDIR/xtables]]]),
@@ -37,42 +25,7 @@
 	-Winline -pipe -DXTABLES_LIBDIR=\\\"\${xtlibdir}\\\" \
 	-I\${XA_TOPSRCDIR}/include";
 
-#
-# check kernel version
-#
-if grep -q "CentOS release 5\." /etc/redhat-release 2>/dev/null ||
-    grep -q "Red Hat Enterprise Linux Server release 5" /etc/redhat-release 2>/dev/null; then
-	# ������������������������������������!
-	# Well, just a warning. Maybe the admin updated the kernel.
-	echo "WARNING: This distribution's shipped kernel is not supported.";
-fi;
-krel="$(make -sC ${kbuilddir} kernelrelease)";
-krel="${krel%%-*}";
-kmajor="${krel%%.*}";
-krel="${krel#*.}";
-kminor="${krel%%.*}";
-krel="${krel#*.}";
-kmicro="${krel%%.*}";
-if test "$kmicro" = "$krel"; then
-	kstable=0;
-else
-	kstable="${krel#*.}";
-	if test -z "$kstable"; then
-		kstable=0;
-	fi;
-fi;
-echo "Found kernel version $kmajor.$kminor.$kmicro.$kstable in $kbuilddir";
-if test "$kmajor" -gt 2 -o "$kminor" -gt 6 -o "$kmicro" -gt 36; then
-	echo "WARNING: You are trying a newer kernel. Results may vary. :-)";
-elif test \( "$kmajor" -lt 2 -o "$kminor" -lt 6 -o "$kmicro" -lt 17 \) -o \
-    \( "$kmajor" -eq 2 -a "$kminor" -eq 6 -a "$kmicro" -eq 18 -a \
-    "$kstable" -lt 5 \); then
-	echo "ERROR: That kernel version is not supported. Please see INSTALL for minimum configuration.";
-	exit 1;
-fi;
-
 AC_SUBST([regular_CFLAGS])
-AC_SUBST([kbuilddir])
 AC_SUBST([xtlibdir])
 AC_CONFIG_FILES([Makefile Makefile.iptrules Makefile.mans geoip/Makefile
	extensions/Makefile extensions/ACCOUNT/Makefile
	extensions/ipset/Makefile extensions/pknock/Makefile])
diff -urP xtables-addons-1.30.org/extensions/Makefile.am xtables-addons-1.30/extensions/Makefile.am
--- xtables-addons-1.30.org/extensions/Makefile.am	2010-05-31 09:47:58.363361712 +0800
+++ xtables-addons-1.30/extensions/Makefile.am	2010-05-31 10:02:08.845363738 +0800
@@ -1,26 +1,4 @@
 # -*- Makefile -*-
 # AUTOMAKE
 
-# Not having Kbuild in Makefile.extra because it will already recurse
-.PHONY: modules modules_install clean_modules
-
-_kcall = -C ${kbuilddir} M=${abs_srcdir}
-
-modules:
-	@echo -n "Xtables-addons ${PACKAGE_VERSION} - Linux "
-	@if [ -n "${kbuilddir}" ]; then ${MAKE} ${_kcall} --no-print-directory -s kernelrelease; fi;
-	${AM_V_silent}if [ -n "${kbuilddir}" ]; then ${MAKE} ${_kcall} modules; fi;
-
-modules_install:
-	${AM_V_silent}if [ -n "${kbuilddir}" ]; then ${MAKE} ${_kcall} INSTALL_MOD_PATH=${DESTDIR} ext-mod-dir='$${INSTALL_MOD_DIR}' modules_install; fi;
-
-clean_modules:
-	${AM_V_silent}if [ -n "${kbuilddir}" ]; then ${MAKE} ${_kcall} clean; fi;
-
-all-local: modules
-
-install-exec-local: modules_install
-
-clean-local: clean_modules
-
 include ../Makefile.extra
diff -urP xtables-addons-1.30.org/Makefile.am xtables-addons-1.30/Makefile.am
--- xtables-addons-1.30.org/Makefile.am	2010-05-31 09:47:58.385362271 +0800
+++ xtables-addons-1.30/Makefile.am	2010-05-31 09:52:19.632360246 +0800
@@ -12,7 +12,6 @@
 	${MAKE} -f Makefile.mans all;
 
 install-exec-hook:
-	depmod -a || :;
 
 config.status: Makefile.iptrules.in
 

--------------080209090509030401020402--
