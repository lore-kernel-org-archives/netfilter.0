From: Marco Colombo <netfilter@esiway.net>
Subject: Re: Matching on next hop router
Date: Wed, 7 Jul 2004 15:43:15 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0407071524580.3962-100000@Megathlon.ESI>
References: <Pine.LNX.4.44.0406231510050.15672-100000@Megathlon.ESI>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0406231510050.15672-100000@Megathlon.ESI>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Wed, 23 Jun 2004, Marco Colombo wrote:

> I have 2 (potentially N) upstream links, and one single netfilter box
> that handles all the routing from/to them. All routers are connected
> on the same network segment. This implies that all packets leave the
> netfilter box via the same interface (eth1).
> 
> The main routing table holds about 139100 entries at the moment, with
> about 71500 routes via one router (let it be router A) and 67600 routes
> via the other one (router B).
> 
> Is there a way to match packets, in the filter table, based on which
> router they will be routed to? I've googled a bit but wasn't able
> to find a way. Intuitively, matching should be done in the 
> POSTROUTING chain, after the routing decision has been taken.
> I need to match, say, all packets that will be routed via router A.
> (A way to match incoming packets would be nice, too. But I think
> I can match by --mac-source for that).
> 
> TIA,
> .TM.
> 

I got no answer so far, now I wonder if there's an obvious solution
or it's impossible. I'll try and explain it a little more:

    +-----------+                 +-----------+
    | router A  |                 | router B  |
    +-----------+                 +-----------+
          |                             |
(1)       +--------------+--------------+
                         | (eth0)
                   +-----------+
                   | netfilter |
                   +-----------+
                     |   |   |


'netfilter' is a BGP speaker. It routes some prefixes via router A
and others via router B.

So far I've addressed the problem using two interfaces:

    +-----------+                 +-----------+
    | router A  |                 | router B  |
    +-----------+                 +-----------+
          |                             |
(2)       +-----------+     +-----------+
               (eth0) |     | (eth1)
                   +-----------+
                   | netfilter |
                   +-----------+
                     |   |   |


and simply using -o eth0 and -o eth1 in rules, but I'd like to use
one single interface for outgoing packets, not to mention that the
multiple interfaces method doesn't scale well as new routers are
added.

Is there a way to match packets that will be routed via router A
(or router B) on the netfilter box, in case (1) of course? Right
now, this is just for accounting purposes.

TIA,
.TM.
-- 
      ____/  ____/   /
     /      /       /			Marco Colombo
    ___/  ___  /   /		      Technical Manager
   /          /   /			 ESI s.r.l.
 _____/ _____/  _/		       Colombo@ESI.it


