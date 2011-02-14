From: Fabrice <fabricedeyber@agilemesh.com>
Subject: Re: how to install xtables extension to arbitrary path?
Date: Mon, 14 Feb 2011 17:43:54 +0000 (UTC)
Message-ID: <loom.20110214T183938-809@post.gmane.org>
References: <4CB712C3.3030804@21com.com> <loom.20110214T152123-163@post.gmane.org> <4D593F90.5020609@googlemail.com> <alpine.LNX.2.01.1102141548410.5842@obet.zrqbmnf.qr> <loom.20110214T155902-834@post.gmane.org> <alpine.LNX.2.01.1102141618310.12050@obet.zrqbmnf.qr> <loom.20110214T162258-861@post.gmane.org> <alpine.LNX.2.01.1102141642040.14613@obet.zrqbmnf.qr> <loom.20110214T171359-758@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I think I found the issue. It has to do with libtool when I make install.
I saw this in the trace:
libtool: install: warning: relinking `libiptc/libiptc.la'
/opt/arm-2009q1/bin/../lib/gcc/arm-none-linux-gnueabi/4.3.3/../../../../
arm-none-linux-gnueabi/bin/ld: warning: library search path "/usr/lib" 
is unsafe for cross-compilation
/opt/arm-2009q1/bin/../lib/gcc/arm-none-linux-gnueabi/4.3.3/../../../../
arm-none-linux-gnueabi/bin/ld: skipping incompatible /usr/lib/libc.so when 
searching for -lc/opt/arm-2009q1/bin/../lib/gcc/
arm-none-linux-gnueabi/4.3.3/../../../../arm-none-linux-gnueabi/bin/ld: 
skipping incompatible /usr/lib/libc.a when searching for -lc
libtool: install: warning: remember to run `libtool --finish /usr/lib'
libtool: install: warning: `libiptc/libip4tc.la' has not been installed in 
`/usr/lib'
libtool: install: warning: `libiptc/libip6tc.la' has not been installed in 
`/usr/lib'

So I did a make clean, configure and make. The I copied manually those libraries 
before the install to my NFS. It seems to work now :-)




