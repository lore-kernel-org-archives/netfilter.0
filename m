From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset - bitmap:ip,mac kernel crashes, errors
Date: Thu, 11 Apr 2013 18:19:00 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1304111810520.32023@blackhole.kfki.hu>
References: <7a05d31eedfbe24e7ebf47c00df77176.squirrel@webmail.univ-nantes.fr>    <alpine.DEB.2.00.1304111652180.32023@blackhole.kfki.hu> <b4b9d9095cc35c0d3c167d09d9ac269b.squirrel@webmail.univ-nantes.fr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <b4b9d9095cc35c0d3c167d09d9ac269b.squirrel@webmail.univ-nantes.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yoann JUET <yoann.juet@univ-nantes.fr>
Cc: netfilter@vger.kernel.org

On Thu, 11 Apr 2013, Yoann JUET wrote:

> > On Thu, 11 Apr 2013, Yoann JUET wrote:
> >
> >> We are experiencing crashes with ipset (6.12) on a debian/wheezy with
> >> default kernel image (3.2.0). Using the bitmap:ip,mac set type + timeout
> >> support (all is ok without timeout support) triggers the problem
> >> systematically. A kernel panic occurs after issuing command 'ipset list'
> >> (sometimes a couple of times) when the total number of entries within a
> >> set exceeds a limit - 101 in my case -.
> >>
> >> A recent kernel (tested on 3.8.6) improves the situation. No more
> >> crashes,
> >> but it's still impossible to output all entries. We get a Kernel error:
> >>
> >> - With the default debian ipset version:
> >> ipset v6.12.1: Kernel error received: No buffer space available
> >>
> >> - And the last version:
> >> ipset v6.17: Kernel error received: No buffer space available
> >
> > Were the kernel modules from the ipset package installed?
> > What's the output of the command 'modinfo ip_set_hash_netport'?
> 
> I'm using ipset modules from the kernel tree:
> 
> # modinfo ip_set_hash_netport
> filename:      
> /lib/modules/3.8.6-dsiun-130219/kernel/net/netfilter/ipset/ip_set_hash_netport.ko
> alias:          ip_set_hash:net,port
> description:    hash:net,port type of IP sets, revisions 0-3
> author:         Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
> license:        GPL
> depends:        ip_set
> intree:         Y
> vermagic:       3.8.6-dsiun-130219 SMP mod_unload modversions

That looks OK. However, I'm unable to reproduce the problem: I created a 
bitmap:ip,mac set with timeout, added 255 entries and can list it just 
fine.

Is your machine stressed in memory? What's your architecture? Does the
"Kernel error received: No buffer space available" returned immediately
after the set is created/elements added, or after some time?

ENOBUFS is returned by netlink itself.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
