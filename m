From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: Which of these 2 rules will consume more CPU? Please guide.
Date: Thu, 1 Dec 2022 13:07:57 +0100
Message-ID: <f6a726a9-c6ec-bd0d-fc01-dbace18a9c08@thelounge.net>
References: <c8a98a59-7ff1-6a2f-f579-d604848074d3@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <c8a98a59-7ff1-6a2f-f579-d604848074d3@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Amish <anon.amish@gmail.com>, netfilter <netfilter@vger.kernel.org>



Am 01.12.22 um 12:32 schrieb Amish:
> Hello everyone,
> 
> I have a hash:net IP set (with name say inblock) which has 2500 network 
> blocks.
> 
> It is taken from 
> http://rules.emergingthreatspro.com/fwrules/emerging-Block-IPs.txt
> 
> But let us assume that it can go up to 3000-5000 entries in future.
> 
> Now I have following rule right at the top.
> 
> # iptables -t mangle -I PREROUTING 1 -m set --match-set inblock src -j DROP
> 
> This rule will process each and every packet that is coming in and match 
> it against the IP set.
> 
> So if I have a 200mbps line and then at its peak, above rule will go 
> through data equal to 200mbits per second.
> 
> I am curious to know if I change the above line to:
> 
> # iptables -t mangle -I PREROUTING 1 -m conntrack --ctstate NEW,INVALID 
> -m set --match-set inblock src -j DROP

normally you start with ACCEPT "ctstate RELATED,ESTABLISHED" as first 
rule because that hits 99% of all packets and skips any other rules

than you DROP "ctstate INVALID" no matter what

and between that DROP-rules and your ACCEPT-Rules you place additional 
DROP-Rules

No matter INBOUND or PREROUTING

so your "--match-set inblock src -j DROP" can only hit NEW and valid 
packets at all, and since you DROP initial packets from these sources 
they never can hit the ctstate-rules


