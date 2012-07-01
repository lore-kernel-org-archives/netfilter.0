From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: [ANNOUNCE] ipset 6.13 released
Date: Sun, 1 Jul 2012 16:44:33 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1207011642300.2749@blackhole.kfki.hu>
References: <alpine.DEB.2.00.1206292201340.29738@blackhole.kfki.hu> <20120701132152.GD9358@workstation>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20120701132152.GD9358@workstation>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Herz <andi@geekosphere.org>
Cc: netfilter@vger.kernel.org

On Sun, 1 Jul 2012, Andreas Herz wrote:

> On 29/06/12 at 22:04, Jozsef Kadlecsik wrote:
> > I have just released ipset 6.13 with a few bugfixes and some new features.
> 
> Great, perfect timing, because i will go back to the testing and coding
> stuff for my ipset setup :)
> 
> >  - Timeout fixing bug broke SET target special timeout value, fixed
> >  - Use MSEC_PER_SEC instead of harcoded value
> 
> Does this also fix the jiffies issue with the kernel?

That was fixed in the previous version. 

> But i will see it in my testcases nevertheless.

I'm looking forward your testing results!

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
