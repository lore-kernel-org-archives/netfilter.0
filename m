From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset 6.6 bug: subnet (mis)matching
Date: Wed, 8 Jun 2011 12:46:38 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1106081214130.31592@blackhole.kfki.hu>
References: <alpine.DEB.2.00.1105241039080.1846@blackhole.kfki.hu> <4DEECD8C.6050302@googlemail.com> <alpine.DEB.2.00.1106080859230.31443@blackhole.kfki.hu> <4DEF49FE.4080708@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DEF49FE.4080708@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: netfilter@vger.kernel.org

On Wed, 8 Jun 2011, Mr Dash Four wrote:
 
> > > [root@test1 ~]# ipset n test hash:net family inet timeout 0
> > > [root@test1 ~]# ipset a test 10.16.0.0-10.16.255.255
> > > [root@test1 ~]# ipset l test
> > > Name: test
> > > Type: hash:net
> > > Header: family inet hashsize 1024 maxelem 65536 timeout 0 Size in memory:
> > > 16832
> > > References: 0
> > > Members:
> > > 10.16.0.0/16 timeout 0
> > > [root@test1 ~]# ipset t test 10.16.224.0/24
> > > 10.16.224.0/24 is NOT in set test.
> > > [root@test1 ~]# ipset t test 10.16.224.1   10.16.224.1 is in set test.
> > > 
> > > That is plainly wrong!
> > 
> > No, that's a feature: it makes possible to check from userspace how the
> > kernel would match an IP address in the set.
> You can't be serious! How could this be a "feature"?! It is a bug, clearly!
> 
> The /24 subnet (10.16.224.0-10.16.224.255) clearly covers the single IP
> address (10.16.224.1) and the test should be positive in both cases, as the
> /16 member of the set (10.16.0.0-10.16.255.255) covers both the single IP
> address as well as the /24subnet range tested. Apparently, that seems not to
> be the case. How am I suppose to test subnet ranges then?

I can only repeat myself: for the hash:*net* types the testing with a host 
address is special and handled as the kernel would test an IP address.
However network addresses are handled as a whole and overlapping is *not* 
checked. It's documented in the manpage.

Maybe an example helps: when you add 10.6.0.0/16, you add an "apple". You 
can also add 10.6.0.0/24, a "pear". Nothing prevents you, both can be the 
member of the set, because overlapping is not handled. At deleting, 
testing they are handled as "apple" and "pear", too. If "pear" is not 
added to the set, it's not "in" the set as a member - even if we know, 
that the elements of "apple" fully cover the elements of "pear". However 
at testing 10.16.224.1[/32] you test a "seed", which is checked inside 
"apple".

Merging with already existing elements (or breaking up if a network from a 
larger network were deleted) would be very expensive. I know, you compare 
the types to iptreemap, but iptreemap was a very special case where 
merging/breaking up was a natural process and costed almost nothing.

> I presume if I have 10.16.224.0/24 as a member and do a test with 10.16.0.0/16
> that would also return a negative match, isn't that the case?

Yes, of course.
 
> >  Maybe it's badly worded in the manpage: "When testing entries, if a host
> > address is tested, then the kernel tries to match the host address in the
> > networks added to the set and reports the result accordingly."
> >   
> That's all well and good for hosts, but ip ranges should either be tested
> properly or testing of those should be disabled altogether (which, if
> introduced, would be a severe restriction for me - I am not going to run a
> couple of thousand "ipset t" tests just to see that all of the single IP
> addresses in the range I am interested in match - that simply isn't going to
> happen!).

I don't quite follow you here: you can add, delete and test the elements 
by ipset. As a special feature, you can also test the members of elements, 
too by ipset.

Probably what you expect is the following:

    add 192.168.0.0/24
    add 192.168.1.0/24
		magically aggregate into 192.168.0.0/23
    add 192.168.2.0/24
    add 192.168.3.0/24
		magically aggregate into 192.168.0.0/22
    del 192.168.1.0/24
		break up into the elements
			192.168.0.0/24
			192.168.2.0/23
		
There's no such magic there.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
