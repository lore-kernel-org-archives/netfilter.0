From: Stefan Urbat <stefan.urbat@apastron.lb.shuttle.de>
Subject: ecn_tcp_remove enabling problem
Date: Sun, 1 Dec 2002 16:58:44 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0212011641050.2222-100000@apastron.lb.shuttle.de>
Reply-To: Stefan Urbat <stefan.urbat@apastron.lb.shuttle.de>
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

At now I'm clueless, despite viewing the source of iptables v1.27a. When I
invoke

iptables -t mangle -A ecn_defunct -p tcp -d 216.104.161.48/29 -j ECN -m
ecn --ecn-tcp-remove

on the existing, empty chain ecn_defunct, an error message emerges:

iptables v1.2.7a: ECN match: some option required

Seems that any parameter is lacking, judging after the ipt_ECN.c source,
but how to resolve this issue?

The modules ipt_ecn and ipt_ECN are loaded due to lsmod, by the way.
Kernel is 2.4.20 vanilla with xfs patch only applied.

Registered Linux-User #169380 on http://counter.li.org/


