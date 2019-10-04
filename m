From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: How can I block all traffic from an IP range, irrespective of
 origin, going to, or coming from, using nftables in Debian 10
Date: Fri, 4 Oct 2019 13:05:45 +0200
Message-ID: <4348ae9d-ac32-2a25-f188-ba1757e03271@thelounge.net>
References: <NQw8Zn-Cr6DOqlayaUmuautcCgywjg96aFaMt1t0b-YRpyo0_DvByE3-RTNVC5S80qFIYbSNVGesY3XCvGxrLlYG__BFEBaDJ_XvIa0hREI=@protonmail.com>
 <f9f3c860-5b3f-a09a-ff25-375378c3715b@trustiosity.com>
 <caAb8jKSxb6sL49NLsEuMiqcr87ZCzfsFPLGnHT1VkqjcyKkf-fBozz-gcVljJRRoeyTolYe-Ou2H2P8BrIS7l--UXO18hA-4499YWMajtw=@protonmail.com>
 <de499a93-2306-a681-6e2a-2c227250f8f3@thelounge.net>
 <lqTerZeIk1-StNEHFttel8WGdgNfa6b5P96z7iC6sT03SK29Q1_hc4KUlqd3R4f8Hdka3B_MJfQILp1Wa65JpA_cW7k2XGZtvfaN5ADlBzY=@protonmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <lqTerZeIk1-StNEHFttel8WGdgNfa6b5P96z7iC6sT03SK29Q1_hc4KUlqd3R4f8Hdka3B_MJfQILp1Wa65JpA_cW7k2XGZtvfaN5ADlBzY=@protonmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jags <TheJags@protonmail.com>
Cc: zrm <zrm@trustiosity.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>



Am 04.10.19 um 12:44 schrieb Jags:
> Should I modify it to the following:
> 
> :::
> chain output {
>                 type filter hook output priority 0; policy accept;
> 
>                 ip daddr 123.0.0.0/8 counter reject  }
> :::
> 
> and
> 
> :::
> chain input {
>                 type filter hook input priority 0; policy drop;
> 
>                 ip saddr 123.0.0.0/8 counter drop  }
> :::

surely, and that on top of the ruleset before any accept-rule, there is
no point to mention "ct state" when you just want to block communication
from and to a ip unconditionally



