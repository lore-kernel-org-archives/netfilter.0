From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Writing nftables extension / modifying packets via nftables and
 netfilter
Date: Fri, 8 Apr 2016 14:10:42 +0200
Message-ID: <20160408121042.GA7121@salvia>
References: <CADe663unBJZxLKgvbHh7rhZGOjmrYo8O_n4os8Boex0VcwBSvw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CADe663unBJZxLKgvbHh7rhZGOjmrYo8O_n4os8Boex0VcwBSvw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephan Arndt <arndt.stephan@gmail.com>
Cc: netfilter@vger.kernel.org

On Fri, Apr 08, 2016 at 01:04:47PM +0200, Stephan Arndt wrote:
> Hello!
> 
> I've originally written this to the netfilter-devel list, but got no
> reply, so I thought I might've asked in the wrong place?
> 
> I would like to write a netfilter module to modify packets going in
> and out of my machine (TCP/IP headers, maybe content) after some
> analysis of the packet. For this, I wanted to extend nftables with new
> matches or targets that control this modification behavior. I've
> looked around some, but couldn't find documentation on how to do this
> properly using nftables, can someone point me in the right direction?

There are not matches and targets in nft, instead from kernelspace we
have expressions. These expressions are basically instructions of our
network-specific VM and the generic set infrastructure. You can place
several expressions in one rule, each of it is evaluated linearly.

> Using a netfilter/iptables combo, this kind of extension seems to be
> pretty well documented (e.g. at the HOWTO page for netfilter hacking
> [1]). I could also go this route, but as nftables seems to be poised
> to succeed iptables, I wanted to try my hands at using the
> future-proof technology.

We have a shift in the way of thinking with nft, as we have a
network-specific VM, we try to make it expressive enough to catch all
possible scenario that the user wants, aiming to extend this is a
generic way which opposes to the many combo matches/targets that
proliferated in the iptables era.

So the question is, in case you need some extension, what kind of
generic expression we could introduce so you can build what you need
following a lego-like thinking, plugging expressions one after
another.

Anyway, several people already asked for a nftables hacking howto and
I already started writing on this, it's on my large pile of work, but
I promise to release when ready.
