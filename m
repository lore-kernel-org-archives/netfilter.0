From: Bahamin Takhtaei <takhtaei@amnafzar.com>
Subject: nf_queue question
Date: Thu, 26 Jul 2007 10:11:18 +0330
Message-ID: <46A8420E.3020200@amnafzar.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi everyone!
I install libnfnetlink_0.0.16 and libnetfilter_queue-0.0.12 and upgrade 
my kernel to
linux-2.6.17.13. Then I run libnetfilter_queue-0.0.12/utils/nfqnl_test , 
but encounter with
this message:
nfnl_talk: sendmsg(netlink) Connection refused
error during nfq_unbind_pf()

#lsmod
ip_queue
xt_NFQUEUE
iptables_filter
iptables

Please tell me how I can handle this error?

Thank you in advanced,
Bahamin


