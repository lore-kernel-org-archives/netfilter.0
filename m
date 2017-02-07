From: Robert White <rwhite@pobox.com>
Subject: How does "inet" interact with "ip" and "ip6" in terms of policy and
 compatibility?
Date: Tue, 7 Feb 2017 09:28:05 +0000
Message-ID: <e8d6d191-5535-7cbc-7a1e-20974f38815e@pobox.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

In particular if there is the same priority on a filter hook for a 
chain, does inet run before or after the address family specific chains?

So if the policy of ip6 input is accept and ip input is drop, what 
should I do with inet?

---

meanwhile, if I use an ipv4 compatibility address on an IPV6 address 
family socket, q.v. [::FFFF:192.168.14.3], will it go through the ip or 
ip6 chains?

One of my services does use that multi-mode.

I'm _assuming_ (from observing the SSH implementation) that these 
compatibility addresses go through the ip/inet not ip6/inet tables and 
only get up-converted to IPv6 as the presentation layer.

...

This all comes up because the list of services that I want to filter is 
_almost_ the same for my IPv6 and IPv4 faces on a single box. (Comcast 
provides both address families and I'm working on a transition, but I 
can't go all the way because of gaming. 8-)

In particular I want the "drop" policy on my IPv4 stack, but I want to 
be sure that both ip and inet chains are considered.

The combo table is super useful but I cant find any unambiguous material 
on these two
