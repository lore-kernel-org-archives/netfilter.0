From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: how to install xtables extension to arbitrary path?
Date: Mon, 14 Feb 2011 23:53:17 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1102142351390.21852@obet.zrqbmnf.qr>
References: <4CB712C3.3030804@21com.com> <loom.20110214T152123-163@post.gmane.org> <4D593F90.5020609@googlemail.com> <alpine.LNX.2.01.1102141548410.5842@obet.zrqbmnf.qr> <loom.20110214T155902-834@post.gmane.org> <alpine.LNX.2.01.1102141618310.12050@obet.zrqbmnf.qr>
 <loom.20110214T162258-861@post.gmane.org> <alpine.LNX.2.01.1102141642040.14613@obet.zrqbmnf.qr> <loom.20110214T171359-758@post.gmane.org> <loom.20110214T183938-809@post.gmane.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <loom.20110214T183938-809@post.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fabrice <fabricedeyber@agilemesh.com>
Cc: netfilter@vger.kernel.org

On Monday 2011-02-14 18:43, Fabrice wrote:

>I think I found the issue. It has to do with libtool when I make install.
>I saw this in the trace:
>libtool: install: warning: relinking `libiptc/libiptc.la'
>/opt/arm-2009q1/bin/../lib/gcc/arm-none-linux-gnueabi/4.3.3/../../../../
>arm-none-linux-gnueabi/bin/ld: warning: library search path "/usr/lib" 
>is unsafe for cross-compilation
>/opt/arm-2009q1/bin/../lib/gcc/arm-none-linux-gnueabi/4.3.3/../../../../
>arm-none-linux-gnueabi/bin/ld: skipping incompatible /usr/lib/libc.so when 
>searching for -lc/opt/arm-2009q1/bin/../lib/gcc/

Please rerun with `make V=1` so that I may see the libtool and ld 
command line that was used.

My guess is that something added -L/usr/lib to LDFLAGS, which of course 
is wrong since you would need -L/opt/arm-2009q1/lib .
