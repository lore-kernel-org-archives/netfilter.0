From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: Routing between two firewalls
Date: Wed, 23 Jun 2004 08:00:38 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1087992038.24601.18.camel@localhost>
References: <40D94B3D.8050308@openscroll.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40D94B3D.8050308@openscroll.org>
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
To: Sudhakar Chandra <thaths@openscroll.org>
Cc: netfilter@lists.netfilter.org

On Wed, 2004-06-23 at 05:19, Sudhakar Chandra wrote:
> Hi,
> 
> I am having some trouble routing some packets between two dual-homed 
> machines both running iptables.
> 
> I have a setup that I assume should be pretty common.  I have a LAN 
> (192.168.100.0/24) which has two gateways / firewalls on it.  Both the 
> gateways are dual-homed.
> 
> My setup is something like so:
> 
> LAN ---> (192.168.100.1) Gateway 1 (isp1.global.ip) --->
> LAN ---> (192.168.100.2) Gateway 2 (isp2.global.ip) --->
> 
> Gateway 1 routes through ISP1 and Gateway 2 through ISP2.  Some machines 
> in my LAN have .1 set as the gateway and some have .2 as the gateway.
> 
> I have my mail server connected to one of the global IPs that ISP2 has 
> given me.  Or in other words, mail server is on the same subnet as the 
> external interface of Gateway 2.
> 
> As things are today, packets originating on machines having Gateway 1 as 
> their default gateway traverse out through ISP1, the global internet, 
> back through ISP2 into my global ISP2 subnet.  This is a waste of 
> bandwidth as well as slow.
> 
> I want to set up a rule on Gateway 1 such that all packets destined to 
> my mail server (actually, my entire ISP2 subnet) should be sent to 
> Gateway 2 for routing.
> 
> I tried adding a static route on Gateway 1 to route all packets destined 
> to the mail server to Gateway 2 like so:
> 
> route add -host mail.server.ip gw 192.168.100.2
> 
> After I set this up, I am able to traceroute to mail server (packets 
> flow through Gateway 2).  But when I try connecting to port 25, nothing 
> happens.
> 
> 1. What is the fastest and easiest way to do what I want?
> 2. Should I be doing DNAT?
> 3. Should I be doing something using iptables AND routing?
> 
> Your help would be much appreciated.
> 
> Thaths
I can think of several options.

1) I believe Antony has already mentioned keeping your current
configuration and ensuring that your access control rules allow the SMTP
traffic.  This has the advantage of changing very little but it means
that all your gateway1 e-mail traffic double-spools.  It traverses the
LAN to gateway 1 and then traverses the LAN to gateway2 doubling the
load on the network and the gateways.

The very first thing I'd suggest is move that e-mail server to a DMZ
rather than leaving it exposed to the Internet.  One could place heavy
access control rules on it to protect it while exposed but then you have
a third set of access control rules to manage.  A safer and easier to
maintain solution would be moving it to a DMZ with an RFC 1918 (private)
address with access through both gateway1 and gateway2 (another NIC in
each).  This opens more options.

2) The one I normally implement is a split DNS.  The DNS used by
internal users knows the e-mail server by the private address while the
DNS the world uses knows the public address.

3) I suppose one could subnet the public addresses you have and
implement proxy ARP on one of the gateways but you will have to allocate
a minimum of four IP addresses to the DMZ and you will lose two (base
and broadcast) so this seems a waste.  It will eliminate the need to
split DNS.

Now we have to worry about how to get the packets back to the LAN.  I
can think of three options off the top of my head.

1) Use SNAT for all traffic so that all traffic from gateway1 will
appear to be originating from the DMZ address of gateway1 and the same
for gateway2.  The e-mail server will then look to its ARP table rather
than its routing table to reply and will send the replies to the gateway
from which they came.  This is probably the simplest and safest solution
- safe because your private IP addressing is never exposed to the
publicly accessible e-mail server.

2) Subnet your internal network.  Even if it uses the same physical
media, you could create a virtual subnet (192.168.100.0/25 and
192.168.100.128/25 for example).  Your DHCP server can give out
addresses for either along with default gateway information for either. 
One could then enter the route information for the subnet using gateway1
into the routing table on the e-mail server.  Gateway1 LAN traffic will
go to gateway1 and Gateway2 traffic will go to the default gateway
(Gateway2).

3) You could let all reply traffic flow through gateway2 as the default
gateway but that will upset the state table.  To get around that
problem, you will need to open a nasty hole into your LAN for the e-mail
server through gateway2.  If the e-mail server is ever compromised, your
internal LAN will be an easy target for the cracker.

Hope this helps - John
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


