From: Philip Craig <philipc@snapgear.com>
Subject: Re: Routing from private to bridge
Date: Mon, 24 Oct 2005 18:09:06 +1000
Message-ID: <435C96A2.3090807@snapgear.com>
References: <43598481.8040306@internode.on.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43598481.8040306@internode.on.net>
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
To: Tom Gaudasinski <cetus@internode.on.net>
Cc: netfilter@lists.netfilter.org

On 10/22/2005 10:14 AM, Tom Gaudasinski wrote:
> Kernel IP routing table
> Destination     Gateway         Genmask         Flags Metric Ref    Use 
> Iface
> 120.40.60.192  0.0.0.0         255.255.255.248 U     0      0        0 br0
> 192.168.1.0     0.0.0.0         255.255.255.0   U     0      0        0 eth2
> 0.0.0.0         120.40.60.193  0.0.0.0         UG    0      0        0 br0
> 
> How can i get the private LAN users to route to the publically bridged 
> subnet?

What is the routing table on the public machines?
What NAT rules do you normally use?

It may be that the private machines and firewall are fine, but the routing
is wrong on the public machines.  If they simply have the default gateway
of 120.40.60.193, then they will be sending reply packets for private
addresses to the DSL modem, which is wrong.

Although these packets go via the firewall, their ethernet destination will
be the DSL router, so the firewall will bridge them rather than route.

You have two options:

- add a route on the public machines to use the firewall as the
gateway for the private addresses

- make sure the NAT rule on the firewall always NATs the private
addresses, even for connections to the public machines.

