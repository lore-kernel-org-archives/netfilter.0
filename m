From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables wiki
Date: Thu, 28 Dec 2017 11:31:54 +0100
Message-ID: <20171228103154.4qu3hzf5ptkw5gb4@salvia>
References: <CANSGRxRCziVkWq2JXOmR3atDZOhzciNLFM3LK6UP_H_2NFLymQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CANSGRxRCziVkWq2JXOmR3atDZOhzciNLFM3LK6UP_H_2NFLymQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: paulo bruck <paulobruck1@gmail.com>
Cc: netfilter@vger.kernel.org

Hi Paulo,

On Wed, Dec 27, 2017 at 04:25:56PM -0200, paulo bruck wrote:
> Hy Guys. Me again 80)
> 
> I'm  studing nftables I think it would be  better IMHO to do a cut and
> paste at link below that talks about   Sets

I can create an account for you, so you can edit this yourself.

Let me know and I'll send you the token privately.

Thanks.

> before
> ############################################
> Named sets
> 
> You can create the named sets with the following command:
> 
> % nft add set filter blackhole { type ipv4_addr\;}
> 
> Note that blackhole is the name of the set in this case. The type
> option indicates the data type that this  set stores, which is an IPv4
> address in this case. Current maximum name length is 16 characters.
> 
> % nft add element filter blackhole { 192.168.3.4 }
> % nft add element filter blackhole { 192.168.1.4, 192.168.1.5 }
> 
> Then, you can use it from the rule:
> 
> % nft add rule ip input ip saddr @blackhole drop
> 
> Named sets can be updated anytime, so you can add and delete element from them.
> 
> Eric Leblond in his Why you will love nftables article shows a very
> simple example to compare iptables with nftables:
> 
> ip6tables -A INPUT -p tcp -m multiport --dports 23,80,443 -j ACCEPT
> ip6tables -A INPUT -p icmpv6 --icmpv6-type neighbor-solicitation -j ACCEPT
> ip6tables -A INPUT -p icmpv6 --icmpv6-type echo-request -j ACCEPT
> ip6tables -A INPUT -p icmpv6 --icmpv6-type router-advertisement -j ACCEPT
> ip6tables -A INPUT -p icmpv6 --icmpv6-type neighbor-advertisement -j ACCEPT
> 
> Which can be expressed in nftables with a couple of rules that provide a set:
> 
> % nft add rule ip6 filter input tcp dport {telnet, http, https} accept
> % nft add rule ip6 filter input icmpv6 type { nd-neighbor-solicit,
> echo-request, nd-router-advert, nd-neighbor-advert } accept
> ####################################################
> 
> after
> 
> ######################################################
> Eric Leblond in his Why you will love nftables article shows a very
> simple example to compare iptables with nftables:
> 
> ip6tables -A INPUT -p tcp -m multiport --dports 23,80,443 -j ACCEPT
> ip6tables -A INPUT -p icmpv6 --icmpv6-type neighbor-solicitation -j ACCEPT
> ip6tables -A INPUT -p icmpv6 --icmpv6-type echo-request -j ACCEPT
> ip6tables -A INPUT -p icmpv6 --icmpv6-type router-advertisement -j ACCEPT
> ip6tables -A INPUT -p icmpv6 --icmpv6-type neighbor-advertisement -j ACCEPT
> 
> Which can be expressed in nftables with a couple of rules that provide a set:
> 
> % nft add rule ip6 filter input tcp dport {telnet, http, https} accept
> % nft add rule ip6 filter input icmpv6 type { nd-neighbor-solicit,
> echo-request, nd-router-advert, nd-neighbor-advert } accept
> 
> 
> Named sets
> 
> You can create the named sets with the following command:
> 
> % nft add set filter blackhole { type ipv4_addr\;}
> 
> Note that blackhole is the name of the set in this case. The type
> option indicates the data type that this set stores, which is an IPv4
> address in this case. Current maximum name length is 16 characters.
> 
> % nft add element filter blackhole { 192.168.3.4 }
> % nft add element filter blackhole { 192.168.1.4, 192.168.1.5 }
> 
> Then, you can use it from the rule:
> 
> % nft add rule ip input ip saddr @blackhole drop
> 
> Named sets can be updated anytime, so you can add and delete element from them.
> 
> #############################################################
> 
> best regards
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
