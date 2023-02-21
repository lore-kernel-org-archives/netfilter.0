From: Adel Belhouane <bugs.a.b@free.fr>
Subject: Re: drop first SYN packet with nftables
Date: Tue, 21 Feb 2023 21:36:44 +0100
Message-ID: <3002d57c-70c6-fba5-7235-3aeb210a8e69@free.fr>
References: <af77a393-3897-c0b4-c0b8-6d6bbb370239@aokgo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <af77a393-3897-c0b4-c0b8-6d6bbb370239@aokgo.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Stewart Nelson <sn@aokgo.com>, netfilter@vger.kernel.org

Le 21/01/2023 à 05:25, Stewart Nelson a écrit :
> How can I drop the first SYN packet received by my server (or the first SYN/ACK packet sent by the server)?
> 
> I have a test VPS set up to capture and analyze malicious traffic directed to non-standard TCP ports, for example attacks on sshd running on a high port. Using BGP, an IPv4 /23 is routed to the VPS. With the nftables rules below, connection attempts to any port 20000-60000 are redirected to sshd.
> 

[...]

> The problem is that I'm only interested in attacks that retransmit an unanswered SYN (the vast majority probe with only one SYN, as scanning all ports on all IPv4 addresses is quite expensive). I've tried various methods, based on conntrack state, packet count and even expiration, all to no avail. I suspect that they are somehow interacting with the redirect.
> 
> For example, adding this to the output chain:
> 
> tcp sport 22 ct expiration > 55 counter drop
> 
> causes all SYN packets to be dropped. Using 'conntrack -E', you can see the expiration timer going down with each subsequent SYN, but when it gets below 55, the packets keep getting dropped.
> 
> Environment: Debian bullseye, kernel 5.10.0, nftables v0.9.8, conntrack v1.4.6.
> 

Tested with nftables 0.9.6 (and kernel 6.0).

> What am I doing wrong? TIA for any suggestions.
> 

AFAIK dropping a packet in NEW state will remove its tentative conntrack entry: Netfilter's conntrack can't be used as memory store for this case.

So I just replaced conntrack by a dynamic set to have a memory to store relevant information. I considered for TCP that SYN <=> state NEW. That's not completely accurate . Eg: settings like nf_conntrack_tcp_loose could matter here, but for simplicity I didn't check SYN anywhere nor did I consider any possible corner case.

* create a set of concatenations similar to conntrack's 5-uple (except it's a 4-uple concatenation since it's always tcp) with a default timeout of 1mn (the expected SYN attempt window for a single flow). If more than 65535 (the set default's size) new connections are expected in 1mn, a size option with a larger value should be supplied.
* everything is handled in nat/preprouting. Since the nat hook only receives packets in state NEW, no need to check for this. Just have a pair of rules to rule out any unrelated flow (not tcp or not in the port range) to attempt to speed up the ruleset.
* first time a packet is received, if it doesn't match the set already, add its properties to the set and drop it: the first SYN is dropped.
* second time a packet is received, it will match the set: update the entry in the set to a 1s timeout (to have the entry quickly expire to limit memory use) and redirect it: the second SYN is accepted.
* this chain won't be used anymore for this flow: once the local system replied, the conntrack entry is not in state NEW anymore, and conntrack will short-circuit any nat hook for further packets belonging to this flow.
* bonus: duplicating sets and rules for IPv4 and IPv6 in an inet family table to have this work for both IPv4 and IPv6.

For debug and troubleshooting. The command:

conntrack -E --reply-port-src 22 

won't see dropped tentative conntrack entries so will display only the 2nd [NEW] entry and further states. Instead adding nftrace set 1 in the ruleset and using "nft monitor trace" would allow to see both SYN packets.

ruleset:

table inet t_dropsyn1        # for idempotence
delete table inet t_dropsyn1 # for idempotence

table inet t_dropsyn1 {
	set s_ip_syn1 {
		typeof ip saddr . ip daddr . tcp sport . tcp dport
		flags dynamic
		timeout 1m
	}
	set s_ip6_syn1 {
		typeof ip6 saddr . ip6 daddr . tcp sport . tcp dport
		flags dynamic
		timeout 1m
	}


	chain c_nat_prerouting {
		type nat hook prerouting priority dstnat - 10; policy accept;
                meta l4proto != tcp return
		tcp dport != 20000-60000 return
		ip saddr . ip daddr . tcp sport . tcp dport != @s_ip_syn1 add @s_ip_syn1 { ip saddr . ip daddr . tcp sport . tcp dport } drop
		ip6 saddr . ip6 daddr . tcp sport . tcp dport != @s_ip6_syn1 add @s_ip6_syn1 { ip6 saddr . ip6 daddr . tcp sport . tcp dport } drop
		update @s_ip_syn1 { ip saddr . ip daddr . tcp sport . tcp dport timeout 1s } redirect to :22
		update @s_ip6_syn1 { ip6 saddr . ip6 daddr . tcp sport . tcp dport timeout 1s } redirect to :22
	}
}


I hope this will help solve your problem.

Regards,
Adel.


