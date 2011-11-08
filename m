From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: [iptables] Effect of negating multiple source or dest IPs (-s
 or -d)
Date: Tue, 8 Nov 2011 21:22:45 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1111082112340.31624@blackhole.kfki.hu>
References: <j9bjgb$v1f$1@dough.gmane.org> <c202a761ac23061d639eebb1ec1f661e.squirrel@nmvrt01.netsim.ch> <j9bkr5$a5f$1@dough.gmane.org> <alpine.LNX.2.01.1111081740580.18080@frira.zrqbmnf.qr> <j9bnrd$372$1@dough.gmane.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <j9bnrd$372$1@dough.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "U.Mutlu" <for-gmane@mutluit.com>
Cc: netfilter@vger.kernel.org

On Tue, 8 Nov 2011, U.Mutlu wrote:

> Jan Engelhardt wrote, On 2011-11-08 17:44:
> > On Tuesday 2011-11-08 17:19, U.Mutlu wrote:
> > 
> > > sim@netmess.org wrote, On 2011-11-08 17:16:
> > > > > What's the effect of this rule on a multihomed box
> > > > > (the IPs below are just some examples, not real):
> > > > > 
> > > > >     iptables -A INPUT ! -d 1.2.3.4,2.3.4.5 -p all -j DROP
> > > > > 
> > > > 
> > > > the newest version of iptables says:
> > > > 
> > > > iptables v1.4.12.1: ! not allowed with multiple source or destination IP
> > > > addresses
> > > 
> > > Oh, one wonders why they did so...
> > 
> > Because it leads to a confusing result.
> > 
> > 	! -d a,b,c
> > 
> > could be reasonably interpreted as
> > 
> > 	! -d a&&  ! -d b&&  ! -d c
> > 
> > but because using "," in -s/-d means a simple rule expansion, it
> > actually generates an equivalent of
> > 
> > 	! -d a || ! -d b || ! -d c
> 
> But OR'ing them IMHO doesn't make much sense, just think about it.
> I would suggest to AND them.
> Look, a normal rule like this one
>   iptables -A INPUT -m state --state NEW -p tcp --dport  80 -j ACCEPT
> matches only if every single part of it matches (ie. AND).
> Then in our negation case above it should behave similar,
> and not switch to OR.

The matches are AND-ed. However the individual matches may generate OR 
conditions, like multiport.

What you suggest means that while

	-d a,b

is interpreted as "a" OR "b", then

	! -d a,b

should be interpeted as NOT "a" AND NOT "b".

I think that'd be pretty confusing.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
