From: Ahvenniemi Mikko <mikko.ahvenniemi@aalto.fi>
Subject: Possible to ebtables MAC DNAT all packets after iptables mangle
 FORWARD?
Date: Wed, 3 Aug 2011 11:26:20 +0000
Message-ID: <85976E1BF236ED42B4A4BBFD3F44FCB04D62E816@EXMDB01.org.aalto.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: fi-FI
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

My setup is as follows:
I have a mirror port on a switch to where all traffic is mirrored. Now i have to route this traffic to multiple analysis machines without altering the IP layer contents of those packets. This is to preserve the original IP addresses and other information that might be needed to properly analyse those packets.

Originally I had hoped to achieve this with a router machine with one NIC. My plan was to broute the packets so they would be handled by iptables code, mark those packets in mangle FORWARD table, and then use these markings to decide in ebtables nat OUTPUT table where those packets would be routed. However this only work for link layer packets and protocols such as ARP. IP packets do not traverse the ebtables nat OUTPUT table.

My second approach was to use two NICs. I would make a bridge between those and then bridged packets would traverse the iptables mangle FORWARD table, where I would mark them, and then do the MAC dnat in ebtables nat POSTROUTING table. However only snat is possible in POSTROUTING.

My only option seems to be to use the bridging setup and then do the dnat in ebtables nat PREROUTING table. However, then i'm not able to use iptables more advanced connection tracking and other features to mark the packets I want routed to specific analysis machines.

Is there any way to either force the dnat rule in POSTROUTING or force all packest to go through the ebtables nat OUTPUT table after brouting them, or can you suggests some other solution?

Any feedback or suggestions are much appreciated, thanks!