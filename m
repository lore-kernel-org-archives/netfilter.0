From: Del Winiecki <delw@wildapache.net>
Subject: Reverse SNAT routes out wrong interface
Date: 20 Feb 2003 13:34:46 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1045773286.2306.77.camel@thizzy>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Ok, another challenge.

SNAT works fine, but I need the outside WAN address to look as if it
came from an address on the eth1 network, not the Upstream WAN network.
My linux router ports:

eth4 192.168.1.0/24 ------------ (local offices, admin net)

eth1 209.x.x.x/24 -------- (downstream WAN)

WAN1 64.x.x.x/30 ---------  (upstream provider)

all traffic from 192.168.1.0/24 must look like its from 209.x.x.13

traffic flowing into WAN1 with a destination address of 209.x.x.13
somehow needs to get routed out the eth4 interface and "un-natted"
instead of routing out eth1.

I have:
iptables -t nat -A POSTROUTING -o WAN1 -j SNAT --to 209.x.x.13

Is there some way to use DNAT to fool the kernel routing into properly
routing this?

Thanks,
Del W.


