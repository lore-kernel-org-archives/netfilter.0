From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: xtables 1.31 compilation errors
Date: Sat, 11 Dec 2010 01:54:51 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1012110149030.30015@obet.zrqbmnf.qr>
References: <4D02C8D5.6080805@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D02C8D5.6080805@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

On Saturday 2010-12-11 01:41, Mr Dash Four wrote:

> When trying to build the above from source I get the following error:
>
> gcc -Wp,-MMD,./.libxt_gradm.oo.d,-MT,libxt_gradm.oo -D_LARGEFILE_SOURCE=1
> -D_LARGE_FILES -D_FILE_OFFSET_BITS=64     -D_REENTRANT -Wall -Waggregate-return
> -Wmissing-declarations     -Wmissing-prototypes -Wredundant-decls -Wshadow
> -Wstrict-prototypes     -Winline -pipe     -I../include
> -I/home/zeek/rpmbuild/BUILD/xtables-addons-1.31/extensions -DPIC -fPIC -O2 -g
> -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector
> --param=ssp-buffer-size=4 -m64 -mtune=core2 -o libxt_gradm.oo -c libxt_gradm.c;
> libxt_gradm.c:84: warning: implicit declaration of function 'ALIGN'
> libxt_gradm.c:84: error: initializer element is not constant
> libxt_gradm.c:84: error: (near initialization for 'gradm_mt_reg.size')
> libxt_gradm.c:85: error: initializer element is not constant
> libxt_gradm.c:85: error: (near initialization for 'gradm_mt_reg.userspacesize')

> Any ideas? From what I remember there was a similar problem with a couple of
> files in 1.30!

Hooray. Another victim to ALIGN. The problem is not xtables-addons,
though. (Please complain to your distro if they have not updated
linux-glibc-devel yet.)
Further info:
http://www.google.de/search?q=ALIGN+xtables+kernel
http://bugs.gentoo.org/325257
