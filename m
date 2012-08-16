From: Anand kumar <anandkumarkm@gmail.com>
Subject: Fwd: iptables devel
Date: Thu, 16 Aug 2012 16:29:58 +0530
Message-ID: <CABNW7=9yiO-jqSkOdEPmoU_-T+YpONFcZnF54VfD1NFKTh=Dvw@mail.gmail.com>
References: <CAE1WnGe08Tmy=x4EHx3P0h4B8Sw6ahq_c_Fkr1zvC-n6GvfPfg@mail.gmail.com>
	<1344508664.2818.1.camel@ns014530.dcyb.net>
	<CAE1WnGexkPOSgwdWxfAWHw6fBNZ20iE1r2PzVLYG6WnK9xDVEg@mail.gmail.com>
	<1344510632.2818.10.camel@ns014530.dcyb.net>
	<CABNW7=8fQ3xnuSQKoP1gp3uxEv8kBHgscpPyYFdnTva1ifVsLQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=R24HNklt731qDHiqq1TOfgiHq+TEfh3PDbJ+03DKLAo=;
        b=xbqqn3Ke5PJa6TVG2HnXUOLfGEUd20oMrfX6ezs0/k5u3aIAhrc1RcJKhkF+qeHaw6
         eZaimzFu9gu9geWxOp12iAJZvyI8XHctWmSTLxTSn9uDGVprvt+jGKRxUad2RuL2y840
         OPpp1HDEqf8oq3CiZnRKDQO0KDNunIoDG0jKOYPoeOVX6aXkRKcaFfs1DzJfEmySYLLn
         9HnB4mNYfSkXIf7CZMgPZ3WMlmlaQ7f5aaiDt3znMWlWQTfn+d6dmn+XXlVvioE8L38K
         ilpkEgmRXKFMQ7b6W4LIzlxHAbZ9kqlGXxYYdPnV5zBjMtZAv5YpaHpWlMCOcYXeVJdo
         faOA==
In-Reply-To: <CABNW7=8fQ3xnuSQKoP1gp3uxEv8kBHgscpPyYFdnTva1ifVsLQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

On Thu, Aug 9, 2012 at 4:40 PM, Rob Sterenborg (lists)
<lists@sterenborg.info> wrote:
>
> On Thu, 2012-08-09 at 16:27 +0530, rahul shrivastava wrote:
> > Hi,
>
> Hi,
>
> Please keep the discussion on the list and do not top-post.
>
> > i am compiling xtable-addons1.45 and linking iptable-devel files for
> > powerpc (iptables-dev_1.4.8-3_powerpc.deb) using LDFLAG
> > Running iptables command says i dont have correct version of
> > iptable-devel files , error is thrown by iptables as below
> >
> > [root@localhost ~]# iptables -A INPUT -m ipv4options -j ACCEPT
> > iptables: match "ipv4options" has version "libxtables.so.4", but
> > "libxtables.so.5" is required.
> >
> > where do i download correct version of dev files?
>
> Like I said: from your favourite Linux distro. You don't mention which
> one you're using, so I don't know.
> Probably you can use the package manager from your distro to do that,
> e.g. yum install iptables-devel (on RHEL/CentOS/etc compatibles).
>
> > Or something wrong with the patch installation procedure?
>
> Likely not. You just don't have the iptables devel package installed so
> you're missing files that the compilation process needs.
>
> But we know nothing about your system. If it's not possible to get the
> devel package from your distro, you could first download iptables from
> ftp.netfilter.org and compile and install that on your system. That way
> you will also have the (iptables!) files needed for compilation of
> xtables-addons.
>
 We downloaded iptalbes from netfilter ftp, compiled and installed on our
 system. Now we are getting below error.


 [root@localhost ~]# iptables -A INPUT -m ipv4options -j ACCEPT

  Iptables: No chain/target/match by that name.


any clues on this?


-- Anand
>
> --
> Rob
>
>
>
> > On Thu, Aug 9, 2012 at 4:07 PM, Rob Sterenborg (lists)
> > <lists@sterenborg.info> wrote:
> > > On Thu, 2012-08-09 at 16:01 +0530, rahul shrivastava wrote:
> > >> Hi,
> > >> kernel version: 2.6.35
> > >> iptables v1.4.9.1
> > >>
> > >> my version of iptables has libxtables.so.5
> > >> from were i can get iptable-devel files for this version
> > >
> > > From your favourite Linux distro I guess?
> > >
> > > If that's not an option (I wouldn't know why, but still), the iptables
> > > source can be downloaded from ftp.netfilter.org.
> > >
> > >
> > > --
> > > Rob
> > >
> > >
>
>
>
