From: Robert White <rwhite@pobox.com>
Subject: Re: NFT NAT rule did not take action on the incoming traffics.
Date: Thu, 30 Mar 2017 20:35:28 +0000
Message-ID: <e4d09f19-4eb1-4914-fc55-95c7195694ce@pobox.com>
References: <CAFXGftKVb0Sv=r3yGQhV=u-Nj7JnsrUH=CdZw3Kw-g2oNP_Cfg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAFXGftKVb0Sv=r3yGQhV=u-Nj7JnsrUH=CdZw3Kw-g2oNP_Cfg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sun Paul <paulrbk@gmail.com>, netfilter@vger.kernel.org

On 03/30/17 03:01, Sun Paul wrote:
> # nft list table nat -a
> table ip nat {
> chain PRE {
> type nat hook prerouting priority 0; policy accept;
> sctp dport diameter ip saddr 192.168.0.13 ip daddr 192.168.0.25
> counter packets 4 bytes 336 dnat 10.165.249.15 # handle 9
> sctp dport diameter ip saddr 192.168.1.13 ip daddr 192.168.1.25
> counter packets 0 bytes 0 dnat 10.165.250.15 # handle 10
> }

You are clearly not receiving any traffic that matches the second rule.
Id fire up Wireshark and look at the incoming packets. There's a good
chance that the hosts on the 192.168.1.0/24 segment are not configured
to use the right address.

If this is a parallel network fallback thing there may simply be zero
traffic that matches the rule. So clearly 192.168.0.25 and 192.168.1.25
are the same machine; if 192.168.0.13 and 192.168.1.13 are two addresses
on a single machine it may simply not be using the second address. The
"diameter" software may simply use the 192.168.0.13 address on the
assumption that a router will take care of matching it all up.

That is, traffic from saddr 192.168.1.13 might still be using
192.168.0.25 as the daddr because the application isn't noticing any
sort of failover.

So you should add a subsequent rules to catch mis-matches and plain old
not included packets.

One of the dangerous temptations in writing a ruleset is the temptation
to lock things down too tightly. Using an saddr term in a dnat rule is
not usually a good thing as mixing correctness of flow and security
policy tends to lead to mistakes. I would remove the saddr part
completely from the prerouting rules and then put the policy checks in
the forwarding chain or leave it to the applications themselves if
diameter uses strong credentials.

For (untested) example...

table ip example {
	set sensitive_services {
		type inet_service
		elements = { http, diameter }
	}

	chain forwarding {
		# hooks and other rules
		sctp dport @sensitive_services jump gatekeeper
		tcp dport @sensitive_services jump gatekeeper
	}

	chain gatekeeper {
		# disposition allowed accesses
		sctp dport diameter \
		  ip saddr { 192.168.0.13, 192.168.1.13} \
		  accept
		tcp dport http \
		  ip saddr { 192.168.0.14 } \
		  return
		# discard the rest
		drop
	}
}


Keeping policy (accept/reject/drop) and plumbing (dnat/snat) separate
will save you a lot of future pain.

--Rob.
