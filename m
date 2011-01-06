From: "Ethy H. Brito" <ethy.brito@inexo.com.br>
Subject: shaping vlans
Date: Thu, 6 Jan 2011 15:13:57 -0200
Message-ID: <20110106151357.3d03c1c2@pulsar.inexo.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


Hi all

(is this the correct list to ask the questions bellow? if not, pointers are
welcome.)

question: if I shape the traffic (using "tc {qdisc,class,filter} add
dev ...") through some ethX that has some 802.1q vlans attached to it, the
vlans traffic will be also shaped or I will have to attach one qdisc to
each vlan??

asking the same thing wiht other words: does the disciplines shape the
traffic downstream, immediately before the packets are delivered to the
wire?

Regards

Ethy
