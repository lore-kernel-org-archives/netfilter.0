From: Patrick McHardy <kaber@trash.net>
Subject: Re: [ANNOUNCE]: Release of nftables 0.099
Date: Tue, 21 Jan 2014 12:14:14 +0000
Message-ID: <20140121121413.GC30577@macbook.localnet>
References: <20140120131132.GA32427@macbook.localnet>
 <20140121115909.GR5409@kvmbude>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140121115909.GR5409@kvmbude>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Herz <andi@geekosphere.org>
Cc: netfilter@vger.kernel.org

On Tue, Jan 21, 2014 at 12:59:09PM +0100, Andreas Herz wrote:
> First of all thanks for the release and ongoing work!
> 
> On 20/01/14 at 13:11, Patrick McHardy wrote:
> > nftables features native support for sets and dictionaries of arbitrary
> > types, support for many different protocols, meta data types, connection
> > tracking, NAT, logging, atomic incremental and full ruleset updates,
> > a netlink API with notification support, a format grammar, a compatiblity
> > layer for iptables/ip6tables and more.
> 
> Does the native set support also include sets with timeout, like the
> ipset maintained by Jozsef?
> Or is there any plan to introduce this feature into nftables or just use
> ipset and make it nftables compatible?
> 
> Since i'm using a patched version of ipset i would like to know the
> future related to that feature :)

Currently we don't support timeouts and also don't support dynamically
adding members to sets, though the last part would be pretty easy to
implement.

Timeouts shouldn't be that hard as well, but I would need to think about
this some more, I'd prefer not to add struct timer_lists everywhere.

I'll intend to work on some set related stuff in the next time, I'll look
into it then.
