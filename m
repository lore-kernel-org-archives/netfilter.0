From: Ted Phelps <phelps@gnusto.com>
Subject: Fwd: Ted Phelps: issue with 2.6.20rc3 and nf_nat
Date: Thu, 04 Jan 2007 05:58:13 -0600
Message-ID: <31051.1167911893@laika.gnusto.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


I'm trying to use the new netfilter nf_nat module in linux-2.6.20-rc3
and running into a minor issue: when I load the iptable_nat module, all
existing connections stop working, as if the packets are being dropped.
This is somewhat irritating since the root partition of the machine in
question is mounted via NFS and, or course, that stops working.

I've poked around a bit and this bit of nf_net_standalone.c appears to
be the culprit:

    120:	/* Don't try to NAT if this packet is not conntracked */
    121:	if (ct == &nf_conntrack_untracked)
    122:		return NF_ACCEPT;
    123:
    124:        nat = nfct_nat(ct);
->  125:        if (!nat)
->  126:                return NF_DROP;


If I read this correctly, packets for connections which aren't tracked
at all are accepted, but packets for connections which are being tracked
don't have NAT knowledge are dropped.

Is there a good reason why line 126 shouldn't return NF_ACCEPT?

Cheers,
-Ted

