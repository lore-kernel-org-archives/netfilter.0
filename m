From: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>
Subject: xtables-addons v2.11 errors
Date: Mon, 12 Dec 2016 18:40:59 -0500
Message-ID: <20161212184059.2d76fc1d@playground>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 MAIL1.WPI.EDU uBCNf1PQ028837
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wpi.edu; s=_dkim;
        t=1481586061; i=@wpi.edu;
        bh=J9fB2UJrLrVW9CTAMW508DpmPwJBBsGatlmWYpYWtVc=;
        h=Date:From:To:Subject;
        b=nRjykboP8aa0zzSAMj5hYiqhpJuUtQR4EmwcJuARyFy4gHRyzSA48yCBUl/gRy7yg
         URsnag62aDHINfXYc0BNr03woCNp3k6hmhnA531a6jY1UBvysi4hVc7t8BqoxuxGS3
         dYV9BCUYv5xsLUlYfS5p/buM8EOMfFJEj9w7Jeis=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@vger.kernel.org>

In xtables-addons commit 2e6fb7, the new kernel version check is wrong:
+		if test "$kmajor" -gt 4 -o "$kmajor" -eq 7 -a "$kminor" -gt 3; then

It should be:
+		if test "$kmajor" -gt 4 -o "$kmajor" -eq 4 -a "$kminor" -gt 7; then

Unless y'all have a crystal ball that lets you see how Linux 7.x turned out. :)

Also, building for Linux 4.9 fails:

----
  gcc -Wp,-MD,/build/sources/xtables-addons/xtables-addons-2.11/extensions/.xt_LOGMARK.o.d  \
-nostdinc -isystem /usr/lib/gcc/i586-pc-linux-gnu/4.7.3/include -I./arch/x86/include \
-I./arch/x86/include/generated/uapi -I./arch/x86/include/generated  \
-I./include -I./arch/x86/include/uapi -I./include/uapi -I./include/generated/uapi -include \
./include/linux/kconfig.h -D__KERNEL__ -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
-fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security \
-std=gnu89 -fno-PIE -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float \
-mregparm=3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=2 -march=i586 \
-mtune=generic -maccumulate-outgoing-args -Wa,-mtune=generic32 -ffreestanding -DCONFIG_AS_CFI=1 \
-DCONFIG_AS_CFI_SIGNAL_FRAME=1 -DCONFIG_AS_CFI_SECTIONS=1 -DCONFIG_AS_SSSE3=1 -DCONFIG_AS_CRC32=1 \
-DCONFIG_AS_AVX=1 -DCONFIG_AS_AVX2=1 -pipe -Wno-sign-compare -fno-asynchronous-unwind-tables \
-fno-delete-null-pointer-checks -O2 -Wno-maybe-uninitialized --param=allow-store-data-races=0 \
-Wframe-larger-than=2048 -fno-stack-protector -Wno-unused-but-set-variable -fno-omit-frame-pointer \
-fno-optimize-sibling-calls -fno-var-tracking-assignments -Wdeclaration-after-statement \
-Wno-pointer-sign -fno-strict-overflow -fconserve-stack -Werror=implicit-int \
-Werror=strict-prototypes -DCC_HAVE_ASM_GOTO  -DMODULE  -DKBUILD_BASENAME='"xt_LOGMARK"'  \
-DKBUILD_MODNAME='"xt_LOGMARK"' -c -o /build/sources/xtables-addons/xtables-addons-2.11/extensions/.tmp_xt_LOGMARK.o /build/sources/xtables-addons/xtables-addons-2.11/extensions/xt_LOGMARK.c
/build/sources/xtables-addons/xtables-addons-2.11/extensions/xt_LOGMARK.c: In function 'logmark_ct':
/build/sources/xtables-addons/xtables-addons-2.11/extensions/xt_LOGMARK.c:62:31: error: request for member 'expires' in something not a structure or union
make[5]: *** [scripts/Makefile.build:299: /build/sources/xtables-addons/xtables-addons-2.11/extensions/xt_LOGMARK.o] Error 1
make[5]: *** Waiting for unfinished jobs....
----

Removing the ".expires" lets the build finish.
