From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Kernel panic with ipset 6.11
Date: Thu, 19 Apr 2012 09:10:31 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1204190853050.30547@blackhole.kfki.hu>
References: <jmni05$12j$1@dough.gmane.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <jmni05$12j$1@dough.gmane.org>
Content-ID: <alpine.DEB.2.00.1204190900271.30547@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Seblu <seblu@seblu.net>
Cc: netfilter@vger.kernel.org

Hi,

On Thu, 19 Apr 2012, Seblu wrote:

> I have a version of ipset builded on 16 Jan 2012 probably with gcc 4.6.
> I will name it ipset-1 in this mail.
> 
> Today I builded a new binary of the same source ipset 6.11 compiled with
> the same options. This binary is built with gcc 4.7. It will be named as
> ipset-1.1
> 
> I also not the kernel ABI is different
> # readelf -n ipset-1*|grep -e Linux -e File
> File: ipset-1
>     OS: Linux, ABI: 2.6.27
> File: ipset-1.1
>     OS: Linux, ABI: 2.6.32
> 
> My host is an i686 archlinux system with 3.3 kernel
> # uname -a
> Linux archibal 3.3.2-1-ARCH #1 SMP PREEMPT Sat Apr 14 10:08:43 UTC 2012
> i686 Intel(R) Core(TM) i7 CPU M 620 @ 2.67GHz GenuineIntel GNU/Linux
> 
> When i try to restore saved sets, i got a kernel panic with ipset-1.1
> but not with ipset-1.
> 
> # ./ipset-1 restore < ipset.conf.0
> # ./ipset-1 x
> # ./ipset-1.1 restore < ipset.conf.0
> Write failed: Broken pipe
> 
> I attached the kernel panic dump from netconsole, the both binary and
> the config file i load.
> 
> I this see 2 issues:
> Firstly, i suppose kernel must not panic because i run ipset.

No, definitely not. Did you use exactly the same kernel in both cases and 
only the ipset binary was different?

> Secondly, i wondering if gcc is cause of the bad working of the new ipset?
> 
> I also tested with an x86_64 host and ipset is only broken. No kernel panic.
> 
> # uname -a
> Linux archipel 3.3.2-1-ARCH #1 SMP PREEMPT Sat Apr 14 09:48:37 CEST 2012
> x86_64 Intel(R) Core(TM) i7 CPU M 620 @ 2.67GHz GenuineIntel GNU/Linux
> # ipset restore < ipset.conf.0
> ipset v6.11: Hash is full, cannot add more elements
> # ipset list
> Name: foo
> Type: hash:ip,port,net
> Header: family inet hashsize 64 maxelem 0
                               ^^         ^???
> Size in memory: 1408
> References: 0
> Members:

If ipset.conf.0 is the file you attached, then that's absolutely strange, 
because the set was to be created as

create foo hash:ip,port,net family inet hashsize 1024 maxelem 65536

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
