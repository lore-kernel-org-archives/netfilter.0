From: "Daniel Wittenberg" <daniel-wittenberg@starken.com>
Subject: NAT stops working
Date: Wed, 20 Apr 2005 09:50:20 -0500
Message-ID: <1114008620.28578.7.camel@plasma.starken.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

We've got a high-speed wireless and DSL connection so I decided to try
and load-balance the out-going connections.  I run a little script that
does:

route flush scope global
route flush cache
route add default scope global equalize nexthop via <external gw 1> dev
eth0 weight 1 nexthop via <external gw 2> dev eth1

This appears to work for awhile, then incoming connections stop getting
nat'd to their internal addresses.  I reboot or reset the firewall
(flush all the tables and re-run this script) and things are good again
for awhile.  I tried flooding some of the external IP's that are nat'd
and it seems like after a certain amount of traffic the nat just stops
working.  tcpdump shows traffic on the external interface coming in, but
not going out anywhere.

Anyone have ideas on how to debug this further or things to check?

Thanks,
Dan


