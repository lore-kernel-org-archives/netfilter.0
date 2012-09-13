From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset v6.11: Kernel error received: maximal number of sets
 reached, cannot create more.
Date: Thu, 13 Sep 2012 19:51:43 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1209131929160.11289@blackhole.kfki.hu>
References: <CAE63xUNELpSFDOJEd1Bs8XV8TE+bqJmp4dReMe74Gv-SVzYM6w@mail.gmail.com> <CAE63xUNRi97dFJN77Mo+RSRmh_XjBsMoBkHE7vrnVr8VGAE=_g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAE63xUNRi97dFJN77Mo+RSRmh_XjBsMoBkHE7vrnVr8VGAE=_g@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ugis <ugis22@gmail.com>
Cc: netfilter@vger.kernel.org

On Thu, 13 Sep 2012, Ugis wrote:

> There was a plan to write ipset+iptables config with many
> ipsets(combination of hash:net + bitmap:port).
> To test how many sets can I add - I have written little script to
> create and populate ipset rules in a loop.
> 
> When executing script I hit the error:"ipset v6.11: Kernel error
> received:maximal number of sets reached, cannot create more."
> 
> I was really surprised that this error hit already on 254 set limit
> with type hash:net sets(last lines of "ipset save" follows)
> create NET-254 hash:net family inet hashsize 1024 maxelem 65536
> add NET-254 10.1.1.0/24
> 
> If I added type bitmap:port set creation in loop - I got exactly half
> count of every type(last lines of "ipset save" follows):
> create NETs-127 hash:net family inet hashsize 1024 maxelem 65536
> add NETs-127 10.1.1.0/24
> create PORTs-127 bitmap:port range 1-35635
> add PORTs-127 80 
> 
> Questions:
> 1)what parameters can I tune to get more ipsets(couple thousands I
> guess)? sysctl? RAM size?. Recompiling kernel is not an option this
> time.

The maximal number of sets *is* configured at kernel configuration and 
needs a recompiling. There's no other way to increase the number.

> 2)statistically there would be sets of type hash:net(1-3 members each)
> + bitmap:port sets(1-5 members each) and lots of iptables rules with
> combinations of those as src,dst + protocol match. Probably count of
> iptables rules can grow over 1-2 thousand. What would be less harm to
> packet latency(assuming match on last iptables
> rule) - less iptables rules+ipsets(let's say 1K iptables rules + 2K
> ipsets(if possible) ) OR no ipsets at all and lots of iptables
> rules(let's say 5K iptables rules)?

I don't see what is the point in storing a few (1-5!) members in a set... 
But unless the rule tree is highly optimized, a lot of performance is lost 
anyway...

> 3)Anybody seen any benchmarks iptables rule count vs packet latency -
> what is the reasonable limit for iptables, ipset rule count after all?
> Any CPU core must scan all ipset rules anyway(I guess), so more cores
> would just multiply packets being processed paralelly, but not speed
> up single packet latency, right?

Our old one might still be relevant: 

http://www.kfki.hu/~kadlec/sw/netfilter/nftest.pdf

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
