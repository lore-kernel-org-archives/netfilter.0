From: "Kovacs Istvan" <kofa@alarmix.net>
Subject: DNAT in postrouting?
Date: Tue, 11 Mar 2003 15:32:37 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030311143247.89FF326A946@mx1.datanet.hu>
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Hi All,

I've run into an interesting problem.

A company network is attached to several client networks via IPSec
tunnels. Clients use private IP ranges. There are two clients whose IP
ranges clash. I'm going to use dummy addresses 1.2.3.x and a.b.c.x for
the two networks because I'm lazy to write 192.168.1.x and 10.1.1.x all
the time.

So let's say both clients use the addresses of the form 1.2.3.x. We'd
like to map one of the clients to a.b.c.x without distrubing their
network (modifying their firewall configuration or adding new boxes,
let away reconfiguring the whole network).

The IPSec interface towards one of the clients is ipsec0, to the other
it's ipsec1.

A possible solution would be to map one client to a.b.c.x by performing
a.b.c.x->1.2.3.x DNAT after the routing decision is made and just
before the packet leaves at the ipsec0 interface. Computers connected
to the company LAN send packets to a.b.c.x. Packets are routed to the
IPSec gateway. The stack has a routing entry that tells it to forward
packets destined to a.b.c.x via IPSec interface ipsec0. After the
routing decision is made, in the postrouting chain, we would map the
destination address  to 1.2.3.x. The packet would then enter the IPSec
tunnel (at ipsec0) and would emerge with the right destination address
at the other end. On the way back, a packet with source address 1.2.3.x
would pop out from ipsec0, and its source address would sooner or later
be mapped to a.b.c.x.

My trouble is that it seems I cannot do the DNAT before the routing
decision, because then the kernel would route it to the wrong
interface, ipsec1. Unfortunately, the IPSec tutorial says 'This
[postrouting/nat] chain should first and foremost be used for Source
Network Address Translation.' and that DNAT is to be done at
prerouting/nat.

Unfortunately, I cannot access the networks in question right now, and
I need to recommend a soltution soon, otherwise I would have tested it
by now.

Please advise.

TIA,
Kofa

Homepage at http://emil.alarmix.org/kofa/ - For PGP public
key: send mail with the subject PGP Public Key Request



