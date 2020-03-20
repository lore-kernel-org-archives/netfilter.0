From: Stefan Hartmann <stefanh@hafenthal.de>
Subject: nftables 0.9.3, sets with concatentation
Date: Fri, 20 Mar 2020 16:51:06 +0100
Message-ID: <10a01f25-84fa-fa19-c10f-7c530ef9f10c@hafenthal.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: de-DE
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter.org" <netfilter@vger.kernel.org>

I have successfully migrated from a cisco IOS router to a new GNU/Linux 
Debian box with nftables 0.9.3.

At now I am trying to simplify the configuration with sets.
E.g.
table ip FILTER4 {
	set s4_ICMP-RELATED {
		type icmp_type
		elements = { destination-unreachable,
			     time-exceeded }

and using this set
...
chain ACL4-IN_IF2 {
		ct state invalid log prefix "NFT: FILTER4/ACL4-IN_IF2: ct invalid: " drop
		ct state established,related accept
		icmp type @s4_ICMP-RELATED accept
		...

This works perfectly with sets without concatenation.


For the sake of a well-arranged ruleset,
it would be nice to have a concatenated set like
	set s4_MISC-SERVICES {
		type inet_proto . inet_service
		elements = { udp . 69, tcp . 23 ]

and then use this set like
	ip daddr $IP4_IF2 . dport @s4_MISC-SERVICES accept

But I got a syntax error "unexpected dport".

With eg ip daddr $IP4_IF2 . udp dport @s4_MISC-SERVICES accept it is 
working, but this is here useless for simplyfying.

What is the right syntax or is the mixing of udp and tcp in this manner 
impossible?
Is there a better approach to get the abstraction from a group of 
services into a mixed tcp udp ruleset?


Thanks,
Stefan Hartmann
