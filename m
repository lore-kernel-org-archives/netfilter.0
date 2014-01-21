From: Andreas Herz <andi@geekosphere.org>
Subject: Re: [ANNOUNCE]: Release of nftables 0.099
Date: Tue, 21 Jan 2014 12:59:09 +0100
Message-ID: <20140121115909.GR5409@kvmbude>
References: <20140120131132.GA32427@macbook.localnet>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140120131132.GA32427@macbook.localnet>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick McHardy <kaber@trash.net>
Cc: netfilter@vger.kernel.org

First of all thanks for the release and ongoing work!

On 20/01/14 at 13:11, Patrick McHardy wrote:
> nftables features native support for sets and dictionaries of arbitrary
> types, support for many different protocols, meta data types, connection
> tracking, NAT, logging, atomic incremental and full ruleset updates,
> a netlink API with notification support, a format grammar, a compatiblity
> layer for iptables/ip6tables and more.

Does the native set support also include sets with timeout, like the
ipset maintained by Jozsef?
Or is there any plan to introduce this feature into nftables or just use
ipset and make it nftables compatible?

Since i'm using a patched version of ipset i would like to know the
future related to that feature :)

Thanks

-- 
Andreas Herz
