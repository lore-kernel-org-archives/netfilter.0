From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Kernel panic when using IPset with counters
Date: Thu, 23 Mar 2017 13:20:21 +0100 (CET)
Message-ID: <alpine.DEB.2.11.1703231318100.5569@blackhole.kfki.hu>
References: <CABGW2bVabLiHO6_DuqhzOgkV5z1oeBMLSyqLrFZiY2oaVg6D0g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        blackhole.kfki.hu; h=mime-version:user-agent:references
        :message-id:in-reply-to:from:from:date:date:received:received
        :received; s=20151130; t=1490271621; x=1492086022; bh=r3Gs3QstcE
        MEqsoaJ2k6n5D/b8AKnJJ6y91mxluM2aY=; b=WwOCg6b0Raz3QCduE0lnrpgXtU
        HMX+ZP9pje7qU6FDb1VJXa4pPLDZqnpS6rGghteiWxHxR1TZ8juCPJOq3oqQPCOX
        4Q+bPYwkYlK15qIvLLmwSpZ/PqsJmRmie8caOOW6d0cW1lcHRldO91epO+qGPwss
        yAFiAGYzGcmkYIILQ=
In-Reply-To: <CABGW2bVabLiHO6_DuqhzOgkV5z1oeBMLSyqLrFZiY2oaVg6D0g@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Scott Bonar <sbonar@gmail.com>
Cc: netfilter@vger.kernel.org

On Thu, 23 Mar 2017, Scott Bonar wrote:

> When I configure a set with type ?hash:ip? and option ?counters?, after 
> I have added more than 20 to 30 IP addresses to the set and then execute 
> an `ipset list <setname>` I get a kernel panic in the function 
> hash_ip4_list(). If I don?t have the option ?counters? I don?t get the 
> panic.
> 
> I am using ipset version 6.21.1 and kernel 3.14.
> 
> Is this a known issue and fixed in newer versions of ipset or kernel or 
> both??  Is there something I can do differently in setting up the set?  
> I've tried playing with the hashsize and maxelem values but it still 
> panics.

That's a pretty old version and lots of thing has been fixed (and new 
features added) since then. I'd suggest to go with the current ipset 
package, which supports your kernel version.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
