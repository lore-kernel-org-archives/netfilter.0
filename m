From: Gregory Carter <gcarter@aesgi.com>
Subject: Re: Alternatives to window shaping?
Date: Thu, 30 Aug 2007 10:14:35 -0500
Message-ID: <46D6DEDB.6000505@aesgi.com>
References: <46D69FD7.3000405@expertron.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46D69FD7.3000405@expertron.co.za>
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

You didn't explain how you were doing the QoS policy on the line.

What you are describing is what is SUPPOSE to happen when your network 
interface is congested.  You can't magically make the interface do more 
work than what is allowed by creating a IP connection track ruleset.

Is there a linux outer in between these two transmission and receiving 
points?   Whats the bandwidth we are dealing with?

If it is a linux router, make sure it can actually handle the traffic 
input your throwing at it.

With that said,  I would like to point out not ALL ethernet cards are 
created equal.

For example, if I use a RTL 8139 card on a 100MB network, I have noticed 
it makes my router work very very hard, much harder than it normally has 
to, and this can cause problems with lower throughput and dropped packets.

At the time though, my primary backbone router died and I needed 
something quick and dirty.   Thats exactly what I got for about 4 hours 
till I got the old router hardware backup and running.  Things were 
slower, but at least things were moving.

Now, if I throw a Intel EtherPRO 100 on the same interface, packet loss 
magically disappears and my router is magically able to do all my IP 
connection tracking and processing and QoS without dropping packets.

But not because it magically made more bandwidth, bandwidth is the same, 
its how the time is spent at the driver level for the cards is what matters.

Maybe, you might want to take a look at putting decent network cards in 
your router if this is the case and try again.

-gc

Justin Schoeman wrote:
> I have posted this before under another thread, but did not get many 
> replies. So I thought I would post it under a more appropriate subject.
>
> OK, so we have a link that has a fair bandwidth, and a high latency. 
> This means that TCP windows get nice and big.
>
> Now I have a problem with ingress shaping, because the current 
> implementation just drops packets.  This means that we have to wait 
> for the sender to notice the packet drop (OK, or for the receiver to 
> notice at out of order inbound backet). But either of these can take 
> quite a while, during which the sender is still sending data at a rate 
> higher than what you want to throttle it to.
>
> What I was considering was, instead of just dropping the packet, send 
> out an ACK packet (to the sender of the packet we are dropping), 
> repeating the last ack sequence, as recorded in the conntrack table.
>
> This should be the second ack the sender receives, which should 
> immediately start a 'slow start' procedure, and get the sender to back 
> off.
>
> This is still as wastefull as just dropping the packet, but should 
> have a more immediate effect.
>
> The problem is, how will the sender and receiver respond? They may now 
> receive a number of packets in completely unexpected order.
>
> Is this practical? Will it work? Will it help?
>
> Thanks!
> Justin


