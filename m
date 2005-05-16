From: Thomas Kling <thomasmkling@yahoo.de>
Subject: how get tcp_conntrack?
Date: Mon, 16 May 2005 18:33:41 +0200
Message-ID: <371529952.20050516183341@yahoo.de>
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

Hello,

I put his question to netfilter-devel, but did get no reply. I'm just
wondering if my problem is too trivial or impossible with iptables,
here it is:


I want to write an extended logging of TCP-Connections: iptables -A INPUT -j LOGTCP

LOGTCP should just be a copy of ipt_LOG.c: 

/* --------copy------------
static void dump_packet(const struct ipt_log_info *info, const struct sk_buff *skb, unsigned int iphoff)
{
...
case IPPROTO_TCP: {
struct tcphdr _tcph, *th;
 
/* Max length: 10 "PROTO=TCP " */
printk("PROTO=TCP ");
... 
[*]
...
break;
--------copy------------ /*

And here [*] I want to call some functions from tcp_conntrack:
printk("tcp_in_window, sender->td_end, sender->td_maxend, sender->maxwin, receiver->td_end, receiver->td_maxend, receiver->td_maxwin);

The problem: I just don't know how to access these values from there.
ip_conntrack_get gives me a pointer to nowhere. I looked through
several other modules, but didn't find the idea to get started.


