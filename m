From: Armin Schindler <mac@melware.de>
Subject: ip_queue and changed route
Date: Thu, 19 Sep 2002 10:22:15 +0200 (MEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.31.0209191011490.20195-100000@phoenix.one.melware.de>
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

Hi all,

I use kernel 2.4.16 and try to do the following :
My routing table just have the default entries for
my eth0 and the default gateway.
Via ip_queue (set up iptables with -j QUEUE) I check the
ip-packets with a user-space daemon for specific
destination addresses, start a ppp connection and then
set the verdict to ACCEPT the packets. But already
queued packets don't go to the new ppp0 they still go
to eth0. Only new packets are routed to ppp0.

Is there a way to re-route the packets for the new
routing-table with ppp0 ?

Thanks for any hint.

Armin


