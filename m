From: Sven-Haegar Koch <haegar@sdinet.de>
Subject: Re: filter on ethernet alias
Date: Fri, 5 Sep 2003 02:52:18 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.56.0309050245370.17909@space.comunit.de>
References: <20030904152250.GA25689@mtholyoke.edu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030904152250.GA25689@mtholyoke.edu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ron Peterson <rpeterso@mtholyoke.edu>
Cc: Netfilter Discussion <netfilter@lists.netfilter.org>

On Thu, 4 Sep 2003, Ron Peterson wrote:

> So I was thinking I could do this by aliasing multiple IP's to a single
> interface, and filter based on the virtual interface.  Can't do this, I
> guess.  Neither can I filter on destination IP, because the box is a
> gateway, not a destination.  Is there any way to filter a packet based
> on which gateway ip address it was sent to, if both addresses are
> assigned to the same interface?

No, there isn't.

And it has a simple reason:
The used IP of the gateway is not transmitted in routed packets.

The client resolves the gateway-address from the routing table via arp to
the mac-address of the gateway-interface, which will be the same for all
virtual interfaces/adresses on this interface.

This mac-address is now stored in the ethernet-header of the ip-packet,
with an ip destination-address behinde the gateway.

A forwarded-via-gateway packet is for the gateway only:
"A packet with my ethernet-address (mac), but not one of my ips"

c'ya
sven

-- 

The Internet treats censorship as a routing problem, and routes around it.
(John Gilmore on http://www.cygnus.com/~gnu/)

