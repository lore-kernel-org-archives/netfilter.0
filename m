From: Justin Schoeman <justin@expertron.co.za>
Subject: Alternatives to window shaping?
Date: Thu, 30 Aug 2007 12:45:43 +0200
Message-ID: <46D69FD7.3000405@expertron.co.za>
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

I have posted this before under another thread, but did not get many 
replies. So I thought I would post it under a more appropriate subject.

OK, so we have a link that has a fair bandwidth, and a high latency. 
This means that TCP windows get nice and big.

Now I have a problem with ingress shaping, because the current 
implementation just drops packets.  This means that we have to wait for 
the sender to notice the packet drop (OK, or for the receiver to notice 
at out of order inbound backet). But either of these can take quite a 
while, during which the sender is still sending data at a rate higher 
than what you want to throttle it to.

What I was considering was, instead of just dropping the packet, send 
out an ACK packet (to the sender of the packet we are dropping), 
repeating the last ack sequence, as recorded in the conntrack table.

This should be the second ack the sender receives, which should 
immediately start a 'slow start' procedure, and get the sender to back off.

This is still as wastefull as just dropping the packet, but should have 
a more immediate effect.

The problem is, how will the sender and receiver respond? They may now 
receive a number of packets in completely unexpected order.

Is this practical? Will it work? Will it help?

Thanks!
Justin

