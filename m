From: Stephen Satchell <list@satchell.net>
Subject: Need two routers in tandem to implement BGP38?
Date: Tue, 20 Jul 2021 06:23:36 -0700
Message-ID: <5e5eb03c-fca5-6920-c34b-40189dab83cc@satchell.net>
Reply-To: list@satchell.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux Netfilter Users List <netfilter@vger.kernel.org>

Background:  Part of the requirements/suggestions of BGP38 is that you 
block both inbound and outbound traffic with unroutable source 
addresses.  The former to protect one's self, the latter to protect the 
rest of the world.  Also, it appears that rp_filter isn't implemented in 
the kernel for IPv6, but I could be mistaken.  (I'm also not thrilled 
about SEC being "protected".)

Problem: the rp_filter module extension, according to the documentation, 
works only in the raw/PREROUTING or mangle/PREROUTING tables.  Will the 
module also work in, say, mangle/POSTROUTING? That's the first table 
that is fed from both the local output path and the forward path.

Bonus: will it work for IPv6 in both raw/PREROUTING and mangle/POSTROUTING?
