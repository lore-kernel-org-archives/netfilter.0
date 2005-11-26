From: "Michael L. Stokes" <stokes@aris.net>
Subject: Robbing public IP addresses
Date: Fri, 25 Nov 2005 18:08:55 -0600
Message-ID: <4387A797.1090503@aris.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Netfilterists,

I've got a problem I suspect you can help me with.

THE SETUP:
I have created a tunnel between a server at home (Sam) and a server 
co-located with an ISP (we'll call him HO).  My ISP buddy has given me a 
/30 CDIR of public IP addresses that he is routing down the tunnel 
towards Sam.  Sam has the two public IP addresses .13 and .14 defined 
using dummy interfaces on eth1.  The tunnel has the addresses 10.8.0.1 
on HO's side, and 10.8.0.2 on Sam's side of the tunnel.  Sam's function 
in life is two fold:  provide web and email services for the public IP 
side, and act as a general surfing machine in my office for all other 
traffic.

THE PROBLEM:
I want to route outgoing public IP traffic on Sam through the tunnel, 
and all other traffic through Sam's default route (Sam is actually 
behind a WRT54G router with a private IP address.  The WRT54G is 
providing NAT services on the 192.168.0.0/24 side, but is also DMZing 
Sam on the router's public IP which is dynamically assigned, not that 
you need to know that).  The problem is that I have no way (through 
standard routing, that is) to know how to route public IP traffic back 
through the tunnel since I have no way to differential traffic that came 
through the tunnel with traffic that didn't come through the tunnel.  I 
don't think that DNAT and SNAT alone can solve this problem, at least 
for SMTP services ( I can make it work for http).  I do have access to 
the root passwd on HO.

I haven't looked at conntrack, but I was hoping that connection tracking 
might offer a solution here, i.e., if an SMTP request, for example, 
comes into SAM using one of his public IP.s, how do I make Sam route the 
return requests back through the tunnel instead of the default route?  I 
welcome all ideas!!

Please cc to stokes@aris.net as I'm not a subscriber.

Thanks
Mike


