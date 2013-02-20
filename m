From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset nomatch generating kernel error: "directory not empty"
Date: Wed, 20 Feb 2013 22:38:15 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1302202235100.9720@blackhole.kfki.hu>
References: <20130217172119.73e427f5@typhoon.localnet>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20130217172119.73e427f5@typhoon.localnet>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Brendler <brendlerjg@gmail.com>
Cc: netfilter@vger.kernel.org

On Sun, 17 Feb 2013, John Brendler wrote:

> When using 'ipset test' against a 'nomatch' entry in a 'net:hash' set,
> I get a kernel error of "Directory not empty".
> 
> This is using linux-3.7.5 with ipset-6.16.
> 
> A quick demonstration may be clearer than a verbose description. This
> shows creation of a net:hash ipset which works fine, except that'ipset
> test' against a 'nomatch' entry results in an error.
> 
> What am I doing wrong?
> ------------------------------------------------------------------------
> ~ # ipset create tester hash:net
> 
> ~ # ipset add tester 192.168.0.0/24
> 
> ~ # ipset add tester 192.168.128.0/23
> 
> ~ # ipset add tester 192.168.129.1 nomatch
> 
> ~ # ipset test tester 192.168.129.1
> ipset v6.16: Kernel error received: Directory not empty

That's a harmless bug - the internal error code is not converted into the 
no match result text. Thanks for the reporting, the return code was 
checked in the testsuite and not the textual message. It'll be fixed in 
the next release.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
