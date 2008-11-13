From: Wolfram Schlich <lists@wolfram.schlich.org>
Subject: Re: PaX killing conntrackd (strange "execution attempt")
Date: Thu, 13 Nov 2008 18:41:38 +0100
Message-ID: <20081113174138.GM26975@bla.fasel.org>
References: <20081113100309.GH26975@bla.fasel.org> <20081113132723.GK26975@bla.fasel.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=bla.fasel.org; h=date:from
	:to:cc:subject:message-id:references:mime-version:content-type:
	in-reply-to; s=mx; bh=J6V9yXsmSbEyMX25fkL9nL8cxYw=; b=cwdaKSvHND
	1DtLOFOK0wG7VvCIL+JHBBRliRbFfqHxic4SZuVUq5TsvRpry5OeWj4x7We6Hw4o
	MMWwdDxCHSs83eMaMNgO0YUiuiFsx1yfX7im+bAqWeCQyOngZna40T5xc0AI0MOx
	uHUrLxsjnx3SZvFeOayFRkNPrXsIzqASM=
Content-Disposition: inline
In-Reply-To: <20081113132723.GK26975@bla.fasel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org
Cc: pageexec@freemail.hu

* Wolfram Schlich <lists@wolfram.schlich.org> [2008-11-13 14:27]:
> Here's the answer from the PaX team, for those who might be interested:
> * pageexec@freemail.hu <pageexec@freemail.hu> [2008-11-13 14:18]:
> > [...]
> > this is a null function pointer dereference problem on the surface and you'll have to
> > debug it to get more info. i wonder why nothing shows up in the stack dump however,
> > maybe there's more corruption here behind the scenes. once you get the coredumps (and
> > i hope you have debug info saved away ;) we can get a backtrace and other things. also
> > disable randomization in /proc/sys/... so that results are comparable. best would be
> > to find a way to directly trigger this crash, then you could have a live gdb session
> > instead of coredump analysis.
> 
> I'll take care of these suggestions now and let you know
> about any news.

I've now recompiled conntrack-tools using these CFLAGS:

	-march=nocona -O0 -ggdb -DDEBUG

Also, the binaries were not stripped anymore:

	/usr/sbin/conntrackd: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), for GNU/Linux 2.6.9, not stripped

(I forgot to mention I'm on a 64bit kernel + userland).

I'm now stressing the firewalls with packets.
-- 
Regards,
Wolfram Schlich <wschlich@gentoo.org>
Gentoo Linux * http://dev.gentoo.org/~wschlich/
