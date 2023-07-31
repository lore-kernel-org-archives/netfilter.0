From: Florian Westphal <fw@strlen.de>
Subject: Re: Nftables + ALG + Linux =?utf-8?B?Ni4x?=
 =?utf-8?B?LjAtMTAtYW1kNjQg4oCmPy4uLg==?= is it a kown Problem?
Date: Mon, 31 Jul 2023 15:36:08 +0200
Message-ID: <20230731133608.GA21425@breakpoint.cc>
References: <51c40f7943609435e914c4f1fd43a98e6c579b83.camel@mail>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <51c40f7943609435e914c4f1fd43a98e6c579b83.camel@mail>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: toml <toml@thlu.de>
Cc: netfilter@vger.kernel.org

toml <toml@thlu.de> wrote:
> After updating my server from Bullseye to Bookworm I noticed that my
> NFT rules seem to be causing problems lately. Upon closer inspection,
> the running process came to a virtual halt with a kernel-panic-message
> in the journal.

Please report this panic message.

> # ls /proc/sys/net/netfilter/net.netfilter.nf_conntrack_helper
>     ls: File not found
> 
> I cannot enable the conntrack-helper with '1'.

This workaround was removed.

You need to assign the helper to use in your nftables ruleset.

ct helper ftp-standard {
    type "ftp" protocol tcp
}

And then, from a prerouting chain:

tcp dport 21 ct helper set "ftp-standard"

You might need to do this from output too if you need
this to work from the machine itself as well.
