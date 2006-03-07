From: "Martijn Lievaart" <m@rtij.nl>
Subject: Re: Routing via multiple active PPP devices
Date: Tue, 7 Mar 2006 17:43:35 +0100 (CET)
Message-ID: <14164.217.166.60.19.1141749815.squirrel@ma.rtij.nl>
References: <440BE618.4000604@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <440BE618.4000604@gmx.de>
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
To: andre.bender@gmx.de
Cc: netfilter@lists.netfilter.org

Andre Bender zei:
> Hi,
>
> for a mobile application we are using multiple internet connections
> (mostly ppp) to achive a high aviability. Normaly there are at least two
>  open connections (e.g. eth0 and ppp0). Assuming the default route is
> set  correct for use with eth0.
>
> The software I'm writing is opening various sockets and binding them to
> the devices. Sending via eth0 is working flawlesly but sending via ppp0
> does not send at all.

....

> My Question is: How do to setup route/iptables so a packet sent via a
> socket bound to eth0 is sent via eth0 and a packet sent on ppp0 is sent
> there?
> I guess it has something to do with source routing but I couldn't figure
>  out from the examples found on the net.

I wasn't aware that one could bind a socket to an interface. I think you
mean that you bind the socket to the same address as the interface is
bound to.

Sending packets works as follows:
- A local address is assigned if one wasn't assigned yet (in your case you
did assign an address)
- The packet is routed based on the destination address and the routing
table.

So sending to 192.168.202.1/32 will use ppp0, all other packets will use
eth0.

More importantly, what do you want to achieve? It's not completely clear
from your description.

HTH,
M4





