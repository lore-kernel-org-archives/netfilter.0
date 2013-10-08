From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset compile error
Date: Tue, 8 Oct 2013 10:33:11 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1310081029390.22464@blackhole.kfki.hu>
References: <5253A5F7.1090403@metu.edu.tr> <alpine.DEB.2.00.1310081008350.22464@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1310081008350.22464@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Husnu Demir <hdemir@metu.edu.tr>
Cc: netfilter@vger.kernel.org

On Tue, 8 Oct 2013, Jozsef Kadlecsik wrote:

> On Tue, 8 Oct 2013, Husnu Demir wrote:
> 
> > /usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.c: In
> > function ?hash_netnet4_kadt?:
> > /usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.c:141:
> > error: unknown field ?cidr? specified in initializer
> 
> However this looks like a broken git tree at our side. Are you sure it's a 
> fully syncronized/cloned git tree?

I meant "at your side" - I checked both with recent kernel trees and 
2.6.32.60. I haven't checked 3.8.7, but the part above is independent of 
kernel versions.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
