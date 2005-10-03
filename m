From: Marc Haber <mh+netfilter@zugschlus.de>
Subject: Re: Iptables and vlan interfaces
Date: Mon, 3 Oct 2005 10:59:02 +0200
Message-ID: <20051003085902.GG27873@torres.l21.ma.zugschlus.de>
References: <20050930112129.19898.qmail@focomunicatii.ro>
	<Pine.LNX.4.61.0509301440560.19019@filer.marasystems.com>
	<20050930125427.28160.qmail@focomunicatii.ro>
	<200509300839.15330.rob0@gmx.co.uk>
	<Pine.LNX.4.61.0509301706580.24680@filer.marasystems.com>
	<4340D42B.2070106@india.tejasnetworks.com>
	<20051003074444.GA27873@torres.l21.ma.zugschlus.de>
	<4340F1EF.3010000@india.tejasnetworks.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <4340F1EF.3010000@india.tejasnetworks.com>
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
To: netfilter@lists.netfilter.org

On Mon, Oct 03, 2005 at 02:25:11PM +0530, Aseem Rastogi wrote:
> i understand vlans. but how is a vlan network interface different from a 
> normal eth interface as far as higher layer protocols are concerned?

It isn't. Looks like a normal ethernet interface.

> also, if somebody can give me an example of ifconfig output for vlan 
> interface, that will be helpful.

ifconfig output is nearly never helpful when a network setup on Linux
is non-trivial. ip output is much better.

2: eth0: <BROADCAST,MULTICAST,UP> mtu 1500 qdisc pfifo_fast qlen 1000
    link/ether 00:0f:20:d0:07:e0 brd ff:ff:ff:ff:ff:ff
    inet 10.2.100.94/27 brd 10.2.100.95 scope global dotqa
    inet6 fe80::20f:20ff:fed0:7e0/64 scope link
       valid_lft forever preferred_lft forever

That's a physical interface

13: eth0.101: <BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue
    link/ether 00:0f:20:d0:07:e0 brd ff:ff:ff:ff:ff:ff
    inet 10.1.2.1/24 brd 10.1.2.255 scope global int101:02018
    inet6 fe80::20f:20ff:fed0:7e0/64 scope link
       valid_lft forever preferred_lft forever

And that's an interface "connected" to a VLAN.

You can see the relation between a VLAN interface, the VLAN ID and the
physical interface by looking at /proc/net/vlan/config:

eth0.101      | 101  | eth0

I would like to recommend renaming interfaces (using ip link set dev
old_name name new_name) to reflect their actual usage.

Greetings
Marc

-- 
-----------------------------------------------------------------------------
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Mannheim, Germany  |  lose things."    Winona Ryder | Fon: *49 621 72739834
Nordisch by Nature |  How to make an American Quilt | Fax: *49 621 72739835

