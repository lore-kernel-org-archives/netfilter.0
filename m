From: Florian Westphal <fw@strlen.de>
Subject: Re: converting iptables/ip6tables to efficient nftables rules
Date: Mon, 31 Jul 2023 14:57:39 +0200
Message-ID: <20230731125739.GC7056@breakpoint.cc>
References: <924b35f-bda5-6ae5-efe-d05a8de7aec@ndsu.edu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <924b35f-bda5-6ae5-efe-d05a8de7aec@ndsu.edu>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Mooney <Tim.Mooney@ndsu.edu>
Cc: netfilter@vger.kernel.org

Tim Mooney <Tim.Mooney@ndsu.edu> wrote:
> I haven't been able to find anywhere in the nftables wiki that talks
> about "Dos and Don'ts" from an efficiency perspective, especially for
> people that may be coming from iptables/ip6tables to nftables.  If it's
> there and I've missed it, please point me at it.
> 
> I have a mix of 32 iptables and ip6tables rules on a RHEL 7 box that I
> want to convert to nftables for RHEL 9 (kernel 5.14.0 + Red Hat vendor
> sauce, nftables 1.0.4).
> 
> The obvious thing to do would be to just directly translate each rule to
> nftables, and have 32 nftables rules.
> 
> However, the iptables rules are all pairs of
> 
> 	-A ports_allow -p tcp -m tcp -s X.Y.0.0/16 --dport 80 -j ACCEPT
> 	-A ports_allow -p tcp -m tcp -s X.Y.0.0/16 --dport 443 -j ACCEPT
> 
> 	-A ports_allow -p tcp -m tcp -s A.B.C.D/32 --dport 80 -j ACCEPT
> 	-A ports_allow -p tcp -m tcp -s A.B.C.D/32 --dport 443 -j ACCEPT
> 
> So I could cut the number of ntables rules in half just by using
> 
> 	dport { 80, 443 }
> 
> in the translated rule.

For the record, nft -o suggest to merge into one rule:

nft -o -f example
Merging:
Y:3:3-68:               ip saddr 10.2.0.0/16 tcp dport 80 counter packets 0 bytes 0 accept
Y:4:3-69:               ip saddr 10.2.0.0/16 tcp dport 443 counter packets 0 bytes 0 accept
Y:5:3-68:               ip saddr 10.20.30.40 tcp dport 80 counter packets 0 bytes 0 accept
Y:6:3-69:               ip saddr 10.20.30.40 tcp dport 443 counter packets 0 bytes 0 accept
into:

ip saddr . tcp dport { 10.2.0.0/16 . 80, 10.2.0.0/16 . 443, 10.20.30.40 . 80, 10.20.30.40 . 443 } counter accept

depending on the number of elements you might want to use
a named set for this, so you can add/remove to it later.
