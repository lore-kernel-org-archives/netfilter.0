From: Marc Haber <mh+netfilter@zugschlus.de>
Subject: Re: Iptables and vlan interfaces
Date: Mon, 3 Oct 2005 11:24:35 +0200
Message-ID: <20051003092435.GH27873@torres.l21.ma.zugschlus.de>
References: <20050930112129.19898.qmail@focomunicatii.ro>
	<Pine.LNX.4.61.0509301440560.19019@filer.marasystems.com>
	<20050930125427.28160.qmail@focomunicatii.ro>
	<200509300839.15330.rob0@gmx.co.uk>
	<Pine.LNX.4.61.0509301706580.24680@filer.marasystems.com>
	<4340D42B.2070106@india.tejasnetworks.com>
	<Pine.LNX.4.61.0510031035150.22605@filer.marasystems.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.61.0510031035150.22605@filer.marasystems.com>
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

On Mon, Oct 03, 2005 at 11:16:06AM +0200, Henrik Nordstrom wrote:
> The virtual interfaces created by vconfig is true virtual 
> interfaces and can even have a different MAC address than the physical 
> interface if you like (defaults to use the same MAC however).

Gee, I didn't know that. How is the different MAC address set? Naively
with ip link set dev eth0.101 address <new-mac>? Does this work with
all drivers, will it give a performance impact (such as requiring the
phyiscal interface to run promisc)?

> These 
> virtual interfaces is named like physicalinterface.vlannumber (i.e. 
> eth0.45 for the VLAN with the .1q tag 45 on the eth0 physical connection).

I strongly recommend using ip link set dev old-name name new-name to
rename the interface to something less complicated. Having interfaces
named from usage (like unt0 for untrusted, per0 for perimeter network,
int0 for internal network and so on) brings new sense into the
--in-interface int+ notation of iptables.

Greetings
Marc

-- 
-----------------------------------------------------------------------------
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Mannheim, Germany  |  lose things."    Winona Ryder | Fon: *49 621 72739834
Nordisch by Nature |  How to make an American Quilt | Fax: *49 621 72739835

