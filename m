From: "Rob Sterenborg (lists)" <lists@sterenborg.info>
Subject: Re: iptables devel
Date: Thu, 09 Aug 2012 13:10:32 +0200
Message-ID: <1344510632.2818.10.camel@ns014530.dcyb.net>
References: <CAE1WnGe08Tmy=x4EHx3P0h4B8Sw6ahq_c_Fkr1zvC-n6GvfPfg@mail.gmail.com>
	 <1344508664.2818.1.camel@ns014530.dcyb.net>
	 <CAE1WnGexkPOSgwdWxfAWHw6fBNZ20iE1r2PzVLYG6WnK9xDVEg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAE1WnGexkPOSgwdWxfAWHw6fBNZ20iE1r2PzVLYG6WnK9xDVEg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: rahul shrivastava <shrivastavaone@gmail.com>
Cc: anandkumarkm@gmail.com, netfilter <netfilter@vger.kernel.org>

On Thu, 2012-08-09 at 16:27 +0530, rahul shrivastava wrote:
> Hi,

Hi,

Please keep the discussion on the list and do not top-post.

> i am compiling xtable-addons1.45 and linking iptable-devel files for
> powerpc (iptables-dev_1.4.8-3_powerpc.deb) using LDFLAG
> Running iptables command says i dont have correct version of
> iptable-devel files , error is thrown by iptables as below
> 
> [root@localhost ~]# iptables -A INPUT -m ipv4options -j ACCEPT
> iptables: match "ipv4options" has version "libxtables.so.4", but
> "libxtables.so.5" is required.
> 
> where do i download correct version of dev files?

Like I said: from your favourite Linux distro. You don't mention which
one you're using, so I don't know.
Probably you can use the package manager from your distro to do that,
e.g. yum install iptables-devel (on RHEL/CentOS/etc compatibles).

> Or something wrong with the patch installation procedure?

Likely not. You just don't have the iptables devel package installed so
you're missing files that the compilation process needs.

But we know nothing about your system. If it's not possible to get the
devel package from your distro, you could first download iptables from
ftp.netfilter.org and compile and install that on your system. That way
you will also have the (iptables!) files needed for compilation of
xtables-addons.


--
Rob



> On Thu, Aug 9, 2012 at 4:07 PM, Rob Sterenborg (lists)
> <lists@sterenborg.info> wrote:
> > On Thu, 2012-08-09 at 16:01 +0530, rahul shrivastava wrote:
> >> Hi,
> >> kernel version: 2.6.35
> >> iptables v1.4.9.1
> >>
> >> my version of iptables has libxtables.so.5
> >> from were i can get iptable-devel files for this version
> >
> > From your favourite Linux distro I guess?
> >
> > If that's not an option (I wouldn't know why, but still), the iptables
> > source can be downloaded from ftp.netfilter.org.
> >
> >
> > --
> > Rob
> >
> >



