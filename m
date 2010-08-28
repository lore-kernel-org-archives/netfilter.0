From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Problems compiling xtables-addons v1.28
Date: Sat, 28 Aug 2010 13:57:47 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1008281356110.16282@obet.zrqbmnf.qr>
References: <4C7883B1.10006@lists.schang.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C7883B1.10006@lists.schang.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brian Schang <netfilter@lists.schang.net>
Cc: netfilter@vger.kernel.org

On Saturday 2010-08-28 05:34, Brian Schang wrote:

> Hello:
>
> I have successfully compiled and am running xtables-addons v1.27. However I
> cannot get v1.28 to compile:
>
> [root@server2 xtables-addons (build)]# ./autogen.sh
> libtoolize: putting auxiliary files in `.'.
> libtoolize: copying file `./ltmain.sh'
> libtoolize: putting macros in AC_CONFIG_MACRO_DIR, `m4'.
> libtoolize: copying file `m4/libtool.m4'
> libtoolize: copying file `m4/ltoptions.m4'
> libtoolize: copying file `m4/ltsugar.m4'
> libtoolize: copying file `m4/ltversion.m4'
> libtoolize: copying file `m4/lt~obsolete.m4'
> geoip/Makefile.am:3: `pkglibexec_SCRIPTS' is used but `pkglibexecdir' is
> undefined
> autoreconf: automake failed with exit status: 1

It seems I made use of a feature without updating configure.ac 
accordingly. This is the new patch just commited.

commit f9922c6f85a1c46c210271495e8b50b180ef71e2
Author: Jan Engelhardt
Date:   Sat Aug 28 13:56:12 2010 +0200

    configure: pkglibexecdir requires automake >= 1.10.2

diff --git a/configure.ac b/configure.ac
index 9c02436..89793d0 100644
--- a/configure.ac
+++ b/configure.ac
@@ -3,7 +3,7 @@ AC_INIT([xtables-addons], [1.28])
 AC_CONFIG_HEADERS([config.h])
 AC_CONFIG_MACRO_DIR([m4])
 AC_PROG_INSTALL
-AM_INIT_AUTOMAKE([1.10 -Wall foreign subdir-objects])
+AM_INIT_AUTOMAKE([1.10.2 -Wall foreign subdir-objects])
 AC_PROG_CC
 AM_PROG_CC_C_O
 AC_DISABLE_STATIC
