From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: IP Nat or forward
Date: Wed, 6 Apr 2005 14:38:45 -0500
Message-ID: <002701c53ae0$3f633a00$f5001eac@riverview.office>
References: <4254272C.3060706@provident-solutions.com>
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
Content-Type: text/plain; charset="us-ascii"
To: "Vernon A. Fort" <vfort@provident-solutions.com>, netfilter@lists.netfilter.org

Vernon, there are a few issues that pop in to my head right a way.  First of
all are you wanting to NAT your IPSec connection?  If so you will need to
make sure that the IPSec implementation(s) that you use has a NAT Traversal
capability.  I believe that OpenS/WAN and FreeS/WAN both have this
capability either directly in source or via a patch.  Second What is the
(internal / private) IP (sub)net that the vendor will be comming from?  I'm
presuming that they will be comming from a 192.168.1.1 based on the fact
that you say they already have that address in use?  The reason I ask is I
like to control which packets traverse my IPTables rulese as much as
possible thus I match against soruce IP addresses too.  For now I'll go
along the assumption that you will have an IPSec tunnel to your router /
firewall and not passing the tunnel traffic through to the internal system
(terminating on the router vs the internal system).  I'll also assume that
the source IP address will be something along the lines of 192.168.1.234 for
the sake of the discussion.  For the sake of the discussion I'm going to use
eth0 as your external interface and eth1 as your internal interface.

# Inbound traffic
iptables -t nat -A PREROUTING -i eth0 -s 192.168.1.234 -d 192.168.90.1 -j
DNAT --to-destination 192.168.1.1
iptables -t nat -A POSTROUTING -o eth1 -s 192.168.1.234 -d 192.168.1.1 -j
SNAT --to-source 192.168.90.234
# Outbound traffic
iptables -t nat -A PREROUTING -i eth1 -s 192.168.1.1 -d 192.168.90.234 -j
DNAT --to-destination 192.168.1.234
iptables -t mangle -A POSTROUTING -s 192.168.1.1 -d 192.168.1.234 -j
ROUTE --oif eth1
iptables -t nat -A POSTROUTING -o eth0 -s 192.168.1.1 -d 192.168.1.234 -j
SNAT --to-source 192.168.90.1

I know that this will handle the inbound traffic correctly and I think it
will handle the outbound traffic correctly.  The trick here is that the
outbound traffic will want to route back to the internal interface for the
internal LAN subnet but hopefully via the ROUTE target that can be
overridden.  If that will not work you will need to do a similar inbound
NATing on the other end of the tunnel.

Netfilter IPTables ROUTE target
http://www.netfilter.org/patch-o-matic/pom-extra.html#pom-extra-ROUTE



Grant. . . .
----- Original Message ----- 
From: "Vernon A. Fort" <vfort@provident-solutions.com>
To: <netfilter@lists.netfilter.org>
Sent: Wednesday, April 06, 2005 1:15 PM
Subject: IP Nat or forward


> I need to NAT a VLAN or aliased interface to an internal address:
>
>     192.168.90.1   ->   192.168.1.1
>
> Basically a virtual network/address mapping.  The main reason is I need
> a IPSEC tunnel (openswan) connecting from a vender to an internal server
> but the ip address of our internal server is already used on their end.
> So, when they connect to 192.168.90.1, its redirected/forwarded/nat'd to
> the real internal address.
>
> Can someone get me started.
>
> Vernon
>
>


