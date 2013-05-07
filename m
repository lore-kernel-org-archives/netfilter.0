From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: RE: Fwd: ipset and counters
Date: Tue, 7 May 2013 14:19:26 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1305071409560.16401@blackhole.kfki.hu>
References: <51752B00.8090908@metu.edu.tr> <51753143.8090908@metu.edu.tr> <alpine.DEB.2.00.1304221554230.16792@blackhole.kfki.hu> <5175432F.2060304@metu.edu.tr> <alpine.DEB.2.00.1304221921001.19576@blackhole.kfki.hu> <loom.20130506T151314-549@post.gmane.org>
 <alpine.DEB.2.00.1305061535250.12392@blackhole.kfki.hu> <003a01ce4a68$7ccb5e40$76621ac0$@com> <alpine.DEB.2.00.1305062022050.15306@blackhole.kfki.hu> <002b01ce4b1b$1e766980$5b633c80$@com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <002b01ce4b1b$1e766980$5b633c80$@com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tian fang <tianfang@gmail.com>
Cc: netfilter@vger.kernel.org

On Tue, 7 May 2013, tian fang wrote:

> I suspect your "depmod" utility is not configured to process the
> /lib/modules/`uname -r`/extra/ directory, in which the modules are installed
> by the command "make modules_install".
> 
> It's strange. You're the second reporting such kind of problem.
> What is your distribution and what's its version?
> 
>      I am using ubuntu 12.04 LTS.

I'll check this out: it should work without any extra effort.

> And I got an issue ,I am sorry if I am wrong because I am a quite newbie.
> 
> I am confused of the "--match-set setname src,dst" .  it seems only the one
> before the comma is functional. Please look at this .
> 
> I added an IP into the ipset sec,and set the iptables FORWARD Chain as "dst,
> src" ,I guess this means dst OR src, but unfortunately ,my outgoing packages
> was dropped.
> 
> If I set two separated lines ,it works.

If the dimension of the set is less than the direction parameters of the 
set match/SET target, then that's ignored.

With "--match-set setname src,dst" you instruct ipset that if the named 
set stores IP address and port number pairs, then get the source and 
destination parameters from the packets, say 192.168.1.1 as source 
address, TCP port 80 as destination, form the element 192.168.1.1,tcp:80 
and look it up in the given set.

You can't store and lookup IP address pairs, if that's what you want.

Best regards,
Jozsef
 
> tfang@gateway:~$ sudo iptables -nvL
> Chain INPUT (policy ACCEPT 83 packets, 4308 bytes)
>  pkts bytes target     prot opt in     out     source
> destination
> 
> Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
>  pkts bytes target     prot opt in     out     source
> destination
>     0     0 ACCEPT     all  --  *      *       0.0.0.0/0
> 0.0.0.0/0            match-set sec dst,src
>     4   252 DROP       all  --  *      *       0.0.0.0/0
> 0.0.0.0/0
> 
> Chain OUTPUT (policy ACCEPT 114 packets, 14440 bytes)
>  pkts bytes target     prot opt in     out     source
> destination
> 
> 
> 
> 
> E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu PGP key :
> http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
>           H-1525 Budapest 114, POB. 49, Hungary
> 
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
