From: Jamie Cockburn <jcockburn@bloxx.com>
Subject: Iptables: Matching packets leaving a bridged interface
Date: Wed, 25 Jun 2014 08:03:03 +0000
Message-ID: <D1310F2F383A5D4D8D7944C4FB42CFA84CA145@BLX-EX01.alba.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Apologies if you've already seen this over on serverfault or stackoverflow, but it's been on there for several days now, and I've had absolutely no traction...

I'm building a firewall configuration tool based on iptables, and trying to get a "bump in the wire" scenario working.

Given a setup with eth0 and eth1 in a bridge br0 and a third interface eth2.

In this scenario, lets say I want TCP port 80 traffic to be dropped if it is going to the network attached to eth0, but allow it to eth1.

I am therefore trying to reliably match packets that go out over the specific interface eth0.

If I add the following iptables rule in the filter table:

    -A FORWARD -o br0 --physdev-out eth0 -j LOG

Given a packet that originates from eth1 (the other half of the bridge), then the rule matches just fine, logging:

    ... IN=br0 OUT=br0 PHYSIN=eth2 PHYSOUT=eth1 ...

However if the packet origniates from eth2, then the rule no longer matches.

I appears that the routing algorithm can't determine which of the bridged interfaces to choose, so the packet is sent out over both interfaces in the bridge.

If I add another more promiscuous log rule, then I get the following log output for that packet:

    ... IN=eth2 OUT=br0 ...

My guess is that in the first case, the routing algorithm can just choose the other interface on the bridge since that packet shouldn't go out the way it came.  In the second case, it hasn't chosen a specific interface and you then get no physdev information at all!

However, if the bridge has learned the destination MAC address (as shown by `brctl showmacs br0`) then it can determine the correct interface, and you get physdev informatino again.

(There is also a third case: where the bridge comprises three interfaces that this seems to apply to , then it still can't establish a single interface to send the packet on just be excluding the source interface.)

So, the question is, how can I reliably match packets the go out over eth0 regardless?

Given the example I gave at the start, it is not enough to just match packets that will be routed out over multiple interfaces, one of which is eth0 (though that would be useful in other scenarios). I want to be able to treat the traffic for eth0 and eth1 differently, allowing the traffic to eth1, but not eth0.

