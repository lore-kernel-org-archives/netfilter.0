From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: RE: Multiple IPSEC VPNs through a firewall based on 2.4.2X kernel
Date: Wed, 25 Aug 2004 07:29:20 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1093433311.2034.36.camel@localhost>
References: <09D3F703EF3B0A4CBE28449EA9F3D3206F1D7A@nicta-atp-mail.in.nicta.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <09D3F703EF3B0A4CBE28449EA9F3D3206F1D7A@nicta-atp-mail.in.nicta.com.au>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Roksana Boreli <Roksana.Boreli@nicta.com.au>
Cc: netfilter@lists.netfilter.org

Thanks for the clarification.  Does the Cisco Linux client support any
form of NAT Traversal? If it does, that is the way to go.  The
documentation should tell you what you will need to open on your
firewall.  If not, you can try tracing using Ethereal and see what
protocols and ports it uses.

If it does not support NAT-T, then I think your only option is to assign
fixed IP addresses :-(  Perhaps you can isolate an IP subnet they use
(not a bad idea as per the paragraph below) and use the NETMAP target
from pom.

This ability for visitors to attach to their own networks does sound a
bit dangerous.  Is the company management aware that there is the
possibility that someone on the other side of those visiting VPN tunnels
could use the visiting station as an access point to your internal
network? Of course, someone may have addressed that and isolated the
points from which visitors can connect to their own WAN.  Take care -
John

On Wed, 2004-08-25 at 03:24, Roksana Boreli wrote:
> Thanks Jason.
> 
> > enable IKE over TCP on the clients and UDP encapsulation.  
> > this is not a problem with netfilter, but with multiple
> >  IPSec clients behind *any* NAT = device.
> 
> Perhaps some additional info needs to be added about my configuration.
> I need to use standard Cisco Linux clients, as this is for people
> visiting (with their laptops and standard VPN setup for remote access)
> and wanting to get to their (Cisco) server.  In fact, it could be more
> than one ipsec server at some time in the future.  I definitely need to
> use a Cisco VPN gateway (can't use FreeSwan), I cannot have a single vpn
> client from the Linux router device as the requirement is for multiple
> clients behind this device.  The Cisco gateway and Win 2k client can set
> up a connection through a NAT router, we have tried this with a Netgear
> device.  So I thought the issue was similar to pptp vpn pass-through for
> multiple clients (i.e. a patch for the kernel/iptables was the way to
> go), hence the question.  
> 
> Kind regards, Roksana 
> 
> 
> Subject: RE: Multiple IPSEC VPNs through a firewall based on 2.4.2X
> kernel
> Date: Tue, 24 Aug 2004 07:56:33 -0400
> From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
> To: <netfilter@lists.netfilter.org>
> 
> Hi,
> 
> I am trying to set up multiple ipsec VPN clients working behind a Linux
> router with NAT/PAT, based on a 2.4.20 (can be 2.4.22) kernel. I would 
> like to be able to connect a number of Windows (2k or XP) machines to 
> an existing Cisco VPN server.
> 
> Kind regards, Roksana
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


