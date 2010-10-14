From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: how to install xtables extension to arbitrary path?
Date: Thu, 14 Oct 2010 17:40:56 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1010141737010.30787@obet.zrqbmnf.qr>
References: <4CB712C3.3030804@21com.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CB712C3.3030804@21com.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Xing Qianqian <xingqq@21com.com>
Cc: netfilter@vger.kernel.org

On Thursday 2010-10-14 16:25, Xing Qianqian wrote:
>
>When building iptables, we can use "configure" to specify the xtables
>extension install path by "prefix" or "withxtlibdir". And when we
>running the iptables, iptables seems to search for the xtables extension
>libraries only in the path that was specified by "configure". If we move
>the xtables extension libraries to some other place, iptables will
>report failing to load the "so" files.

So don't move them ;-)

>Because I'm doing cross compiling, and I will place the xtables
>extension libraries in the target board, and the final path might be
>different than the "configure" path.

You always have to specify final target-local paths to configure (in 
other words, as usual). This has never been different.

>Do you know how to make iptables to
>load the correct xtables extensions?

make install DESTDIR=/cross-chroot

Is what you need. This is used in about all the installation scripts in 
.spec files and similar in linux distributions' packages. Every 
automake-powered project has DESTDIR offered, it is not exactly a new 
thing.
