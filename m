From: David TAILLANDIER - DIGI VALUE <david.taillandier@digi-value.fr>
Subject: "raw" table versus "filter" table
Date: Wed, 18 Nov 2015 22:47:02 +0100
Message-ID: <564CF1D6.9000709@digi-value.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


Hi,

according to the well-known netfilter schematic:
http://inai.de/images/nf-packet-flow.png
the "raw" table is processed before the "filter" table.

I tested it with some usual commands without problem:
    iptables --table raw --append PREROUTING --source 1.2.3.4 --jump REJECT
    iptables --table raw --append PREROUTING --in-interface lo --jump ACCEPT

- the packets are handled sooner, without the need to go though
  conntrack+mangle+nat+routing. So less CPU/memory stress (and in turn
  lightly compensated by the fact the iptable_raw module has to be
  loaded ?)
- only one rule in case the box is also a router (won't be ok for
  every rules, obviously) because there is no need to add the same rule
  for filter/forward

The documentations I found always describe the raw table to be used in
strict cases. But none give even the smallest justification.

--> Is there any reasons not to use the raw table, apart dogmatic ones ?

