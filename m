From: Leon Merten Lohse <leon@green-side.de>
Subject: Re: Nftables / ipset / multiple tables
Date: Tue, 13 Dec 2016 08:31:24 +0100
Message-ID: <bf72b6bd87626813b2a1cdb13c013465@mail.lhcode.de>
References: <CABAu8hMnZd84Ya-17aK9ERfqp-7TbfuhfWnDz5dydML0Jhdb0A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CABAu8hMnZd84Ya-17aK9ERfqp-7TbfuhfWnDz5dydML0Jhdb0A@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: Mark Morgan <morganm.qc@gmail.com>

--repost to list--

As far as I know, named sets are only visible in the current table.

The way I do it is that I create the named set in the table I need it 
and populate it in an included file.
Translated to your example it would look like this:

# nftables.conf
table inet filter {
set country_block { /* set_type ie `type ipv4_addr' */ }
/* more stuff in here */
}
@include "nftables.foobar"


# nftables.foobar
add element inet filter country_block {
/* set elements here */
}


The real downside of this is that it does not allow to access this set 
from another table.
For example, I have a mac based blacklist where port 80 is redirected to 
a portal page.
Normally I would have to know the blocked macs in 3 tables, because I 
want the filter table to be inet but I also need nat chains for the 
dnats, which are not allowed in inet tables. I solved this by marking 
the packets very early in prerouting in the inet table and checking for 
the mark in the nat chains of the ip and ipv6 nat chains.
tl;dr: Currently it is not always feasible to translate old ipset 
approaches to nftables 1 to 1.

Best
Leon

On 2016-12-13 05:39, Mark Morgan wrote:
> I am trying to convert from iptables to nftables. So far I really like
> the way nftables is structured, it will allow me to cleanup my
> iptables settings and I expect it to be much more manageable over the
> long term.
> 
> However, I'm encountering an issue trying to translate an
> iptables/ipset feature into nftables in a sane way.
> 
> Today I use ipsets, which I can maintain separate from my iptable
> firewall rules. This is a nice convenience - I can add blacklists,
> manage CIDR block sets, etc, all in an efficient package (ipset),
> without having to restart my entire firewall rule set.
> 
> As best I can tell, nftables does not support external ipset,
> presumably because it has its own internal version. It would be great
> if it could support external ipset, then I could have the best of both
> worlds.
> 
> For now, I converted some of my ipsets to nftables format. The problem
> I'm having is that while there is an "include" directive which allows
> me to separate out my ipsets into manageable separate files, there is
> no mechanism I can see to actually reference these sets. Example:
> 
> # nftables.conf
> @include "nftables.foobar"
> table inet filter { /* stuff in here */ }
> 
> # nftables.foobar
> table ip foobar { set country_block { /*blah blah*/ } }
> 
> Now I want to reference "set country_block" from my inet filters. I
> can't find any documentation on how to reference a set in another
> table. The "@country_block" reference seems to be scoped to only the
> current table, with no way I can find to have it reference a set in
> another table. I really do not want to store all of my ip sets in a
> single large file/table. That would be worse than what I have today
> with iptables.
> 
> Am I missing an feature that perhaps isn't documented that would make
> this all work, or is there a forth coming feature that might make this
> possible to do in the future?
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
