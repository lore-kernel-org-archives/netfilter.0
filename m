From: =?iso-8859-1?Q?Mattias_R=F6nnblom?= <hofors@lysator.liu.se>
Subject: ip_queue and connection tracking
Date: 25 Oct 2002 10:03:13 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <m31y6fkkse.fsf@isengard.firemission.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi,

I'm trying to use ip_queue (and the QUEUE target) to delay packets.
In a small test program, "ipdelay", I limit the rate of packets
being NF_ACCEPT:ed. This works fine until I enable (by inserting
the iptable_nat module) NAT. Then the kernel starts loosing
packets in streams/connections in which the first packet has
arrived but not yet has left the kernel. For example, if I send 10
UDP-packets with 100 ms in-packet time, and configure my ipdelay
program to sleep 500 ms between each ip_set_verdict(/../ NF_ACCEPT /../);
the first packet will get through, but packet number two to six
will be lost. Seven to ten gets through.

Because all connections are being tracked (not only those being NATed),
you get this behaviour for all connections.

What you can see is that for the first packet, and the packets 2-6
in my example, you get a new "conntrack" entity. resolve_normal_ct()
only seems to scan confirmed connections. Packets which arrived before
the first packet has been confirmed will be dropped when they come to
__ip_conntrack_confirm().

On the conceptual level, I don't really understand why it works this
way. Can this behaviour be considered to be a bug?

Regards,
        Mattias

