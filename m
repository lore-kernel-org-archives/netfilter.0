From: "Christoph Pleger" <Christoph.Pleger@cs.tu-dortmund.de>
Subject: Re: Chain priorities for NAT
Date: Thu, 2 Feb 2017 13:52:18 +0100
Message-ID: <0d585498cb83fc8b2b03855bf58a5a28.squirrel@postweb.cs.tu-dortmund.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

On 2017-01-11, I wrote:

> The Wiki on https://wiki.nftables.org mentions two priorities
specifically available for NAT, -100 and 100. But of these two, the
wiki's example for NAT only uses the value 100 for the postrouting
chain. The prerouting chain has priority 0, and there is no difference
between SNAT and DNAT.
>
> When I look at the ipv4-nat example which is shipped together with my
nftables package, both chains use priority -150, though due to the Wiki,
that value is used for mangling.
>
> And when I look at some online-exmaples, they use 0 for prerouting and
postrouting.
>
> So, what are really the best values to use for priority in snat
prerouting and postrouting and dnat prerouting and postrouting?

Does "No answer in three weeks" mean that nobody here knows how to use
these priority values for NAT chains? Though probably netfilter developers
are reading this list?

Regards
  Christoph



