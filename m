From: Kramer <kramer@ufl.edu>
Subject: iptables, NAT and NetBIOS
Date: Fri, 07 Jun 2002 08:48:56 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D00ABB8.2090408@ufl.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.samba.org

iptables NAT still does not have a conntrack to handle the embedded 
netbios addresses for a NATed subnet.  Basically you cannot use iptables 
NAT if there are MS networking hosts on any NATed subnet.  Is anyone 
working on this now?

I am very puzzled by this because I find very few networks that don't 
have at least some MS Windows workstations.  Even more puzzled since the 
iptables.org group is also the Samba group for making unix/linux 
interoperate with MS and iptables is not compatible with MS.  Cisco, 
Checkpoint and other commercial proprietary firewalls handle netbios 
thru NAT.

If I have missed the fix to this problem somewhere I would love to be 
corrected.

Jack Kramer
University of Florida


