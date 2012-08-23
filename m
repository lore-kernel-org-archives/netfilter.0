From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: Fwd: iptables devel
Date: Thu, 23 Aug 2012 15:24:54 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1208231524100.2060@frira.zrqbmnf.qr>
References: <CAE1WnGe08Tmy=x4EHx3P0h4B8Sw6ahq_c_Fkr1zvC-n6GvfPfg@mail.gmail.com> <1344508664.2818.1.camel@ns014530.dcyb.net> <CAE1WnGexkPOSgwdWxfAWHw6fBNZ20iE1r2PzVLYG6WnK9xDVEg@mail.gmail.com> <1344510632.2818.10.camel@ns014530.dcyb.net>
 <CABNW7=8fQ3xnuSQKoP1gp3uxEv8kBHgscpPyYFdnTva1ifVsLQ@mail.gmail.com> <CABNW7=9yiO-jqSkOdEPmoU_-T+YpONFcZnF54VfD1NFKTh=Dvw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CABNW7=9yiO-jqSkOdEPmoU_-T+YpONFcZnF54VfD1NFKTh=Dvw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anand kumar <anandkumarkm@gmail.com>
Cc: netfilter <netfilter@vger.kernel.org>


On Thursday 2012-08-16 12:59, Anand kumar wrote:
>>
> We downloaded iptalbes from netfilter ftp, compiled and installed on our
> system. Now we are getting below error.
>
>
> [root@localhost ~]# iptables -A INPUT -m ipv4options -j ACCEPT
>
>  Iptables: No chain/target/match by that name.
>
>
>any clues on this?

The iptables tarball from netfilter.org nor the kernel from kernel.org
ship the "ipv4options" module(s).
