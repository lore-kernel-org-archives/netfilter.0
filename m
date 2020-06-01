From: Rick van Rein <rick@openfortress.nl>
Subject: Expressive limitation: (daddr,dport) <--> (daddr',dport')
Date: Mon, 01 Jun 2020 18:08:21 +0200
Message-ID: <5ED527F5.9010501@openfortress.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=openfortress.nl; 
 i=rick@openfortress.nl; q=dns/txt; s=fame; t=1591027726; 
 h=message-id : date : from : mime-version : to : subject 
 : content-type : content-transfer-encoding : date : from 
 : subject; 
 bh=4Ay9D+ulUsqrGeaQeAvq7Bqr9KT07gUDVT62zgc0Kos=; 
 b=HYURYn3bD+KiN7phF9Ff6mfp/bkYZ9TmX66GqOh/PofapPsOrXzKsp4C
 ZGXYBO16Wj1AmeiG0d5PYQ7XmuMkWq/YGONj4GFaY6FGyPE21K+P9Bvfox
 jci92u+/A60mQpOd/dzjOLhHqJd7MNWp6CwAeLElzMRL1UZOv0WyStjz8=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I seem to be running into an expressive limitation of nft while trying
to do stateless translation.  I prefer statelessness because it has no
direction, and should support of peer-to-peer mechanisms better than
stateful dnat/snat.  I also suspect it is more efficient.

After nat64, I have a small set of IPv6 addresses and I would like to
map their (daddr,dport) or better even (daddr,proto,dport) tuples to
outgoing (daddr',dport').  Effectively, this is port forwarding.

If I specify single rules for single mappings (one direction only for
now) I can see the expected response to the connection attempt:

nft add rule ip6 raw prerouting \
   ip6 daddr $PREFIX::64:75 \
   tcp dport 8080 \
   ip6 daddr set $PREFIX::100:20 \
   tcp dport set 80 \
   notrack

I have problems doing this with the map construct, presumably because it
does not atomically replace (daddr,dport) by (daddr',dport') but instead
does two assignments with intermediate alterede state.  This is bound to
work in many cases, but it can give undesired crossover behaviours
[namely between incoming IPs if they map to the same daddr' while coming
from the same dport]:

nft add rule ip6 raw prerouting \
   ip6 daddr set \
      ip6 daddr . tcp dport \
         map { $PREFIX::64:75 . 8080 : $PREFIX::100:20 } \
   tcp dport set \
      ip6 daddr . tcp dport \
         map { $PREFIX::100:20 . 8080 : 80 } \
   notrack

So now I am wondering,

 0. Is there a way to use maps as atomic setter for (daddr,dport)?
 1. Can I reach back to the original value of a just-modified value?

If this won't work, I can still make separate rules for each of the few
values for daddr, but I wanted to ask just to be sure that this is
something that cannot be expressed by nft.

That aside, I am making the switch, and I am pleased by the logic of
nft; just the syntax takes some getting used to; I've seen ":" between
actions, and wondered if that could be an atomic composer?


Thanks!
 -Rick
