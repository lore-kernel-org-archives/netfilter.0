From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: Multiple IPSEC VPNs through a firewall based on 2.4.2X kernel
Date: Tue, 24 Aug 2004 05:31:52 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1093339912.2050.208.camel@localhost>
References: <09D3F703EF3B0A4CBE28449EA9F3D32069F456@nicta-atp-mail.in.nicta.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <09D3F703EF3B0A4CBE28449EA9F3D32069F456@nicta-atp-mail.in.nicta.com.au>
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
To: Roksana Boreli <Roksana.Boreli@nicta.com.au>
Cc: netfilter@lists.netfilter.org

On Tue, 2004-08-24 at 01:11, Roksana Boreli wrote:
> Hi,
> 
> I am trying to set up multiple ipsec VPN clients working behind a Linux
> router with NAT/PAT, based on a 2.4.20 (can be 2.4.22) kernel. I would
> like to be able to connect a number of Windows (2k or XP) machines to an
> existing Cisco VPN server. 
> 
> client 1 (ipsec) --->  | router	|
> client 2 (ipsec) --->  |  NAT/	|
> .		        PAT	| -> ipsec VPN server (Cisco)
> .		     |		|
> client 10 (ipsec) --->|		|
> 
> A patch seems to be needed to make this work, and I have seen a lot of
> emails with a similar question in regards to pptp VPN clients, but
> nothing encouraging for ipsec.  I have also seen the IP masquerade HOWTO
> and the VPN HOWTO, which both refer to a patch for 2.2 kernels, but
> claim nothing is available for 2.4 kernels. I am a netfilter newbie (if
> this is not blindingly obvious), so any help would be much appreciated.
> 
> 
> Kind regards, Roksana
The answer depends on what exactly you are trying to do.  If you are
branching together two networks, you may wish to consider moving the
IPSec stack to the Linux gateway and creating a LAN-to-LAN connection. 
If you wish to restrict access to just those few clients, you can make
such restrictions in iptables.

On the other hand, if you are connecting to an external network, e.g.,
clients from a partner are working on your network and they need access
back to their home network (consider carefully if you really want to do
that - you may open your internal network to the external network
through these clients), then you will want to retain the IPSec stack on
the clients.

You have two options.  You can use a client which supports NAT-Traversal
(assuming that the Cisco VPN device is also configured to use
NAT-Traversal) or you can assign a one-to-one NAT mapping for the
clients to unique public addresses (very expensive if you have limited
public IP addresses) and use a standard IPSec stack.  We have
successfully implemented both arrangements.  Good luck - John
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


