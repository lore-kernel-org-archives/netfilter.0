From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: Iptables and vlan interfaces
Date: Mon, 3 Oct 2005 14:46:39 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510031435520.24889@filer.marasystems.com>
References: <20050930112129.19898.qmail@focomunicatii.ro>
	<Pine.LNX.4.61.0509301440560.19019@filer.marasystems.com>
	<20050930125427.28160.qmail@focomunicatii.ro>
	<200509300839.15330.rob0@gmx.co.uk>
	<Pine.LNX.4.61.0509301706580.24680@filer.marasystems.com>
	<4340D42B.2070106@india.tejasnetworks.com>
	<Pine.LNX.4.61.0510031035150.22605@filer.marasystems.com>
	<20051003092435.GH27873@torres.l21.ma.zugschlus.de>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051003092435.GH27873@torres.l21.ma.zugschlus.de>
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
To: Marc Haber <mh+netfilter@zugschlus.de>
Cc: netfilter@lists.netfilter.org

On Mon, 3 Oct 2005, Marc Haber wrote:

> Gee, I didn't know that. How is the different MAC address set? Naively
> with ip link set dev eth0.101 address <new-mac>?

Yes.

> Does this work with all drivers

Nearly all.

> will it give a performance impact (such as requiring the phyiscal 
> interface to run promisc)?

It will most likely make the physical interface run in promiscious mode 
yes.

Some NIC chips support having MAC filters accepting more than one MAC and 
on these it is possible the interface does not go into promiscious mode, 
but most NICs do not have this capability.

But in either case this is rarely a performance impact these days as the 
traffic is heavily filtered by the network switch anyway and very few 
frames is seen on the physical network connection with another destination 
MAC.


While talking on this there is also another very interesting virtual 
network inteface type available for Linux, namely MAC based VLANs. This 
allows you to create multiple virtual network interfaces each with their 
own MAC but sharing the same physical connection. This is not in the 
standard VLAN driver of Linux but available from the same page as vconfig 
mentioned before. Combined with the arp_filter functionality this can 
provide quite interesting solutions to virtual hosting, router redundancy 
etc.

Regards
Henrik

