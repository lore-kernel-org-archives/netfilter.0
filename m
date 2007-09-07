From: "Grant Taylor" <gtaylor@riverviewtech.net>
Subject: Re: 3 ethernet card package transfer
Date: Fri, 7 Sep 2007 02:09:51 -0500 (CDT)
Message-ID: <1122.64.195.3.2.1189148991.squirrel@webmail.riverviewtech.net>
References: <200709062308.12951.comp.ogz@gmail.com>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200709062308.12951.comp.ogz@gmail.com>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

> In my machine i have 3 ethernet cards: eth0, eth1 and eth2
>
> eth0 had 192.168.1.20, eth1 192.168.1.1 and eth2 had 10.0.0.1 ip. eth1
> and eth2 are connection to pcs that have the gateway information of
> those ips.  What i was trying was to send a package using eth1 to eth2,
> so i was sending tcp packagex using hping2 from the pc that has the
> gateway of 192.168.1.1 (pc1, 192.168.1.2) to the other pc that has the
> gateway of 10.0.0.1 (pc2, 10.0.0.2). Every ethernet card was plugged to
> the same switch, also pc1 and pc2. What my expectation was to see a
> traffic at eth1 and eth2 after the iptables rules here:
> http://rafb.net/p/8bLvVP45.html and after adding iptables -I FORWARD 1
> -s 192.168.1.2 -d 10.0.0.2 -j ACCEPT

That is not going to work out quite like you hope.

> But i saw a traffic at eth0 and eth2.

*nod*

> First, how can i fix it with iptables configuration?

I don't know if IPTables can fix this or not.

Well, before you go trying to fix it you had probably better know why
your system is doing this.  Namely most unicies will use the first
interface in a subnet to send traffic to said subnet.  Thus your system
is using eth0 rather than eth1.  Granted there are some tricks that can
get around this if you start looking in to ARP issues and their resolutions
for load balancing / high avaliability solutions.  Heck, I think there are
even some /proc options to control how this happens.

> When change 192.168.1.1 ip to 172.16.0.1 and configure the pc1 according
> to that gateway i saw only traffic at eth1 and eth2, so it seems the
> problem was beeing in the same network.

This is as I would expect.

> If i change eth1 to 192.168.1.1, eth2 to 192.168.2.1 and eth0 to
> 192.168.3.1 will it work again, which will fix being on a different
> network?

You don't necissarily need the systems to be on a different network.  You
just need to look at a different solution.  Namely bridging.

Do you really need to have both 192.168.1.20 and 192.168.1.1 IP addresses
or are you using one of them just so that you can have the second interface
on the same subnet?  If the later is the case, bridge eth0 and eth1 together
and put one or both of the 192.168.1.x addresses on the bridge interface.
This will allow your system to communicate how ever it needs to by IP.
Lower layer (2) bridging will choose the correct interface, be it eth0 or
eth1 depending on the destination direction that packets leave the system.

> And my last question at the 172.16. example, that is when the packages
> are being transfered from eth1 to eth2, a routing is done internally. Is
> that done automatically, or how can the the machine decide when it gets
> a package from eth1 and sees the destination ip and say ok i should send
> to the eth2?

I think the routing code decides the closest subnet to the destination
subnet and send the traffic out that way.  If there are multiple interfaces
on the target subnet I think the system chooses the lowest interface or
the first interface it finds in the routing table(s).



Grant. . . .


