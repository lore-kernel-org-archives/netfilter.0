From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset 6.6 bug: subnet (mis)matching
Date: Wed, 8 Jun 2011 09:07:48 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1106080859230.31443@blackhole.kfki.hu>
References: <alpine.DEB.2.00.1105241039080.1846@blackhole.kfki.hu> <4DEECD8C.6050302@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DEECD8C.6050302@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: netfilter@vger.kernel.org

On Wed, 8 Jun 2011, Mr Dash Four wrote:

> [root@test1 ~]# ipset n test hash:net family inet timeout 0
> [root@test1 ~]# ipset a test 10.16.0.0-10.16.255.255
> [root@test1 ~]# ipset l test
> Name: test
> Type: hash:net
> Header: family inet hashsize 1024 maxelem 65536 timeout 0 
> Size in memory: 16832
> References: 0
> Members:
> 10.16.0.0/16 timeout 0
> [root@test1 ~]# ipset t test 10.16.224.0/24
> 10.16.224.0/24 is NOT in set test.
> [root@test1 ~]# ipset t test 10.16.224.1   
> 10.16.224.1 is in set test.
> 
> That is plainly wrong!

No, that's a feature: it makes possible to check from userspace how the 
kernel would match an IP address in the set. Maybe it's badly worded in 
the manpage: "When testing entries, if a host address is tested, then the 
kernel tries to match the host address in the networks added to the set 
and reports the result accordingly."

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
