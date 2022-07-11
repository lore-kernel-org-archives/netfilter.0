From: Florian Westphal <fw@strlen.de>
Subject: Re: nf_queue flush on deletion
Date: Mon, 11 Jul 2022 21:52:33 +0200
Message-ID: <20220711195233.GA11099@breakpoint.cc>
References: <CA+=Uk6bgPJtcF3XDtraF0vHL8EmY+hqAwXhmzqka5HwDL_jnBg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CA+=Uk6bgPJtcF3XDtraF0vHL8EmY+hqAwXhmzqka5HwDL_jnBg@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jordan Griege <jgriege@cloudflare.com>
Cc: netfilter@vger.kernel.org

Jordan Griege <jgriege@cloudflare.com> wrote:
> I am looking for a way to run a userspace firewall and came across
> nf_queue.  The library documentation and examples were easy enough to
> follow, but I found some unexpected behavior when setting up a
> proof-of-concept.  Say I have the following nftables configuration
> loaded:
> 
> table ip test-queue {
>   chain prerouting {
>     type filter hook prerouting priority filter; policy accept;
>     queue num 0 bypass
>   }
> }
> table ip unrelated {
>   chain input {
>     type filter hook input priority mangle; policy accept;
>   }
> }
> 
> and a program running that reads packets from queue 0.  If at any
> point I run a command that deletes a base chain, e.g.
> 
> nft delete table ip unrelated
> 
> Then all the packets in queue 0 are dropped.  When the program sends a
> verdict for any packets it had received before the queue was flushed,
> the nf_queue system responds with an ENOENT message (wrapped in a
> header with NLMSG_ERROR) through the netlink socket.
> 
> This appears to be the intended behavior by what I could make of the
> kernel code.  Is that correct, and if so, what is the motivation?

Sorry for late reply.  While packet is out, the list of active hooks
leaves RCU protection, so, when reinject happens we need to re-fetch the
list.  The alternative to just dropping is to possibly queue the packet
again (when hooks were inserted before reinjection position), or skip
existing hooks (in case ofhook deletion).

> Would it be possible to develop a patch that determines queue 0 should
> be unaffected by that chain deletion and preserves the queue contents?
>  Has such a change been attempted before?  Or is there some other
> workaround for this behavior?

This was the old behaviour, but this made it necessary to do acquire a
reference count on the base hooks to prevent their removal while packets
the packet is queued.

If the only problem is the ENOENT, then i'd suggest to remove the
hook drop and store (u32)nf_hook_entries_head(net, pf, state->hook)
at nf_queue() time, then re-check that at nf_reinject() time.

Another option would be to store a 'u32 genid' struct netns_nf, store
that at nf_queue time, revalidate at nf_reinject and increment it instead
of dropping queued packets at hook deletion time.
