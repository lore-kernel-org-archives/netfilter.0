From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Ipset Error : ipset v6.25.1: Kernel error received: set type
 not supported (on Kernel 4.1.4)
Date: Tue, 11 Aug 2015 12:13:48 +0200 (CEST)
Message-ID: <alpine.DEB.2.10.1508111211280.9289@blackhole.kfki.hu>
References: <CAA5aLPh-_ySu=PFqkyyG+AzTWQo_cUc35ZcnH3W5ojQPeJeG4g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAA5aLPh-_ySu=PFqkyyG+AzTWQo_cUc35ZcnH3W5ojQPeJeG4g@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Akshat Kakkar <akshat.1984@gmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Tue, 11 Aug 2015, Akshat Kakkar wrote:

> I am running sl6.3 (i.e. kernel 2.6.32-279). I upgraded the kernel
> using elrepo to kernel 4.1.4.
> Then I downloaded ipset 6.25.
> I executed follwing commands
> ./autogen.sh
> ./configure
> make
> make modules
> make install
> make modules_install
> 
> No error is generated at any step

Wasn't there any warning message displayed, like 

!!! WARNING !!! WARNING !!! WARNING !!!

Your distribution seems to ignore the /lib/modules/<kernelrelease>/extra/
subdirectory, where the ipset kernel modules are installed.

Add the 'extra' directory to the search definition of your depmod
configuration (/etc/depmod.conf or /etc/depmod.d/) and re-run

        depmod <kernelrelease>

otherwise the ipset kernel modules in the extra subdir will be ignored.
 
> Now when I want to creat an uipset using command
> ipset -N foo hash:ip
> 
> I get error
> ""
> ipset v6.25.1: Kernel error received: set type not supported
> ""
> 
> output of uname -r
> 
> 4.1.4-1.el6.elrepo.x86_64 
> 
> o/p of " find /lib/modules/4.1.4-1.el6.elrepo.x86_64 -name ip_set.ko"
> 
> /lib/modules/4.1.4-1.el6.elrepo.x86_64/extra/netfilter/ipset/ip_set.ko
> /lib/modules/4.1.4-1.el6.elrepo.x86_64/kernel/net/netfilter/ipset/ip_set.ko
> 
> o/p of "find /lib/modules -name ip_set.ko"
> 
> /lib/modules/2.6.32-279.el6.x86_64/extra/ip_set.ko
> /lib/modules/2.6.32-279.el6.x86_64/kernel/net/netfilter/ipset/ip_set.ko
> /lib/modules/4.1.4-1.el6.elrepo.x86_64/extra/netfilter/ipset/ip_set.ko
> /lib/modules/4.1.4-1.el6.elrepo.x86_64/kernel/net/netfilter/ipset/ip_set.ko
> 
> 
> please help....

Please enter the command "modinfo ip_set" and post the generated output.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
