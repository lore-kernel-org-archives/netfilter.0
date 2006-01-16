From: "Michael D. Berger" <m.d.berger@ieee.org>
Subject: NLMSG_ERROR: No such file or directory
Date: Mon, 16 Jan 2006 10:01:57 -0500
Message-ID: <005501c61aad$cc0594a0$2801a8c0@MBRC40>
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
To: netfilter <netfilter@lists.netfilter.org>

In my iptables:
   -A MDB-IN -i lo -p udp -m udp --dport 5000 -j QUEUE

In my QUEUE processor, after each correctly transmitted and
received udp message, I receive another signal with:
   ipq_message_type(buf) == NLMSG_ERROR
and
   ipq_get_msgerr(buf) == 2 == No such file or directory

I have no such problem with my other messages, which are
all non-local tcp.

What could cause this kind of error?

Thanks in advance for your help.
Mike.

--
Michael D. Berger
m.d.berger@ieee.org 



