From: Mike Williams <mike@v6.gaima.co.uk>
Subject: NAT to one net, bridge to another
Date: Fri, 8 Sep 2006 12:50:29 +0100
Message-ID: <200609081250.32329.mike@v6.gaima.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hey,

Sometime in the next couple months we're going to be replacing a large part of 
our infrastructure to increase the already excellent reliability (dual nics 
and psus everywhere, etc).
I'm just speccing up some kit for quote, and I'm slightly undecided as to the 
best things I can do with the firewalls.

At the moment I'm looking at NATting stuff to 3 different zones (private 
networks), and hopefully bridging to a 4th zone.
It'll have 10 nics, all paired off into round-robin bonds, so 5 usuable 
interfaces. 1 colo facing, 3 private, 1 "public".

Can you DNAT packets to IPs X, and Y, Z assigned to a bridge, while bridging 
those IPs not assigned to it?
(There is probably going to be a small amount of firewalling on the bridged 
IPs)

Thanks

-- 
Mike Williams

