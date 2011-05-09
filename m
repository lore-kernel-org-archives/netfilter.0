From: Ed W <lists@wildgooses.com>
Subject: High accuracy bandwidth accounting?
Date: Mon, 09 May 2011 15:12:02 +0100
Message-ID: <4DC7F632.9020105@wildgooses.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Netfilter <netfilter@vger.kernel.org>

Hi, I have a slightly peculiar requirement to track very accurate *per
user* traffic for a small remote userbase.  The internet connections
these users have available will be one or more of: a) circuit switched
satellite phone (ie per second billing), data volume billed (ie GPRS
style) satellite phone or a 3G cell phone - all of these will have non
trivial bandwidth costs and we want to attribute very exact costs back
on a per user basis.

To do this I'm using a small custom built embedded router, and we will
use some form of 802.11x or captive portal style user authentication but
I have two areas I need advice on solving:

1) Best way to do per user traffic accounting *per* internet gateway. ie
each gateway will have quite radically different costs to run and so we
need to also count traffic per route.  My current thinking is to use
packet marking to choose the route and my tests suggest that I can
pickup this mark via conntrack and therefore account using ulogd/pmacct
or similar?  Anyone got any thoughts on other ways to slice this or
anything I am missing?

2) How to account for traffic passing through a "proxy".  eg I want to
run a local DNS resolver, but try to match the external DNS traffic back
to the user that caused it? I think I could probably modify the code of
a suitable resolver to apply a packet mark to upstream data, but I
wasn't able to find how to apply "marks" from userspace applications
from a quick google - can someone point me to a reference?  Does anyone
have any other ideas on how I might do this?  I will also use a couple
of other proxies for http (probably Squid) and email traffic - will need
to apply a similar solution there (perhaps TPROXY with squid?)


Thanks for any ideas.

Ed W
