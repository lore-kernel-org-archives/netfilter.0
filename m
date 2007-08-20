From: "michel banguerski" <banguerski+nfdev@gmail.com>
Subject: ipset performance question
Date: Tue, 21 Aug 2007 01:30:21 +0200
Message-ID: <cba9bb580708201630q7f8b1691naccd6cbd3422ce88@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:sender:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition:x-google-sender-auth;
	b=KBljPF6yTVSKelvitp/EzrV/EcFrAQpzgI7dVVbbzPxsw0zWKDaPJnVsXtfclzH4hUH7Lt5703UXs0YZX0tRVFvyCUj9CaF4ZYZ0VzAutHz/nEEt3+06/OtA9TNmlmyjul0N3epidNR1RGdj1aGqs064djOd+AEa+bWsydXWMrM=
Content-Disposition: inline
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
content-type: text/plain
To: netfilter@lists.netfilter.org

Greetings.

I'm working on a rules compiler that takes advantage of ipset and I'd
like to hear opinions on the following subject:

When firewall rules are expressed in conventional way (like in
fwbuilder), source and destination fields may be a mix of singular ip
adresses and subnets.

Ipset offer different types of sets but no one allows to express such a mixture.
A work seems to be in progress to allow unions of sets but for time
being we need to use multiple iptables rules to accomodate this
restriction:

iptables -A A_CHAIN -m set --set nethash_src src -j TEST_DST
iptables -A A_CHAIN -m set --set iphash_src src -j TEST_DST
iptables -A TEST_DST -m set --set nethash_dst dst -j A_TARGET
iptables -A TEST_DST -m set --set iphash_dst dst -j A_TARGET


There is however another way that  allows to match subnets and IPs in one rule.
The trick is actually simple: using a match module multiple times
leads to a logical AND in the rule while what we need is a logical OR
so we do the following transformation:
{ A union B } = {{A union C} inter ~{C\B}}
 where
 {A inter B } is empty
  C is a superset of B
 C\B means complement of B to C
 {{X} inter ~{Y}} means all elements of X that are not in {Y}
 we chose C of same type as A so it's easy to compute {A union C}

And it looks like this (let's suppose you want match source adresses
from {subnet1/mask1,..subnetN/maskN,IP1..ipN}):

ipset -N nh nethash
ipset -A nh <subnet1/mask>
...
ipset -A nh <subnet1/mask>
ipset -A nh <ip1/31>
...
ipset -A nh <ipN/31>

ipset -N iph iphash
ipset -A iph <complement_ip_in_slash31_subnet(ip1)>
...
ipset -A iph <complement_ip_in_slash31_subnet(ipN)>

Where complement_ip_in_slash31_subnet function works like this:
complement_ip_in_slash31_subnet function(10.0.0.1) => 10.0.0.0
complement_ip_in_slash31_subnet function(172.31.255.4) => 172.31.255.5
and so on.

Then we could issue the following rule
iptables -A A_CHAIN -m set --set nh src \! --set iph src -j A_TARGET

Of course, first we need to aggregate IPs in subnets when possible and
cleanup {subnet1/mask1,..subnetN/maskN,IP1..ipN} in such way that
there would no inclusion between subnets and singular adresses ie
enforce  "{A inter B} empty".

Now comes the questions I have trouble to answer because i lack
understanding of iptables/ipset internals:

 - is this worth doing at all ?
we may have one rule with four matches (three if we resort to binding
but it seems obsolete):
  iptables -A A_CHAIN -m set --set snh src \! --set siph src --set dnh
dst \! --set diph dst -j A_TARGET
instead of four rules with one match each (see example above).

- wouldn't it be more efficient to use ipmap instead of iphash ? (I think yes)

- what about multiple ipmap sets if {C\B} is too sparse ?

- using similar tricks sometimes it may be possible to use in the same
rule two nethash sets of total size smaller than the size of the
original one nethash could it be efficient?

Thanks in advance for your comments

Best regards
Michel

