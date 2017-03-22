From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: (discussion) Why are "flow tables" syntactically unique?
Date: Wed, 22 Mar 2017 17:25:57 +0100
Message-ID: <20170322162557.GA23457@salvia>
References: <99833e6a-90f8-4b53-276b-51e6c221a55c@pobox.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <99833e6a-90f8-4b53-276b-51e6c221a55c@pobox.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert White <rwhite@pobox.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Sat, Mar 18, 2017 at 12:59:18AM +0000, Robert White wrote:
> So this doesn't rate a bug, but it did confuse me.
> 
> Flow tables are always named, but they don't conform to the way sets, maps,
> and dictionaries work in terms of "add" and "delete" and all that.
> 
> They are also "flow tables" instead of one word like "flows" or "throttle"
> or something.
> 
> It seems weird to just have these break the syntactic expectations.
> 
> I think, long-term, that picking a one word designator like "rate" or
> "gauge" and making them syntactically similar to sets with a type and flags
> at the table level, and using @name syntax or having them be unnamed in
> place, would make much more sense.
> 
> It's especially confusing since "list map tablename mapname" and "list flow
> table tablename flowname" are so similar in function but have a different
> word count and are not orthogonal to add and delete and clear etc.
> 
> So if they were just like sets this would be so much less confusing.
> 
> table ip example {
>   gauge dhcp_throttle {
>     type ipv4_addr . inet_service
>     flags whatever, whateverelse
>   }

This would provide a way to restore flow table between reboots, so we
could even per populate them with elements.

>   chain dhcp_traffic {
>     gauge { ip saddr limit over 200/day } drop
>     gauge @dhcp_throttle { ip saddr . udp dport limit 3/second } accept

This would resolve the inconsistency, yes.

I would still stick to 'flow table' instead of 'gauge'. I was never
comfortable with the fact that we overload 'table' with more semantics
(given we already have tables in nf_tables).

Let me think, it would be good to add an entry to netfilter's
bugzilla, so we don't lose track of this.
