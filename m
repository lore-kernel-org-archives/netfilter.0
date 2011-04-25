From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset kernel oops
Date: Mon, 25 Apr 2011 19:46:53 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1104251929001.30748@blackhole.kfki.hu>
References: <4DB1F58B.9080500@googlemail.com> <alpine.DEB.2.00.1104232026240.23429@blackhole.kfki.hu> <4DB3FE63.1030305@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DB3FE63.1030305@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Sun, 24 Apr 2011, Mr Dash Four wrote:

> > How much RAM have you got in that machine?
> 283248k physical RAM, 128MB swap file.

That 30k addresses alone need roughly 30MB non-swappable memory, ~10% of 
all of the physical RAM. Depending on what else's running on that machine, 
the required memory can be significant.
 
> >  Are the 30k addresses pseudo-random, i.e. don't come from several
> > netblocks?
> >   
> 99.8% from all addresses/subnets come my geoip database (IP addresses compiled
> from various countries I banned from my networks as they have no business
> accessing it) - the rest consists of pseudo-random (selected) subnets. It is
> also worth mentioning that:
> 
> 1. When ipset loads these addresses during boot no such error takes place
> (though it takes about 10+ minutes for these to load as the machine on which
> this run is not very powerful);
> 2. The error happens when I try to load these ipsets from the command line
> (i.e. do exactly the same thing from the shell as in 1 above);

At boot time the memory is not fragmented. Later on maybe it's harder to 
find for the kernel the required continuous memory spaces.

> 3. At no point during 1 or 2 the swap file is used, which leads me to believe
> that this error does not happen because of insufficient memory;
> 
> On a separate note, is it normal for my ipsets to take absolute *ages* to load
> (about 5 minutes on a P4 machine as well)? I am loading these exact sets on a
> Core2 machine and even though it takes much less time (about 20 seconds or so)
> I am still a bit bemused why does it take that long, comparing to other ipset
> operations? I can't complain about the run-time performance of ipset though -
> it is simply unmatched by anything else I used (or attempted to use)!

I have never tested iptree(map) with so many elements, so it's surprising 
for me that it takes so many time. But if the 30k addresses are quite 
different then the iptreemap has to build up a four-level tree with 30k 
branches from the second level down.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
