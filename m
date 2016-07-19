From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: netfilter/nftables: chain rule dumps
Date: Tue, 19 Jul 2016 12:28:55 +0200
Message-ID: <20160719102855.GA11848@salvia>
References: <578636F6.70802@toulouse.viveris.com>
 <20160713144036.GA1385@salvia>
 <578DEBF0.2090707@toulouse.viveris.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <578DEBF0.2090707@toulouse.viveris.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jalvarez <jalvarez@toulouse.viveris.com>
Cc: netfilter@vger.kernel.org

On Tue, Jul 19, 2016 at 10:59:28AM +0200, jalvarez wrote:
> I dug into the kernel code yesterday and I have come up with a small patch
> (see below).
> I am a complete newbie in kernel development, please feel free to correct me
> if there is anything I did wrong.
> 
> The kernel builds ok but I didn't tested my changes yet. Have you an idea of
> what the best approach
> should be to test these changes (using User Mode Linux maybe ?) ?

You can mangle one of the existing examples in libnftnl to set the
table and/or chain when listing rules, specifically examples/nft-rule-get.c

You only have to set the table and/or chain attributes.

> Also, I would like to know what is the exact meaning and expected behavior
> of the idx counter in nf_tables_dump_rules().

Every time you call recvmsg(), the dump routine runs and fill a page
with entries, if there are more entries that can fit into the page,
the idx tells us where to follow up from in the next recvmsg()
invocation.

> My current changes might actually break the expected behavior if it was some
> kind of "rule id counter" instead of "iteration counter". If it is possible,
> I would rather not put the continues in the rules loop, as the goal of these
> changes is mostly to avoid looping through the whole ruleset.
> 
> Again, I am very thankful for your help.
> 
> Here is the patch

Just sent a patch to netfilter-devel, I've Cc'ed you. It would be good
if you can test it.

Thanks.
