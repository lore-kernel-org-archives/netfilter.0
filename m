From: "Michael D. Berger" <m.d.berger@ieee.org>
Subject: Set mark in -j QUEUE?
Date: Sat, 17 Dec 2005 12:49:22 -0500
Message-ID: <000001c60332$36cd7340$2801a8c0@MBRC40>
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

Using iptables-1.2.11-3.1.RHEL4.

In the mangle table, in an otherwise successful -j QUEUE
processor, I set:

   ipq_packet_msg_t*       msg;
   ...
   msg->mark = 2;
   ipq_set_verdict(ipqHand,msg->packet_id,NF_ACCEPT,0,NULL);

and in the filter table, I check:

   -A IN -s 192.168.1.0/24 -m mark --mark 0 -j LOG-QUEUE-0-DROP
   -A IN -s 192.168.1.0/24 -m mark --mark 1 -j LOG-QUEUE-DROP
   -A IN -s 192.168.1.0/24 -m mark --mark 2 -j LOG-QUEUE-ACCEPT

The result is zero. On the other hand, if in the mangle table:

   -A PRE -p tcp -s 192.168.1.0/24 -j MARK --set-mark 2

I get the correct result of 2 in the filter table.

Is there any way to make this work in the -j QUEUE processor?

Thanks in advance for your help.

Mike.

--
Michael D. Berger
m.d.berger@ieee.org 



