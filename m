From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: Accessing physical subnets with same address range via a
	single gateway
Date: Fri, 12 Nov 2004 07:34:12 -0500
Message-ID: <1100262852.2024.2.camel@localhost>
References: <1C888AFC989D0E45BA0417091408E23199E897@saturne.volubill.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1C888AFC989D0E45BA0417091408E23199E897@saturne.volubill.com>
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
To: CARRY Gilles <gilles.carry@volubill.com>
Cc: Netfilter users list <netfilter@lists.netfilter.org>

On Fri, 2004-11-12 at 05:04, CARRY Gilles wrote:
> Hi,
> 
>  
> 
> I need to access several equipments through a single gateway. These
> equipments have the same address range (172.16.32.0/24) which cannot be
> modified.
> 
>  
> 
> Here is a diagram worth a thousand words:
> 
>  
> 
>                      gateway
> 
> (general network:GN) - eth0
> 
>                        eth1  ---- (equipments A: subnet= 172.16.32.0/24)
> 
>                        eth2  ---- (equipments B: subnet= 172.16.32.0/24)
> 
>                        eth3  ---- (equipments C: subnet= 172.16.32.0/24)
> 
>  
> 
> My idea is to NAT all these subnets from the general network. Equipment
> A would be accessible from GN using its nonNATed subnets (172.16.32.x
> ...) Equipment B would be accessible from GN using NATed adrresses
> (172.20.32.x-> 172.16.32.x)
> 
> Equipment C would be accessible from GN using NATed adrresses
> (172.24.32.x-> 172.16.32.x)
> 
>  
> 
> So I need to NAT each whole subnet toward a specific interface.
> 
> The problem here is twofold: routing and NATing to physical subnets that
> have the same address range and attached to a single machine.
> 
>  
> 
> Before trying with several equipments, I tried to setup a single subnet
> with only one server acting as equipment B having the range:
> 172.16.32.0/24.
> 
> On the gateway:
> 
>       ifconfig eth2 172.16.32.100/24 up
> 
>       ifconfig eth2:1 172.20.32.100/24 up
> 
>  
> 
> On the B equipment:
> 
>       Ifconfig eth0 172.16.32.10/24 up
> 
>  
> 
> So I get this:
> 
>                      gateway
> 
> (general network:GN) - eth0
> 
>                        eth2   (172.16.32.100) ---- (equipment B=
> 172.16.32.10)
> 
>                        eth2:1 (172.20.32.100)
> 
>  
> 
> ping 172.16.32.10 works.
> 
> ping 172.20.32.10 does not work (as expected!)
> 
>  
> 
> Now I tried to setup NAT on the gateway:
> 
> iptables -t nat -A POSTROUTING -d 172.20.32.0/24 -j NETMAP --to
> 172.16.32.0/24
> 
>  
> 
> I expected that pinging 172.20.32.10 from the gateway would route the
> packets to eth1:1, NETMAP them as 172.16.32.10 and send them on the
> wire. Unfortunately it does not work. A tcpdump from equipment B says
> that 172.16.32.100 is broadcasting arp request: "who has 172.20.32.10?",
> meaning that the POSTROUTING NAT didn't work.
> 
>  
> 
> Any clue?
> 
>  
> 
> Since I'm not a netfilter expert I'm begging for help.
> 
> I don't know if my solution correct or I'm doing something wrong.
> 
> May be this is not feasible with a single gateway?
> 
> May be I should use a combination with the ROUTE target?
<snip>
I have never created a Linux bridge before so this is not my area of
expertise on this platform however, I would think you want to set those
three interfaces to bridge rather than route.  This way, they are one
network and the broadcasts including the ARP requests will pass between
them.  Failing that, see if the Linux implementation of proxy-ARP will
help you here.  Those are my ideas as a network engineer but, as I said,
I've never done it on Linux.  Hopefully someone else can fill in the
details.  Good luck - John
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


