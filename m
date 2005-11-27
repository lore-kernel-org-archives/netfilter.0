From: "Kiba da Fucka" <dkiba@yandex.ru>
Subject: NFQUEUE nfq_set_verdict_mark and "iptables -m mark" interaction
	problem
Date: Sun, 27 Nov 2005 04:24:51 +0300 (MSK)
Message-ID: <43890AE3.000001.24021@ariel.yandex.ru>
Reply-To: dkiba@yandex.ru
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all.

I'm trying to use queing mechanisms of 2.6.14, NFQUEUE.

My task is to set firewall mark from userspace, and make filtering decision in filter table or for example corresponding DNAT action in nat PREROUTING.

My test firewall rules:

IPTABLES -t mangle -A PREROUTING -p ICMP -j NFQUEUE --queue-num 3

IPTABLES -P INPUT DROP
IPTABLES -A INPUT -m mark --mark 1 -j ACCEPT

I uset nfqnl_test provided in libnetfilter_queue to test this approach:
Set up  the queue:

qh = nfq_create_queue(h,  3, &cb, NULL);

And in callback I call ipq_set_verdict_mark() instead of ipq_set_verdict()

    u_int32_t id = print_pkt(nfa);
    printf("entering callback\n");
    return nfq_set_verdict_mark(qh, id, NF_ACCEPT, 1,0, NULL);

Program catches packets from netlink socket and setting verdict, but it seems not to mark with  "1", because iptables rule that accepts only marked packets doesn't work, but all queued traffic goes in/out without it.

Looking over code of libnetfilter_queue doesn't give me much, but as far as i understand, I don't have to pass packet data and datalen to this  function if I just want to set netfilter mark. Am I right?

Or i should pass pointers to data and data length even if I just set mark?
Or maybe there is an issue with netfilter -m mark match interaction?

KdF

