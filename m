From: "Christoph Pleger" <Christoph.Pleger@cs.tu-dortmund.de>
Subject: Chain priorities for NAT
Date: Wed, 11 Jan 2017 17:25:27 +0100
Message-ID: <7c7a3675f33b1e4768f751e6fd2864eb.squirrel@postweb.cs.tu-dortmund.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I am just doing my first steps with the nftables program, reading the
documentation and entering some of the commands mentioned there. After
reading something about NAT rules, I am now quite confused about the
priorities that can be given when creating chains:

The Wiki on https://wiki.nftables.org mentions two priorities specifically
available for NAT, -100 and 100. But of these two, the wiki's example for
NAT only uses the value 100 for the postrouting chain. The prerouting
chain has priority 0, and there is no difference between SNAT and DNAT.

When I look at the ipv4-nat example which is shipped together with my
nftables package, both chains use priority -150, though due to the Wiki,
that value is used for mangling.

And when I look at some online-exmaples, they use 0 for prerouting and
postrouting.

So, what are really the best values to use for priority in snat prerouting
and postrouting and dnat prerouting and postrouting?

Kind regards
  Christoph

