From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: Routing problem
Date: Fri, 13 Feb 2004 11:53:05 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1076691184.2064.28.camel@ca.gts.nexusmgmt.com>
References: <002c01c3f247$9d3ee350$1530a8c0@HUSH>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002c01c3f247$9d3ee350$1530a8c0@HUSH>
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
To: Carlos Fernandez Sanz <cfs-netfilter@nisupu.com>
Cc: netfilter <netfilter@lists.netfilter.org>

On Fri, 2004-02-13 at 10:39, Carlos Fernandez Sanz wrote:
> I have a small problem setting up a routing exception here.
>  
> We have a small LAN with NAT-based internet access. Nothing special
> here. 
> The router is a Linux box, with two NICs. One of them has a private
> address. The other one has a WAN address (it's a requirement of our
> provider that we use this address even if we have public addresses). 
>  
> Anyway, one of our users needs to go out using a public IP, and NAT
> doesn't do, because he needs to establish a connection encrypted where
> the IP address is part of a signature.
>  
> We do have spare IPs. The problem is that I can't add a route to him,
> route returns "network is unreachable".
>  
> Suppose NIC A in the linux box (route) is 192.168.21.1. NIC B is our
> public IP 1 (of a pool of five) A.B.C.1. Everyone gets out using this
> IP and NAT.
> Now I want someone in the LAN to own the public IP A.B.C.2, however he
> is connected to the internal switch. 
> I tried to do this
>  
> route add A.B.C.2 gw A.B.C.2 dev eth0 
>  
> But I get "network unreachable".
>  
> Before you ask: I can't connect this special computer to the same
> place I connect the linux box (which would be the obvious solution)
> because the carrier expects traffic to come from one WAN IP, owned by
> the linux box. 
>  
> All suggestions welcome.

Hmmm . . . what type of encryption are you doing? I assume it is not
IPSec as that should work with a one-to-one NAT.

I have never tried to use iptables in a bridging rather than routing
scenario.  I do not know if it would be possible to set up the user's
computer on a separate network that speaks to a third interface on the
gateway as a bridged rather than routed network.

If it is not the act of NAT itself that breaks the packet but rather
having a different IP header address than the IP address embedded in
layer 7, I wonder if you could do something as outrageous as a double
NAT.  In other words, the user lives on their own network with the
A.B.C.2 address.  They are connected to the internal network through a
NAT gateway which translates A.B.C.2 into 192.168.21.2 (or whatever
fixed address you want).  The Internet gateway then NATs 192.168.21.2
into A.B.C.2.

As you can probably tell, I haven't thought through any of these ideas. 
They may be entirely foolhardy but just thought I'd throw out some quick
outside-the-box (every pun intended) thoughts.  Good luck - John
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net 


