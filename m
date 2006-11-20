From: Rodrigo Lazo <rlazo.paz@gmail.com>
Subject: need advice - research project
Date: Sun, 19 Nov 2006 21:39:36 -0500
Message-ID: <8664daaljr.fsf@mash.doux>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter list <netfilter@lists.netfilter.org>

hi everyone,

I need some advice. I'm doing a research project about load balancing
and I want to build an application to test some algorithms. 

Right now all I need to do is:
- pick up all packages arriving to a specific port
- modify their destination MAC address
- send them to their new destination.

I'm trying to build something like this
(http://www.linuxvirtualserver.org/VS-DRouting.html). In this
configuration, all the machines have the same ip address but is set as
an alias to a non-arp interface except for the load-balancer. So when
a packet arrives you only need to modify its MAC to redirect it.

How could I build this app? I was thinking about using libipq and
NF_QUEUE to build it on userspace so I can modify it more easily, but
I'm not sure if this is how it should be done (or even if it is
posible to do it this way). 

Any sugestion will be greatly appreciated

Best regards

-- 

Rodrigo Lazo (rlazo)

