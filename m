From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Using multiple ipsets in a single rule.
Date: Thu, 2 Aug 2012 10:44:33 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1208021042250.26318@blackhole.kfki.hu>
References: <1343879433.4471.3.camel@localhost> <alpine.DEB.2.00.1208021021500.26245@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1208021021500.26245@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikolai Lusan <nikolai@lusan.id.au>
Cc: netfilter@vger.kernel.org

On Thu, 2 Aug 2012, Jozsef Kadlecsik wrote:

> On Thu, 2 Aug 2012, Nikolai Lusan wrote:
> 
> > After receiving advice that multiple set matching was supported I have
> > written a firewall that uses multiple set matches in a single iptables
> > rule only to receive the error message "--match-set can on be used
> > once". Is there support for matching against more than one set? Or is it
> > possible that this can be done in a future release?
> 
> Which is the iptables version you use? The parser has changed several 
> times since the multiple same match support had been added, so the feature 
> might get lost.

No, you must use wrong syntax. Matching against multiple sets is supported 
via multiple matches, i.e.

iptables ... -m set --match-set foo src,dst -m set --match-set bar src ...

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
