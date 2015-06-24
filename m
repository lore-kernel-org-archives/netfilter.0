From: Andreas Herz <andi@geekosphere.org>
Subject: Question about packet processing in iptables/netfilter
Date: Wed, 24 Jun 2015 14:51:59 +0200
Message-ID: <20150624125159.GN21348@kvmbude>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

i'm trying to understand the packet processing in iptables/netfilter in
regard to sequential and parallel processing.

I know the packet flow from raw -> mangle -> nat -> filter etc. as shown
in the graph:

https://en.wikipedia.org/wiki/File:Netfilter-packet-flow.svg

What i want to know is the processing of successive packets. Are they
processed packet after packet sequentially or in parallel (on a normal
intel nic without special multiqueue support)?

Let's take an example with an scan from one source 1.0.0.1 to X
destinations 2.0.0.1-2.0.0.100. 

Does the first packet A (1.0.0.1 - 2.0.0.1) have to go through every
matching rule before the second packet B (1.0.0.1 - 2.0.0.2) gets
analysed?
Or does netfilter analyse B already while A is going through the
ruleset?
And is it possible that B (or any other following packet) overhauls A?
Or is it limited to the tables like mangle, nat, filter, so A goes
through mangle and as soon as A enters nat B enters mangle and waits
until A went through nat table to enter itself?

The reason is that with a rather huge ruleset i get some conditions that
it looks like parallel processing or at least the way witht he dedicated
tables.

A ruleset might look like:

a) iptables -t mangle -m set --match-set test src -j DROP
[...]
z) iptables -t filter -m foobar -j SET --add-set test src

Is it possible that packet B already got to the rule a) and skip the
drop while packet A did not reach the rule z) although it would have
matched and thus B should have been dropped?
This wouldn't be possible if B waits for A to finish it processing but
this would be rather bad in terms of perfomance although it would
prevent the "race condition".

Thanks so far :)

-- 
Andreas Herz
