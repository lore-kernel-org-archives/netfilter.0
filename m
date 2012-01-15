From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: [ANNOUNCE] ipset 6.11 released
Date: Sun, 15 Jan 2012 18:27:09 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1201151825570.29134@blackhole.kfki.hu>
References: <alpine.DEB.2.00.1201141542490.26282@blackhole.kfki.hu> <4F130A03.7080208@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <4F130A03.7080208@googlemail.com>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

On Sun, 15 Jan 2012, Mr Dash Four wrote:

> > Kernel part changes:
> >  - hash:net,iface timeout bug fixed
> >  - Exceptions support added to hash:*net* types
> >   
> Any chance of fixing this bug soon:
> 
> ~# ipset n test hash:net family inet timeout 0
> ~# ipset a test 10.1.0.0/16
> ~# ipset t test 10.1.12.12
> 10.1.12.12 is in set test.
> ~# ipset t test 10.1.12.0/24
> 10.1.12.0/24 is NOT in test.

It's a feature which I'm not going to fix in any near future.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
