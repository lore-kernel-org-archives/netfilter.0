From: Marcelo Tosatti <marcelo.tosatti@cyclades.com>
Subject: PROBLEM: PATCH for 2.4.23-pre4 and up hang on one system (fwd)
Date: Mon, 10 Nov 2003 09:06:16 -0200 (BRST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0311100906120.16790-100000@logos.cnet>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org



---------- Forwarded message ----------
Date: Sat, 8 Nov 2003 13:41:38 -1000
From: Beau E. Cox <beau@beaucox.com>
To: linux-kernel@vger.kernel.org;
Cc: Marcelo Tosatti <marcelo.tosatti@cyclades.com>
Subject: PROBLEM: PATCH for 2.4.23-pre4 and up hang on one system

submitted Sat Nov  8 13:08:55 HST 2003 by Beau E. Cox <beau@beaucox.com>

[1.] One line summary of the problem:

Patch that fixes my problem:
Starting with 2.4.23-pre4 my system hangs during startup and/or is
generally unstable (see patch in [ X. ] below.)

[2.] Full description of the problem/report:

Origionally I had catagorized this problem with the startup sequence;
the system always seemed to hang when squid was started before
mysql, etc. Moving squid near the end of the startup process, I
thought the problem was in hand. However, the system (pre9) proved
unstable (would not stay up for longer than one day.)

The problem exibits itself with a solid 'hang'; no oops, no dumps,
nada.

[ 3. ] - [ 7. ]

See previous posting; no hardware or configuration changes.

[X.] Other notes, patches, fixes, workarounds:

This patch to net/ipv4/netfilter/ip_nat_core.c fixed my problem
in all 2.4.23 versions pre4 - pre9:

--- linux-2.4.23-pre4/net/ipv4/netfilter/ip_nat_core.c	2003-11-08 
03:01:59.000000000 -1000
+++ linux-2.4.23-pre3/net/ipv4/netfilter/ip_nat_core.c	2003-11-08 
03:00:47.000000000 -1000
@@ -157,8 +157,8 @@
 				continue;
 		}
 
-		if (!(mr->range[i].flags & IP_NAT_RANGE_PROTO_SPECIFIED)
-		    || proto->in_range(&newtuple, IP_NAT_MANIP_SRC,
+		if ((mr->range[i].flags & IP_NAT_RANGE_PROTO_SPECIFIED)
+		    && proto->in_range(&newtuple, IP_NAT_MANIP_SRC,
 				       &mr->range[i].min, &mr->range[i].max))
 			return 1;
 	}

It is simply a rollback of changes to ip_nat_core.c made in
pre4.

All the information I can think of relating to this problem is at:

ftp://beaucox.com/pub/kernel/2.4.23-pre4-bug

Please see the README file.

---------------------------WARNING--------------------------
I am NOT a kernel programmer. The patch above was arrived at
by hit-or-miss. I REALLY don't know what I am doing (but
my system works now!)
---------------------------WARNING--------------------------

Aloha => Beau;

PS: Please let me know if you need more information.



