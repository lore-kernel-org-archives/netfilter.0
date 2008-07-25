From: Andrew Schulman <andrex-cmaem7PIVQQM4YKboWzA4l6hYfS7NtTn@public.gmane.org>
Subject: xtables-addons license (was: patch-o-matic problems..?)
Date: Fri, 25 Jul 2008 06:01:01 -0400
Message-ID: <i68j84dug7nqmocorl97vvp4bqm8irlkg7@4ax.com>
References: <alpine.DEB.1.10.0807192237270.9838@fairy.dhcp.penguin>  <alpine.LNX.1.10.0807201105300.21244@fbirervta.pbzchgretzou.qr>  <alpine.DEB.1.10.0807201544510.8813@fairy.dhcp.penguin>  <alpine.LNX.1.10.0807201652360.21244@fbirervta.pbzchgretzou.qr> <935fab200807221736k5c95037fgac0eac3e1e4915b2@mail.gmail.com> <alpine.LNX.1.10.0807231118560.23410@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: netfilter-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

> >3) Add documentation on reasons why moving to Xtables and how it works
> >to Netfilter.org
> 
> 4) Tell distributions to package it so users don't have to worry about (3)

Jan, I'm working on creating Debian packages of xtables-addons.  I'm not a
Debian developer, but I can still post the packages.

But there's a problem:  there's no overall license file, and a lot of the source
files don't have license statements in them.  Here are the source files I find
with no license:

extensions/libxt_condition.c
extensions/libxt_ECHO.c
extensions/libxt_ipp2p.c
extensions/libxt_LOGMARK.c
extensions/libxt_TARPIT.c
extensions/libxt_TEE.c

The remaining source files are all GPL.

Can the above files be released under GPL too?  Most of them don't have
copyright statements in them.  Do you/we know who their authors are?

I know very little about licenses.  What about all of the other files in the
archive?  Do they need to be licensed too, and would a general COPYING file such
as one usually sees cover them all?

Thanks,
Andrew.

--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
