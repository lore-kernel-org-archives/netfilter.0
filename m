From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: how to install xtables extension to arbitrary path?
Date: Mon, 14 Feb 2011 15:50:34 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1102141548410.5842@obet.zrqbmnf.qr>
References: <4CB712C3.3030804@21com.com> <loom.20110214T152123-163@post.gmane.org> <4D593F90.5020609@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D593F90.5020609@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: Fabrice <fabricedeyber@agilemesh.com>, netfilter@vger.kernel.org


On Monday 2011-02-14 15:43, Mr Dash Four wrote:
>
>>> When building iptables, we can use "configure" to specify the xtables
>>> extension install path by "prefix" or "withxtlibdir". And when we
>>> running the iptables, iptables seems to search for the xtables extension
>>> libraries only in the path that was specified by "configure". If we move
>>> the xtables extension libraries to some other place, iptables will
>>> report failing to load the "so" files.
>>>
>>> Because I'm doing cross compiling, and I will place the xtables
>>> extension libraries in the target board, and the final path might be
>>> different than the "configure" path. Do you know how to make iptables to
>>> load the correct xtables extensions?
>> Hi Xing,
>> I'm having the same issue. I'm able to cross compile but when I install to
>> another file system the libraries always look at the absolute path which is
>> not valid anymore. How did you get around the issue?

 --prefix/--with-xtlibdir is only meant to specify the directory
relative to the root of the final running system. To stage files
elsewhere, use the DESTDIR variable on make install.
See autoconf info, section 16.4 "Installation names".

>One possible solution to this (though not ideal by any means!) is to use
>modprobe and force the .so files to be loaded in advance as soon as the system
>is initialised (possibly through rc.sysinit).

Finding the .so files has nothing to do with modprobe however.
