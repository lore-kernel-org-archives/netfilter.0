From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Nftables / ipset / multiple tables
Date: Tue, 13 Dec 2016 20:39:34 +0100
Message-ID: <20161213193934.GA2881@salvia>
References: <CABAu8hMnZd84Ya-17aK9ERfqp-7TbfuhfWnDz5dydML0Jhdb0A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CABAu8hMnZd84Ya-17aK9ERfqp-7TbfuhfWnDz5dydML0Jhdb0A@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Morgan <morganm.qc@gmail.com>
Cc: netfilter@vger.kernel.org

On Mon, Dec 12, 2016 at 08:39:47PM -0800, Mark Morgan wrote:
[...]
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

I'd suggest you use a variable definition, eg.

# cat nftables.conf
include "./nftables.foobar"

table ip filter {
        set country_block {
                type ipv4_addr
                elements = $country_block
        }
}
# cat nftables.foobar
define country_block = { 1.2.3.4, \
                         4.3.2.1 }

Thus you maintain a single file with the address list.
