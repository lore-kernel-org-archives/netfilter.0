From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Implicit SNAT gone
Date: Mon, 4 Jul 2005 21:17:04 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0507042116530.10754@yvahk01.tjqt.qr>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter User Mailing List <netfilter@lists.netfilter.org>

Hi,


In ip_nat_rule.c (and my syslog! apprently) I see:

/* Before 2.6.11 we did implicit source NAT if required. Warn about change. */
                printk("NAT: no longer support implicit source local NAT\n");
                printk("NAT: packet src %u.%u.%u.%u -> dst %u.%u.%u.%u\n",
                       NIPQUAD(srcip), NIPQUAD(dstip));

So, how do I get the feature back with 2.6.12 logic?
(Or do I have to forwardport that feature?)




Jan Engelhardt                                                               
--                                                                            

