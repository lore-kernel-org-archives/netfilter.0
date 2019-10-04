From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: How can I block all traffic from an IP range, irrespective of
 origin, going to, or coming from, using nftables in Debian 10
Date: Fri, 4 Oct 2019 12:18:04 +0200
Message-ID: <de499a93-2306-a681-6e2a-2c227250f8f3@thelounge.net>
References: <NQw8Zn-Cr6DOqlayaUmuautcCgywjg96aFaMt1t0b-YRpyo0_DvByE3-RTNVC5S80qFIYbSNVGesY3XCvGxrLlYG__BFEBaDJ_XvIa0hREI=@protonmail.com>
 <f9f3c860-5b3f-a09a-ff25-375378c3715b@trustiosity.com>
 <caAb8jKSxb6sL49NLsEuMiqcr87ZCzfsFPLGnHT1VkqjcyKkf-fBozz-gcVljJRRoeyTolYe-Ou2H2P8BrIS7l--UXO18hA-4499YWMajtw=@protonmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <caAb8jKSxb6sL49NLsEuMiqcr87ZCzfsFPLGnHT1VkqjcyKkf-fBozz-gcVljJRRoeyTolYe-Ou2H2P8BrIS7l--UXO18hA-4499YWMajtw=@protonmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jags <TheJags@protonmail.com>, zrm <zrm@trustiosity.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>



Am 04.10.19 um 11:45 schrieb Jags:
> @zrm  thank you so much for the reply.
> 
> 
> (1) Would it be something like this:
> 
> :::::
> chain output {
>                 type filter hook output priority 0; policy accept;
> 
>                 ip daddr 123.0.0.0/8 ct state established,related,new,invalid,untracked counter reject
>     }
> :::::
> 
> Because just last night I tried that, but I could still see IPs from the blocked range. Or am I missing something here.
> 
> Note: In this OUTPUT chain, if I change: "policy accept" to "policy drop", I lose the internet completely.
> 
> 
> (2) In addition to the OUTPUT chain, I've added this into INPUT chain too:
> 
> :::::
> chain input {
>                 type filter hook input priority 0; policy drop;
> 
>                 ip saddr 123.0.0.0/8 ct state established,related,new,invalid,untracked counter drop
>     }
> :::::
> 
> 
> So how should I modify the either or both of the above please... many thanks

it's the same as with iptables

"established,related" allows responses and so when your client made a
connection to a peer data from this peer is allowed back

order matters and there is no point to change the outbound policy to DROP

the policy is applied after all rules  and the first mathcing action
wins, everywhere
