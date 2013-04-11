From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset - bitmap:ip,mac kernel crashes, errors
Date: Thu, 11 Apr 2013 16:55:54 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1304111652180.32023@blackhole.kfki.hu>
References: <7a05d31eedfbe24e7ebf47c00df77176.squirrel@webmail.univ-nantes.fr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <7a05d31eedfbe24e7ebf47c00df77176.squirrel@webmail.univ-nantes.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yoann JUET <yoann.juet@univ-nantes.fr>
Cc: netfilter@vger.kernel.org

On Thu, 11 Apr 2013, Yoann JUET wrote:

> We are experiencing crashes with ipset (6.12) on a debian/wheezy with
> default kernel image (3.2.0). Using the bitmap:ip,mac set type + timeout
> support (all is ok without timeout support) triggers the problem
> systematically. A kernel panic occurs after issuing command 'ipset list'
> (sometimes a couple of times) when the total number of entries within a
> set exceeds a limit - 101 in my case -.
> 
> A recent kernel (tested on 3.8.6) improves the situation. No more crashes,
> but it's still impossible to output all entries. We get a Kernel error:
> 
> - With the default debian ipset version:
> ipset v6.12.1: Kernel error received: No buffer space available
> 
> - And the last version:
> ipset v6.17: Kernel error received: No buffer space available

Were the kernel modules from the ipset package installed?
What's the output of the command 'modinfo ip_set_hash_netport'?
 
> I've seen on this list discussions about crashes, then a bug fix on
> version 6.15. Some have experienced the same kernel error but no
> workaround seems to be available. We are using the bitmap:ip,mac set type
> on several captive portal servers. 'ipset list' command is a convenient
> way for us to check for active users. Ideas to fix this problem ?

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
