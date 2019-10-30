From: Florian Westphal <fw@strlen.de>
Subject: Re: IPv6 nft vs ip6tables - Local incompatibility ?
Date: Wed, 30 Oct 2019 18:18:49 +0100
Message-ID: <20191030171849.GG876@breakpoint.cc>
References: <f696024b-d134-3470-ff70-27d7e00df9cd@tootai.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f696024b-d134-3470-ff70-27d7e00df9cd@tootai.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Huhardeaux <tech@tootai.net>
Cc: netfilter@vger.kernel.org

Daniel Huhardeaux <tech@tootai.net> wrote:
> Hello,
> 
> I use nftables in a network where stations are under Ubuntu 18 or Debian
> 9/10.
> 
> IPv6 networks are:
> 2a01:YYY:ZZZ:10::9000/128
> 2a01:YYY:ZZZ:10::/64
> 
> ICMP rules on 2a01:YYY:ZZZ:10::4
> 
> chain output {
> 		type filter hook output priority 0; policy drop;
> 		oif "lo" accept
> 		oif "lan" meta l4proto ipv6-icmp counter packets 0 bytes 0 accept
> 		oif "lan" ct state established,related,new counter packets 0 bytes 0
> accept
> 	}
> 
> Pinging ipv6 addresses external to the network is working fine.
> 
> Pinging a local machine, doesn't matter in which lan, I get "ping sendmsg:
> operation not permitted".
> 
> If I change policy to accept, I get
> From 2a01:YYY:ZZZ:10::4 icmp_seq=1 Destination unreachable: Address
> unreachable
> 
> If I switch to ip6tables
> 
>  96 10892 ACCEPT     icmpv6    lan   *       ::/0 2a01:729:16e:10::4
>     6  1008 ACCEPT     icmpv6    lan   *       ::/0 ::/0
> ipv6-icmptype 134 HL match HL == 255
>    31  2232 ACCEPT     icmpv6    lan   *       ::/0 ::/0
> ipv6-icmptype 135 HL match HL == 255
>    39  2496 ACCEPT     icmpv6    lan   *       ::/0 ::/0
> ipv6-icmptype 136 HL match HL == 255
>     0     0 ACCEPT     icmpv6    lan   *       ::/0 ::/0
> ipv6-icmptype 137 HL match HL == 255
> 
> I can ping machines from both lan.
> 
> Any clue ?

It looks like nft ruleset tests output, whereas ip6tables checks
input...
