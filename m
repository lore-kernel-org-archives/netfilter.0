From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: banning bot ips with ipset
Date: Wed, 26 Nov 2008 09:16:02 +0100 (CET)
Message-ID: <alpine.DEB.2.00.0811260905490.31365@blackhole.kfki.hu>
References: <492C6780.4020909@xprima.com> <Pine.LNX.4.58.0811252145030.31197@mail3.jubileegroup.co.uk> <gghvpm$1cc$1@ger.gmane.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <gghvpm$1cc$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adem <for-gmane@alicewho.com>
Cc: netfilter@vger.kernel.org

On Tue, 25 Nov 2008, Adem wrote:

> "G.W. Haywood" wrote:
> > On Tue, 25 Nov 2008, Nigel Heron wrote:
> > 
> > > We're being attacked by a botnet ... started dropping them in
> > > iptables, once we got to ~1700 banned ips the server stopped nat'ing
> > > completely (not sure why..)
> > 
> > It probably just ran out of steam.  The performance of iptables with
> > thousands of rules can be poor if you don't structure them carefully.
> > 
> > > Is ipset stable enough to be deployed on live environments?
> > 
> > I've been using it for years with absolutely zero problems.
> > 
> > > iphash seems like the best set type for us, how many
> > > ips can the set handle before there's a noticeable slowdown?
> > 
> > I currently have about 50,000 ipset (iphash) rules on modest hardware,
> > with no noticeable performance impact.  There's a good report here:
> > http://people.netfilter.org/kadlec/nftest.pdf
> 
> Do you understand what the authors means with this statement in section 4.2:
> 
>   "As the graph displays, the system handled almost 
>    3,500,000 concurrent connections at the peak."
> 
> I wonder how this is possible... :-)

It means the number of conntrack entries at the maximum.

> I think one would need a machine with 54 NIC's (real and/or virtual) 
> attached to it, isn't it? :-)

No, it does not imply there was so many packets flowing through at the 
same time. The pps graphs show the maximum number of packets per 
second handled by the system during the tests.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
