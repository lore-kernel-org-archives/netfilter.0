From: David Cary Hart <DCH@TQMcube.com>
Subject: Testing TARPIT
Date: Thu, 15 Jul 2004 14:53:45 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1089917625.20455.4.camel@dchws.tqmcube.com>
Reply-To: NetFilter List <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

TARPIT seems to work. I'm using it on 445, 135 and 135 in lieu of DROP.
How can I test to determine the effectiveness in terms of how long
connections are held? The tethereal output looks promising:

312.118168 68.236.182.104 -> 192.168.0.31 NBSS [TCP Retransmission] NBSS
Continuation Message
312.118269 192.168.0.31 -> 68.236.182.104 TCP [TCP ZeroWindow] [TCP Dup
ACK 442#3] microsoft-ds > 4969 [ACK] Seq=1 Ack=1 Win=0 Len=0
314.855014 68.236.182.104 -> 192.168.0.31 TCP [TCP Retransmission] 4902
> microsoft-ds [FIN, ACK] Seq=1 Ack=1 Win=64320 Len=0
318.134344 68.236.182.104 -> 192.168.0.31 NBSS [TCP Retransmission] NBSS
Continuation Message
318.134441 192.168.0.31 -> 68.236.182.104 TCP [TCP ZeroWindow] [TCP Dup
ACK 442#4] microsoft-ds > 4969 [ACK] Seq=1 Ack=1 Win=0 Len=0

BTW, has anyone compared effectiveness to La Brea?



