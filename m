From: Ian Pilcher <arequipeno@gmail.com>
Subject: nftables and IPv6 prefix delegation (regression vs ip6tables)
Date: Thu, 3 Nov 2022 14:57:32 -0500
Message-ID: <tk16fd$hd2$1@ciao.gmane.io>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

My plan to migrate from iptables to nftables seems to have hit a major
snag.  nftables seems to lack the ability to use prefix-independent
masks when matching IPv6 addresses.

For example, my ISP delegates a /56 prefix, which I can divide into as
many as 256 separate /64 subnets.  So a routable IPv6 address in my
network can be broken down like this.

   pppp:pppp:pppp:ppNN:hhhh:hhhh:hhhh:hhhh

Where the p's represent the delegated prefix, the N's represent an
internal "network ID", and the h's represent the host address.  The
prefix is relatively stable, but it can change occasionally, so hard-
coding it into firewall rules is not really an option.

Assume that I want to match a particular host (pppp:pppp:pppp:ppc8::1)
in a rule.  With ip6tables, I can match this address with this
expression:

   0:0:0:c8::1/::ff:ffff:ffff:ffff:ffff

I can match the whole /64 subnet with:

   0:0:0:c8::/0:0:0:ff::

(Neither is particularly readable, but they do work.)

I cannot figure out how to accomplish this with nftables.  Any attempt
to use the same sort of expression with the nft command just results in
a syntax error.

Am I missing something, or am I stuck with ip6tables?

-- 
========================================================================
Google                                      Where SkyNet meets Idiocracy
========================================================================

