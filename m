From: Florian Westphal <fw@strlen.de>
Subject: Re: nftables: No prefixes in anonymous sets?
Date: Mon, 2 Dec 2019 21:06:52 +0100
Message-ID: <20191202200652.GT795@breakpoint.cc>
References: <7dd662ab-9d95-dbe9-3cf8-5db33ccb4b1a@plutex.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7dd662ab-9d95-dbe9-3cf8-5db33ccb4b1a@plutex.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan-Philipp Litza <jpl+direct@plutex.de>
Cc: netfilter@vger.kernel.org

Jan-Philipp Litza <jpl+direct@plutex.de> wrote:
> Hi everyone,
> 
> surely not only for me, sets were one of the main reasons to switch from
> iptables to nftables. However, I was very disappointed that anonymous IP
> address sets don't support prefixes (ranges):

They do...

> /etc/nftables.conf:5:20-29: Error: Set member cannot be prefix, missing
> interval flag on declaration
>         ip saddr { 8.8.8.8/32, 1.1.1.1/32 }  drop
                    ^^^^^^^^^^

Which nft and libnftnl versions are this?

This code is taken for non-anon sets.

> Poking around in the source code, I found the relevant line [1] that
> explicitly checks for anonymous sets. Apparently it was added in [2] to
> give the user a better error message that some "BUG".

Note the ! -- this check is done for named sets.

> But couldn't you also simply (or maybe not so simply) "upgrade" the
> anonymous set to an interval-capable set when you encounter a prefix?

Thats what is supposed to happen already.

> Also, why isn't this message triggerd by something like "tcp dport {
> 22-23, 80, 443 }"? Isn't this a range in an anonymous set as well?

Yes, its a range.
