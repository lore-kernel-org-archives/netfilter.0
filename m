From: "=?ISO-8859-2?Q?Karel_=D8e=F8icha?=" <karel@maxtel.cz>
Subject: mark as hashkey in tc filter
Date: Thu, 9 Oct 2008 15:41:52 +0200
Message-ID: <5b19ed110810090641y5d768763q2d55cace9ee2b3d8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello list,

is it possible to use mark value as hashkey when hashing tc filters ?
So the command of creating hashing filter would for example looked
like:

tc filter add dev eth1 protocol ip parent 1:0 prio 5 u32 ht 800::
match ip src 0.0.0.0/0 hashkey mark link 2:

We have shaping and natting router with marking packets in iptables in
2-level B-trees and selecting classes by marks in tc filters, but load
is still quite high (thousands of customers, five priority subclasses
in each customer class), so we would like to lower down load by
implementing hashing filters. But current status of hashkey based only
on IP address (looks like by using different offsets after "at"
keyword any part of packet header can be used, but it is still useless
for us) is not usable for us because of NAT.

We cant use tc filters only because we need some capabilities of
iptables. And splitting QOS and NAT into two different servers would
not help much, because each customer can have multiple IP addresses
(so would have to duplicate filter rules in different hash positions).

I have found few people with same problem on google, but no solution yet.

Karel Rericha
