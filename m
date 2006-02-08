From: Stephen Beck <becks@marietta.edu>
Subject: help with netmap.
Date: Wed, 8 Feb 2006 08:35:17 -0500 (EST)
Message-ID: <Pine.GSO.4.58.0602080823470.26810@mcnet.marietta.edu>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I have several dorm firewalls with nearly 250 users behind each.
I nat the inside ip's using netmap. this has been up and running for
6 months and for the inside users its working fine. for the most part
I dont want connections orginating from the outside and netmap seems
to be perventing this. However I now have an application that needs to
be able to orginate a stream from the outside to any inside
ip( CopySense ).

ime really not shure:
if netmap alone should block incomming connections ?
how to go about allowing them?

from what i see the folling is a start:
existing netmap lines on one router:

Chain POSTROUTING (policy ACCEPT 6 packets, 300 bytes)
 362 20370 NETMAP     all  --  *      *       10.0.20.0/24
0.0.0.0/0           205.133.141.0/24
   75  4208 NETMAP     all  --  *      *       10.0.21.0/25
0.0.0.0/0           205.133.140.0/25
  223 10925 NETMAP     all  --  *      *       10.0.22.0/25
0.0.0.0/0           205.133.140.128/25

to allow the outside connection for my laptop this works:

Chain PREROUTING (policy ACCEPT 1620 packets, 92093 bytes)
target     prot opt in     out     source
destination
DNAT       all  --  *      *       0.0.0.0/0
205.133.141.42      to:10.0.20.42

ile tighten up that rule once i get it working ;-)

however I neet to allow that rule to work for all 255 ip's
and i cant seem to get the syntax right ???


Stephen Beck, Marietta College, 740-376-4366

