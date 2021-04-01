From: Florian Westphal <fw@strlen.de>
Subject: Re: Re: nft show counter
Date: Thu, 1 Apr 2021 20:14:14 +0200
Message-ID: <20210401181414.GF13699@breakpoint.cc>
References: <trinity-08431e16-b4eb-4bb7-8b36-df2084481611-1617212862528@3c-app-gmx-bap62>
 <20210331214053.GB13699@breakpoint.cc>
 <d5770849-515b-5514-39ab-bb6907023ca2@fhmtech.com>
 <trinity-e144cb32-0c89-44a6-b0f6-5b9edcf5e457-1617264512699@3c-app-gmx-bap06>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <trinity-e144cb32-0c89-44a6-b0f6-5b9edcf5e457-1617264512699@3c-app-gmx-bap06>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Frank Myhr <fmyhr@fhmtech.com>, Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org

Frank Wunderlich <frank-w@public-files.de> wrote:
> my rules-file looks like this now (just for anybody wants do do similar):
> 
> table ip filter {
>     ...
>     chain FORWARD {
>         type filter hook forward priority 0; policy drop;
>         #...
>         ip saddr $ipvoipbox udp dport 5160 counter name voip1 comment "counting packets for SIP1"
>         ip daddr $ipvoipbox udp dport 5160 counter name voip1 comment "counting packets for SIP1"
>         ip saddr $ipvoipbox udp sport 5161 counter name voip2 comment "counting packets for SIP2"
>         ip daddr $ipvoipbox udp dport 5161 counter name voip2 comment "counting packets for SIP2"
>         #...
>     }

For two counters it makes no difference but note that you can combine
named counters with maps:

map voipcounters {
 type ipv4_addr . inet_service : counter
 elements = { 10.0.1.1 . 5160 : "voip1", 10.2.1.1 . 5161 : ...

and then count with one rule only:

counter name ip saddr . udp dport map @voipcounters

> one thing:
> 
> # nft list counter filter voip2
> table ip mangle {
> }
> table ip nat {
> }
> table ip filter {
> 	counter voip2 {
> 		packets 124 bytes 7440
> 	}
> }

Can't repro so looks like this is already fixed.

> tables mangle and nat should not be printed (still have them separately from converting iptables to nft)...in json-format it is right

Yes, they should not be printed.
