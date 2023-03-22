From: Tim Mooney <Tim.Mooney@ndsu.edu>
Subject: rate-limit ssh for both IPv4 and IPv6
Date: Wed, 22 Mar 2023 13:28:26 -0500 (CDT)
Message-ID: <783937f-4c3b-4520-eb7f-3334ffcdfa0__30928.9479207777$1679510081$gmane$org@ndsu.edu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org


Hi All!

I have a couple of hosts where I need to open SSH to the world.  In the
past, with iptables & ip6tables I've used per-source address rate
limiting, so that no single source address can initiate more than say 8
connections in 2 minutes.  Without some kind of rate-limit guard, certain
attacks can DoS SSH by tying up all of its MaxStartups.

Note that I really need the rate-limiting to be per source address (v4 or
v6), not just rate-limiting in general.

The nftables wiki and other places on the web have lots of good
information for rate-limiting things like icmp & icmpv6, but I've really
struggled to find a working example of rate-limiting new connections
per source address for an IP-based protocol like SSH when I need to handle
both IPv4 and IPv6.

My understanding from the wiki and the docs is that it is not possible
to mix 'type ipv4_addr' and 'type ipv6_addr' in a set, and most of the
(IPv4-only) examples I've found that do rate-limiting use a set and what
I believe is called "continuation" in a long rule.

With my current experience level with nft, it's not clear to me how to
adjust a single rule that handles only IPv4 with a set to do what I need
for both IPv4 and IPv6 connections to ssh.

Since it likely matters for how to solve this, the environment where this
would be used is

 	RHEL 8.x with nftables 0.9.3 (+ Red Hat patches)
 	RHEL 9.x with nftables 1.0.4 (+ Red Hat patches)

When we migrated to nftables, we also switched to having both v4 and v6
rules mixed together on the chains within one "table inet filter".

If there's any other information I can provide that would be useful,
please let me know.  If there actually is a good example of this in the
wiki or elsewhere and I've just missed it, please point me at it.

Thanks,

Tim
-- 
Tim Mooney                                             Tim.Mooney@ndsu.edu
Enterprise Computing & Infrastructure /
Division of Information Technology    /                701-231-1076 (Voice)
North Dakota State University, Fargo, ND 58105-5164
