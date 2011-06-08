From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset 6.6 bug: subnet (mis)matching
Date: Wed, 8 Jun 2011 13:43:01 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1106081327030.31592@blackhole.kfki.hu>
References: <alpine.DEB.2.00.1105241039080.1846@blackhole.kfki.hu> <4DEECD8C.6050302@googlemail.com> <alpine.DEB.2.00.1106080859230.31443@blackhole.kfki.hu> <4DEF49FE.4080708@googlemail.com> <alpine.DEB.2.00.1106081214130.31592@blackhole.kfki.hu>
 <4DEF5B3B.3050609@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DEF5B3B.3050609@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

On Wed, 8 Jun 2011, Mr Dash Four wrote:

> OK, if I have 10.16.0.0/16 as a member and then test a subnet range which is
> covered by the /16 address - again, lets say 10.16.1.0/24 - I expect to get a
> match as clearly, from both mathematical as well as networking terms, all
> "members" of 10.16.1.0/24 are also "members" of 10.16.0.0/16, so the test
> result should return a positive. It doesn't!
> 
> I can understand a negative result if I test the other way around - not all
> "members" of 10.16.0.0/16 would belong to 10.16.1.0/24 and returning a
> negative test result in this instance is OK.
> 
> It doesn't work like that in ipset though - ipset seems to be operating either
> on "exact match" (say if I have 10.16.0.0/16 as a member and test with
> 10.16.0.0/16) or when a single ip address is tested, which I don't think is
> right and that was my point all along.

Current behaviour cannot be modified easily. There's no overlap checking 
(and aggregation/breaking up) in ipset, so it can't be prevented that 
someone adds overlapping elements to a set:

add 10.16.0.0/16
add 10.16.1.0/24

Now if 10.16.1.0/24 is tested as you suggest, one cannot tell whether the 
explicit network 10.16.1.0/24 is added to the set or the tested elements 
are just the members of a larger network.

Currently:
    test 10.16.1.1	=> test explicit and implicit membership
    test 10.16.1.0/24	=> test explicit membership only

What you propose is to test explicit and implicit membership in all cases.

My top priority now is to get the kernel in sync with ipset 6.7. It's just 
a much higher problem, because a lot of features and fixes are missing, 
even from the newest kernel version.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
