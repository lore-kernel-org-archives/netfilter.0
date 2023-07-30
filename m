From: Tim Mooney <Tim.Mooney@ndsu.edu>
Subject: converting iptables/ip6tables to efficient nftables rules
Date: Sun, 30 Jul 2023 15:30:14 -0500 (CDT)
Message-ID: <924b35f-bda5-6ae5-efe-d05a8de7aec__42971.3546576508$1690749545$gmane$org@ndsu.edu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org


All-

I haven't been able to find anywhere in the nftables wiki that talks
about "Dos and Don'ts" from an efficiency perspective, especially for
people that may be coming from iptables/ip6tables to nftables.  If it's
there and I've missed it, please point me at it.

I have a mix of 32 iptables and ip6tables rules on a RHEL 7 box that I
want to convert to nftables for RHEL 9 (kernel 5.14.0 + Red Hat vendor
sauce, nftables 1.0.4).

The obvious thing to do would be to just directly translate each rule to
nftables, and have 32 nftables rules.

However, the iptables rules are all pairs of

 	-A ports_allow -p tcp -m tcp -s X.Y.0.0/16 --dport 80 -j ACCEPT
 	-A ports_allow -p tcp -m tcp -s X.Y.0.0/16 --dport 443 -j ACCEPT

 	-A ports_allow -p tcp -m tcp -s A.B.C.D/32 --dport 80 -j ACCEPT
 	-A ports_allow -p tcp -m tcp -s A.B.C.D/32 --dport 443 -j ACCEPT

So I could cut the number of ntables rules in half just by using

 	dport { 80, 443 }

in the translated rule.

The question is, *is it more efficient*, from a packet processing
perspective, to do that?  My guess is that it is, but can anyone with
expertise confirm?  If it is more efficient, what type of efficiency
improvement are we talking about, roughly?

Similarly, all of the rules list CIDR ranges or individual IPs, though
there are a mix of IPv4 and IPv6 ranges.  I therefore could greatly reduce
the number of rules by creating a couple of named sets, one for IPv4 and
one for IPv6, and match the 'ip saddr' against the sets.

Again, the question is, *is that more efficient* for the kernel to process
than just having individual rules that each list a CIDR range or IP?  If
using the two sets are more efficient, roughly how much so?

I appreciate any information people can offer.  As my site converts more and
more of our systems to using nftables, I would like to feel confident that
we're writing updated rules that are at least as efficient (preferrably
more so) as our old iptables/ip6tables rules.

Thanks,

Tim
-- 
Tim Mooney                                             Tim.Mooney@ndsu.edu
Enterprise Computing & Infrastructure /
Division of Information Technology    /                701-231-1076 (Voice)
North Dakota State University, Fargo, ND 58105-5164
