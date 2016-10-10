From: James <vger_tracker@trackivity.com>
Subject: "nft add element" can't find table
Date: Mon, 10 Oct 2016 14:21:40 -0400
Message-ID: <d2ecc806-6c37-d1a6-f9a7-3e1668215be3@trackivity.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

This is "nftables/xenial,now 0.5+snapshot20151106-1 amd64" on "Release 16.04.1 LTS (Xenial Xerus) 64-bit", "Kernel Linux 4.4.0-38-generic x86_64".

The (very simple) nft ruleset below has been working well for me.

But now I've tried to add the set "blackhole" and it does make it into the ruleset but attempting to add an element produces:

# nft add element firewall blackhole { 1.2.3.4 timeout 2h }
<cmdline>:1:1-53: Error: Could not process rule: Table 'firewall' does not exist
add element firewall blackhole { 1.2.3.4 timeout 2h }
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
#

I suspect it may be my so-far-successful desire to have only a single "inet" table that is the root of this error.

Or not.  Help?

This is not a crisis, but I would *really* like to keep this single-table approach.  Originally I was trying to have "v4blackhole" and "v6blackhole" sets, and did try breaking the "incoming" chain into separate "ip" and "ip6" tables, I even named the tables and chains all differently but I've never gotten a completely successful result.

# nft list ruleset
table inet firewall {
	set blackhole {
		type ipv4_addr
		timeout 1h
	}

	chain incoming {
		type filter hook input priority 0; policy drop;
		iifname "lo" accept
		ip saddr @blackhole drop
		ip protocol { icmp} icmp type { echo-request} accept
		ip6 nexthdr { ipv6-icmp} icmpv6 type { echo-request} accept
		ip6 nexthdr { ipv6-icmp} icmpv6 type { nd-router-advert, nd-redirect, nd-neighbor-advert, nd-neighbor-solicit} accept
		ct state { established, related} accept
		ct state { new} tcp dport { ssh} accept
		ct state { new} udp dport { domain} accept
		ct state { new} tcp dport { smtp, urd, http, domain, https, pop3s} accept
	}

	chain forwarding {
		type filter hook forward priority 0; policy drop;
	}

	chain outgoing {
		type filter hook output priority 0; policy drop;
		iifname "lo" accept
		ip6 nexthdr { ipv6-icmp} icmpv6 type { echo-request, nd-neighbor-solicit, nd-neighbor-advert} accept
		ct state { established, related, new} accept
	}
}
#

Thanks.

  - James
