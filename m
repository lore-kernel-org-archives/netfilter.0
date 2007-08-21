From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset performance question
Date: Tue, 21 Aug 2007 14:45:25 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0708211428300.28106@blackhole.kfki.hu>
References: <cba9bb580708201630q7f8b1691naccd6cbd3422ce88@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <cba9bb580708201630q7f8b1691naccd6cbd3422ce88@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
content-type: TEXT/PLAIN; format="flowed"
To: michel banguerski <banguerski+nfdev@gmail.com>
Cc: netfilter@lists.netfilter.org

Hi,

On Tue, 21 Aug 2007, michel banguerski wrote:

> I'm working on a rules compiler that takes advantage of ipset and I'd
> like to hear opinions on the following subject:
>
> When firewall rules are expressed in conventional way (like in
> fwbuilder), source and destination fields may be a mix of singular ip
> adresses and subnets.
>
> Ipset offer different types of sets but no one allows to express such a mixture.
> A work seems to be in progress to allow unions of sets but for time
> being we need to use multiple iptables rules to accomodate this
> restriction:
>
> iptables -A A_CHAIN -m set --set nethash_src src -j TEST_DST
> iptables -A A_CHAIN -m set --set iphash_src src -j TEST_DST
> iptables -A TEST_DST -m set --set nethash_dst dst -j A_TARGET
> iptables -A TEST_DST -m set --set iphash_dst dst -j A_TARGET
>
>
> There is however another way that  allows to match subnets and IPs in one rule.
> The trick is actually simple: using a match module multiple times
> leads to a logical AND in the rule while what we need is a logical OR
> so we do the following transformation:
> { A union B } = {{A union C} inter ~{C\B}}
> where
> {A inter B } is empty
>  C is a superset of B
> C\B means complement of B to C
> {{X} inter ~{Y}} means all elements of X that are not in {Y}
> we chose C of same type as A so it's easy to compute {A union C}
>
> And it looks like this (let's suppose you want match source adresses
> from {subnet1/mask1,..subnetN/maskN,IP1..ipN}):
>
> ipset -N nh nethash
> ipset -A nh <subnet1/mask>
> ...
> ipset -A nh <subnet1/mask>
> ipset -A nh <ip1/31>
> ...
> ipset -A nh <ipN/31>
>
> ipset -N iph iphash
> ipset -A iph <complement_ip_in_slash31_subnet(ip1)>
> ...
> ipset -A iph <complement_ip_in_slash31_subnet(ipN)>
>
> Where complement_ip_in_slash31_subnet function works like this:
> complement_ip_in_slash31_subnet function(10.0.0.1) => 10.0.0.0
> complement_ip_in_slash31_subnet function(172.31.255.4) => 172.31.255.5
> and so on.
>
> Then we could issue the following rule
> iptables -A A_CHAIN -m set --set nh src \! --set iph src -j A_TARGET
>
> Of course, first we need to aggregate IPs in subnets when possible and
> cleanup {subnet1/mask1,..subnetN/maskN,IP1..ipN} in such way that
> there would no inclusion between subnets and singular adresses ie
> enforce  "{A inter B} empty".
>
> Now comes the questions I have trouble to answer because i lack
> understanding of iptables/ipset internals:
>
> - is this worth doing at all ?
> we may have one rule with four matches (three if we resort to binding
> but it seems obsolete):
>  iptables -A A_CHAIN -m set --set snh src \! --set siph src --set dnh
> dst \! --set diph dst -j A_TARGET
> instead of four rules with one match each (see example above).

Hard to say much. From ipset point of view, iff there are identical number 
of set lookups, then it does not matter, but ipmap types are faster than 
hashes. From iptables point of view, due to the implicit internal 
checkings (src/dst IP addresses and interfaces) you should minimize the 
number of the iptables rules.

> - wouldn't it be more efficient to use ipmap instead of iphash ? (I think yes)

Yes.

> - what about multiple ipmap sets if {C\B} is too sparse ?

That'd involve multiple iptables rules as you cannot express OR matches in 
one rule, just AND ones (and there is no "union" set type yet).

> - using similar tricks sometimes it may be possible to use in the same
> rule two nethash sets of total size smaller than the size of the
> original one nethash could it be efficient?

Real testing could answer it best.

But please take into account how much resource you use to compute the 
"best" set/rule combination. Does it worth if you cannot gain really much 
or if you loose the possibility to quickly add or delete IP addresses from 
anywhere?

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
           H-1525 Budapest 114, POB. 49, Hungary

