From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: xtables-addons license (was: patch-o-matic problems..?)
Date: Sun, 27 Jul 2008 16:35:36 -0400 (EDT)
Message-ID: <alpine.LNX.1.10.0807271419120.9173@fbirervta.pbzchgretzou.qr>
References: <alpine.DEB.1.10.0807192237270.9838@fairy.dhcp.penguin>  <alpine.LNX.1.10.0807201105300.21244@fbirervta.pbzchgretzou.qr>  <alpine.DEB.1.10.0807201544510.8813@fairy.dhcp.penguin>  <alpine.LNX.1.10.0807201652360.21244@fbirervta.pbzchgretzou.qr>
 <935fab200807221736k5c95037fgac0eac3e1e4915b2@mail.gmail.com> <alpine.LNX.1.10.0807231118560.23410@fbirervta.pbzchgretzou.qr> <i68j84dug7nqmocorl97vvp4bqm8irlkg7@4ax.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <i68j84dug7nqmocorl97vvp4bqm8irlkg7@4ax.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephane Ouellette <ouellettes@videotron.ca>, Massimiliano Hofer <max@nucleus.it>, Eicke Friedrich/Klaus Degner <ipp2p@ipp2p.org>, =?UTF-8?Q?Sebastian_Cla=C3=9Fen?= <sebastian.classen>
Cc: netfilter@vger.kernel.org, Andrew Schulman <andrex@alumni.utexas.net>


On Friday 2008-07-25 06:01, Andrew Schulman wrote:
>
>But there's a problem:  there's no overall license file, and a lot of 
>the source files don't have license statements in them.  Here are the 
>source files I find with no license:
>
>extensions/libxt_condition.c
(Stephane and Massimiliano)

>extensions/libxt_ECHO.c
(me)

>extensions/libxt_ipp2p.c
(ipp2p project group, code audited by me)

>extensions/libxt_LOGMARK.c
(me)

>extensions/libxt_TARPIT.c
(trivial)

>extensions/libxt_TEE.c
(Sebastian and audited by me)

>The remaining source files are all GPL.
>
>Can the above files be released under GPL too?  Most of them don't have
>copyright statements in them.  Do you/we know who their authors are?

The iptables extensions are mostly trivial and I would not consider them 
meaningfully copyrightable (especially libxt_TARPIT.c). I relaxedly put 
in GPL because anything else does not make sense. (e.g. there is no BSD 
implementation of the iptables command line interface which could 
possibly use these modules)

If any of the Cc'ed co-authors disagree with picking GPL2+, now is your 
time to speak up.

>I know very little about licenses.  What about all of the other files 
>in the archive?  Do they need to be licensed too, and would a general 
>COPYING file such as one usually sees cover them all?

I'll fix that.
