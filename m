From: Brent Clark <bclark@eccotours.dyndns.org>
Subject: ROUTE  woes ?
Date: Tue, 23 Aug 2005 20:09:19 +0200
Message-ID: <430B664F.3030006@eccotours.dyndns.org>
References: <4304A259.3070906@eccotours.co.za>
	<20050818154431.GA7489@oasis.frogfoot.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050818154431.GA7489@oasis.frogfoot.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: iptables <netfilter@lists.netfilter.org>


Hi list

I tried at suggestion of:

gate:/usr/src# iptables -t mangle -A FORWARD -p tcp --dport 80 -j ROUTE --oif eth2

But all i get is:
iptables: No chain/target/match by that name

During this time I have been googling and trying to find out why this is failing.

The reason I cant undertand is that I am running debian sarge so therefore the iptables version is v1.3.1

I looked for the module ROUTE and it defiantly if there.

ROUTE target v1.11 options:
     --oif       ifname          Route packet through `ifname' network interface
     --iif       ifname          Change packet's incoming interface to `ifname'
     --gw        ip              Route packet via this gateway `ip'
     --continue                  Route packet and continue traversing the
                                 rules. Not valid with --iif or --tee.
     --tee                       Duplicate packet, route the duplicate,
                                 continue traversing with original packet.
                                 Not valid with --iif or --continue.

So on looking at the kernel src

I worked out that I had not added or  complied in multipath, I have now

gate:/usr/src/linux# cat .config | grep ROUTE
CONFIG_IP_ADVANCED_ROUTER=y
CONFIG_IP_ROUTE_FWMARK=y
CONFIG_IP_ROUTE_MULTIPATH=y
CONFIG_IP_ROUTE_VERBOSE=y

and too this day I still am getting

gate:/usr/src/linux# iptables -t mangle -A FORWARD -p tcp --dport 80 -j ROUTE --oif eth2
iptables: No chain/target/match by that name
gate:/usr/src/linux#

If anyone can help in anyway, I would be most greatful.

Kind Regards, and again thanks in advance.

Brent Clark


