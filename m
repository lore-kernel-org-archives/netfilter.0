From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: [ANNOUNCE] ipset 6.5 released
Date: Wed, 18 May 2011 09:54:26 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1105180948160.4117@blackhole.kfki.hu>
References: <alpine.DEB.2.00.1105151540340.25248@blackhole.kfki.hu> <4DD145C0.4060705@googlemail.com> <alpine.DEB.2.00.1105170941590.31848@blackhole.kfki.hu> <4DD255EF.1040209@googlemail.com> <alpine.DEB.2.00.1105171346350.31927@blackhole.kfki.hu>
 <4DD292FC.2020609@googlemail.com> <4DD2C018.9060800@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DD2C018.9060800@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: netfilter@vger.kernel.org

On Tue, 17 May 2011, Mr Dash Four wrote:

> > Will attach these together with the above. I was quite pleased with it as it
> > enabled me to streamline the whole process (ipset 4.5 wasn't the only thing
> > I was building), so you may find this quite useful if you decide to update
> > v4.5.
> Here is the test case, I'll attach the rest privately to avoid the wrath of
> the mail list daemon.
> 
> [root@test1 ~]# ipset -N slow_mirrors iptreemap --gc 300
> [root@test1 ~]# ipset -L slow_mirrors
> Name: slow_mirrors
> Type: hash:ip
> Header: family inet hashsize 1024 maxelem 65536
> Size in memory: 16512
> References: 0
> Members:
> [root@test1 ~]# ipset -A slow_mirrors 212.219.56.128/26
> [root@test1 ~]# ipset -A slow_mirrors 130.59.0.0/16

The latter itself exhausts the maximal number of elements in the set, so 
the error message is normal.

> ipset v6.5: Hash is full, cannot add more elements
> [root@xp1 ~]# ipset -L -terse slow_mirrors
> Name: slow_mirrors
> Type: hash:ip
> Header: family inet hashsize 32768 maxelem 65536
> Size in memory: 1006032
> References: 0
> 
> The way I look at it, the "old" iptree(map) type sets should be converted to
> hash:net, not hash:ip to avoid this error.

That's too late, I can't change the mapping from hash:ip to hash:net.
(And if the mapping pointed to hash:net, you were surprised then that 
after adding say 192.68.0.0/24 to the set, you couldn't delete 192.68.0.1 
from it. :-)

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
