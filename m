From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset -R
Date: Fri, 25 Feb 2011 09:38:00 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1102250915200.20179@blackhole.kfki.hu>
References: <4D645BC7.7030306@googlemail.com> <alpine.DEB.2.00.1102232009001.16917@blackhole.kfki.hu> <4D659102.8090501@googlemail.com> <AANLkTi=06RAwFaiQzjiTMmJaoy+EgXSbq3UdOfonH4UQ@mail.gmail.com> <4D664C9F.3020701@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D664C9F.3020701@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: Pandu Poluan <pandu@poluan.info>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Thu, 24 Feb 2011, Mr Dash Four wrote:

> Jozsef, you mentioned yesterday that ipset 5.x (and I presume 6.0+ also) does
> not implement ip range 'readjustment' any more. If so, what happens when I
> list the set below:
> 
> ipset -F test
> ipset -A test 10.1.1.0/24
> ipset -D test 10.1.1.12
> ipset -L test

It depends on the type of the set. With hash:ip type it's simple

# ipset -N test hash:ip
# ipset -A test 10.1.1.0/24 
# ipset -D test 10.1.1.12 
# ipset -L test | grep 10.1.1.12
10.1.1.125                                                                      
10.1.1.126                                                                      
10.1.1.124                                                                      
10.1.1.122                                                                      
10.1.1.129                                                                      
10.1.1.123                                                                      
10.1.1.121                                                                      
10.1.1.120                                                                      
10.1.1.127                                                                      
10.1.1.128 

However with hash:net type

# ipset -N test hash:net
# ipset -A test 10.1.1.0/24
# ipset -D test 10.1.1.12
ipset v6.0: Element cannot be deleted from the set: it's not added

and that's also right, because the hash types do not magically figure out 
overlapping ranges and collapse those or break up ranges into parts when 
deleting intersecting elements.
 
The hash:*net* types could be extended to store non-matching elements, 
something like this:

# ipset -N test hash:net
# ipset -A test 10.1.1.0/24
# ipset -A test 10.1.1.12 --nomatch

That way overlapping entries with different "access right" could be stored 
in a single set. But any coding needs time and testing.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
