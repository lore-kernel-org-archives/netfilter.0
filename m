From: David Lang <dlang@digitalinsight.com>
Subject: is this possible (multiple sources, replies go to proper source)
Date: Thu, 13 Jul 2006 14:10:30 -0700 (PDT)
Message-ID: <Pine.LNX.4.63.0607131407320.15362@qynat.qvtvafvgr.pbz>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I'm resending this as I haven't seen an answer in the last 5 days (hopefully it 
just slipped through the cracks)


In trying to figure out a LVS configuration to load balance firewallsI have 
gotten stuck with one problem.

the scenerio below is drasticly simplified, I can go into more detail if people 
think it would help.

inbound traffic to a box can arrive through either box B or box C (depending on 
factors outside this problem) with the same source IP in the packet.

B   C
  \ /
   A
   |
   D

box A routes the traffic on to box D

box D replies to the connection (sending the packets to box A)

box A needs to figure out which box (B or C) the connection came through in the 
first place and use that as the gateway for the reply packets.

for other reasons doing NAT on boxes B and C is not a useable option (things on 
D _really_ want to be able to see the real source IP, or as close to it as they 
can)

the nearest thing I can think of to a solution would be for box A to remember 
the MAC address that started the connection and then use it as the gateway for 
reply packets that are part of that connections. I don't know how to do this 
(or even if it's possible)

David Lang

