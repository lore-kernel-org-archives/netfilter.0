From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset on older kernels
Date: Thu, 22 Sep 2016 11:25:15 +0200 (CEST)
Message-ID: <alpine.DEB.2.10.1609221123490.30187@blackhole.kfki.hu>
References: <1490B20F-D566-4E59-8186-FE241AC4C231@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        blackhole.kfki.hu; h=mime-version:user-agent:references
        :message-id:in-reply-to:from:from:date:date:received:received
        :received; s=20151130; t=1474536316; x=1476350717; bh=+GIlWTNFEu
        q+sSior2VpsRhMA4IGgGIUpJS/3y+93+c=; b=PBQjhNFINhj9bp8M9d5n7Nmr8t
        n9WTtYsn4WYfkUqx3NaJJdxa6QmTCsKuBvMguEHjaERvmMYeSJ6DB8ZdGAtcu6fX
        gAAxXmmkF+rUKjkSYr7neN28T0QIUVvLZlTkqnKZ2KQ9oFhI8M9aEYXtNRg4VnIM
        FjNXIuk1OY3LqHUEE=
In-Reply-To: <1490B20F-D566-4E59-8186-FE241AC4C231@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sudheendra Murthy <sudhi.vm@gmail.com>
Cc: netfilter@vger.kernel.org

On Wed, 21 Sep 2016, Sudheendra Murthy wrote:

> I'm trying to install iptables and ipset on an older kernel version 
> 2.6.35-22-server. I was able to build iptables from source and iptables 
> v1.6.0 is working fine.
> 
> For ipset, I patched the kernel sources based on netlink.patch and ipset 
> compiled correctly. However, when I try to execute any ipset command, it 
> gives the following error.
> 
> # ipset -L
> ipset v6.29: Kernel error received: Invalid argument
> 
> # dmesg
> [69432.285219] ip_set: cannot register with nfnetlink.
> 
> From the code, it looks like it is failing when executing 
> nfnetlink_subsys_register(...) 
> (http://lxr.free-electrons.com/source/net/netfilter/ipset/ip_set_core.c#L2069).

As it is written in the README file of the ipset package, for kernel 
versions < 2.6.39 you have to apply the netlink.patch from the package and 
recompile the kernel itself.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
