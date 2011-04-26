From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset maximal/minimal revision conflict
Date: Tue, 26 Apr 2011 16:05:39 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1104261558430.1834@blackhole.kfki.hu>
References: <4DB6A9A5.5070301@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DB6A9A5.5070301@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Tue, 26 Apr 2011, Mr Dash Four wrote:

> I get a weird error when executing the following ipset command:
> 
> [root@test1 ~]# ipset -N test hash:net,port
> ipset v6.4: Kernel supports hash:net,port type, family INET with maximal
> revision 0 while ipset program with minimal revision 1.
> You need to upgrade your kernel.
> 
> The "revision", as far as I know, is exactly the same - ipset 6.4! The
> userspace has been compiled from the released v6.4, while the kernel part was
> built from a snapshot dated 24 April, which included the 3 patches not present
> in .39-rc4 (so, in essence, if anything, the kernel part should be newer than
> the userspace part of the released v6.4, right?). It is strange that I do not
> get this error when attempting any other type of set (hash:ip or hash:net).

The hash:*port* types have got a new revision due to the introduced SCTP 
and UDPLITE support. The ipset package contains the matching kernel 
modules, the kernel tree is a little bit behind.

I do not want to burden the kernel with any multi-revision support until 
2.6.39. After the non-rc kernel version is out, I'll start to maintain 
the revisions support.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
