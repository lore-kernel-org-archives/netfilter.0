From: A G <utopian201@hotmail.com>
Subject: netfilter packetflow
Date: Sat, 18 Aug 2012 00:48:46 +1200
Message-ID: <COL124-W20E1581415198E1293F5D484B40@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


Hi
This diagram shows the packetflow
http://upload.wikimedia.org/wikipedia/commons/3/37/Netfilter-packet-flow.svg

1. Does this mean that when I set my computer to bridge mode for example
brctl addbr br0
brctl addif br0 eth1
brctl addif br0 eth2
ip link set br0 up

The packet goes through all of the link layer chains? That is, it will go through nat/PREROUTING (ebtables), raw/PREROUTING (iptables), mangle/PREROUTING (iptables)
Or does it only go through the ebtables (blue coloured) chains in the link layer?

2. If it only goes through the blue chains only, if I want it to go through the iptables chains in the link layer (green coloured), I am required to have a rule with a DROP target to push it up to to the higher network layers, is this correct?

3. In which case, if I have added rules to the mangle/PREROUTING (iptables) chain, am I adding it to the network layer mangle/PREROUTING box in the diagram, or in the link layer mangle/PREROUTING box in the diagram?

Currently I'm learning how it all fits together, thanks
Andrew
 		 	   		  