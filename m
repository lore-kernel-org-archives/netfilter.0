From: <tsh@mrc-lmb.cam.ac.uk>
Subject: routing between 2 nets on same LAN
Date: Mon, 2 Jun 2003 15:39:17 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200306021439.PAA426195@alf1.mrc-lmb.cam.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

I sent this before subscribing to the list, so apologies
to the moderator for duplication.

I'm trying to use iptables to route between two networks
on the same LAN. I'm attempting to migrate our ip addresses
from a bunch of global subnets (131.111.x/y/z.*) to
10. and to use NAT thereafter, and I was hoping to
be able to use iptables to route between these address
ranges whilst the migration was in progress.

I have entries like:

iptables -A FORWARD -i eth0 -o eth0 -s 131.111.26.0/24 -d 10.0.0.0/9
iptables -A FORWARD -i eth0 -o eth0 -d 10.0.0.0/9 -s 131.111.26.0/24

and IP_FORWARDING turned on, but when I try 'ping 131.111.26.1' from
10.0.0.1, I get no ICMP echo. On the iptables box,

tcpdump -i eth0 src 10.0.0.1 dst 131.111.26.1

sees the ICMP packets. The firewall eth0 has 2 ip addresses,
131.111.26.200 and  10.0.0.200 ('using ip address add').
10.0.0.1 has 10.0.0.200 as its default router and 131.111.26.1 has
131.111.26.200 as its default router. Each can successfully ping,
and be ping'd by, the firewall.


Is it legit in iptables to have the FORWARD input and output
interfaces the same? Or am I doing something wrong?

Cheers,
Terry.



Terry Horsnell (tsh@mrc-lmb.cam.ac.uk)
I.T. Manager
Medical Research Council
Lab of Molecular Biology
Hills Road
CAMBRIDGE CB2 2QH
U.K.
Phone:	+44 (0)1223 248011
Fax:	+44 (0)1223 213556


