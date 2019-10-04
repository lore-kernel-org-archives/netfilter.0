From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: How can I block all traffic from an IP range, irrespective of
 origin, going to, or coming from, using nftables in Debian 10
Date: Fri, 4 Oct 2019 15:06:17 +0200
Message-ID: <31342b0f-d6a7-15e7-3d02-212d41eaeaad@thelounge.net>
References: <NQw8Zn-Cr6DOqlayaUmuautcCgywjg96aFaMt1t0b-YRpyo0_DvByE3-RTNVC5S80qFIYbSNVGesY3XCvGxrLlYG__BFEBaDJ_XvIa0hREI=@protonmail.com>
 <f9f3c860-5b3f-a09a-ff25-375378c3715b@trustiosity.com>
 <caAb8jKSxb6sL49NLsEuMiqcr87ZCzfsFPLGnHT1VkqjcyKkf-fBozz-gcVljJRRoeyTolYe-Ou2H2P8BrIS7l--UXO18hA-4499YWMajtw=@protonmail.com>
 <de499a93-2306-a681-6e2a-2c227250f8f3@thelounge.net>
 <lqTerZeIk1-StNEHFttel8WGdgNfa6b5P96z7iC6sT03SK29Q1_hc4KUlqd3R4f8Hdka3B_MJfQILp1Wa65JpA_cW7k2XGZtvfaN5ADlBzY=@protonmail.com>
 <4348ae9d-ac32-2a25-f188-ba1757e03271@thelounge.net>
 <vxVQ_geC0de-PtRw-_W5p_JxT_glE2c_vRrkTcbIyulovhi-WTjSDhII4UsugyF1dViXu9mwHZisBtvv98qmciBLttLUpfrRGFL2HG6AyNE=@protonmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <vxVQ_geC0de-PtRw-_W5p_JxT_glE2c_vRrkTcbIyulovhi-WTjSDhII4UsugyF1dViXu9mwHZisBtvv98qmciBLttLUpfrRGFL2HG6AyNE=@protonmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jags <TheJags@protonmail.com>
Cc: zrm <zrm@trustiosity.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>



Am 04.10.19 um 14:21 schrieb :
> Thank you so much.
> 
> Now do I need to have OUTPUT chain before INPUT chain? 'Coz all the examples I've seen so far had INPUT as the first chain.

shouldn't matter at all because a packet can only be output or input and
not both

>                 # Early drop of invalid connections
>                 ct state invalid drop
>                 ct state established,related accept

switch both of them! you have far more packets from legit traffic than
invalid ones and hence "established,related" should always be the first
rule in any stateful filter with exceptions like the topic

not sure about nftables but with iptables i would just place the drop
stuff for 123.0.0.0/8 in -t raw PREROUTING because it's before conntrack
and consider place it in a ipset for the case the list becomes longer
becasue then you have only one rule and a lightning fast hash-lookup no
matter how much entries

> Side question: Does order of the chains or tables matter... like on other PC, I have "table inet nat" with chains "prerouting/postrouting".
> 
> 
> Here's my complete nftables.conf:
> 
> 
> xxxxx
> #!/usr/sbin/nft -f
> 
> flush ruleset
> 
> table inet filter {
>         chain input {
>                 type filter hook input priority 0; policy drop;
> 
>                 iifname lo accept
> 
> --->            ip saddr 123.0.0.0/8 counter drop
> 
>                 # Early drop of invalid connections
>                 ct state invalid drop
>                 ct state established,related accept
> 
>                 # ICMP & IGMP
>                 ip saddr 192.168.0.0/16 icmp type echo-request counter accept
>                 icmp type echo-request counter drop
>                 ip protocol igmp drop
> 
>                 # ssh for internal network
>                 ip saddr 192.168.0.0/16 tcp dport 22 counter accept
> 
>                 # Avoid brute force on ssh
>                 tcp dport 22 ct state new limit rate 10/minute accept
> 
>                 # VsFTPD
>                 ip saddr 192.168.0.0/16 tcp dport 20 counter accept
>                 ip saddr 192.168.0.0/16 tcp dport 21 counter accept
>                 ip saddr 192.168.0.0/16 tcp dport 990 counter accept
>                 ip saddr 192.168.0.0/16 tcp dport 40000-50000 counter accept
> 
>                 ct state new drop
>                 # Everything else
>                 drop
> 
>                 log flags all counter drop
>                 log prefix "[nftables] Input Denied: " flags all counter drop
>     }
>         chain output {
>                 type filter hook output priority 0; policy accept;
> 
> --->            ip daddr 123.0.0.0/8 counter reject
>     }
> }

