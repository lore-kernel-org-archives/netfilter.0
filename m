From: "Kotatsu" <naughtydog@virgilio.it>
Subject: Re: Resend TCP segment modified to the sender
Date: Tue, 1 Jun 2004 23:08:22 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001e01c4481c$92c00b40$5790b450@bebop>
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
To: Netfilter list <netfilter@lists.netfilter.org>

>
> It's possible and you can modify any packet you capture. What do u mean by
> "which field"? You just need to write a couple of rules to put packets
into
> QUEUE.

I've maded a C program that take packet from the queue with libipq.h
I've a scipt that queue all the packet sended by my host:

iptables -A FORWARD -j QUEUE

My program catch this packet, see if in this TCP data packet there is a
particular sequence number (for example 10) in the data filed, and if it is
i want that netfilter resend this packet modified to the client. I want to
modify the TCP data packet from data packet to ACK with window advertise =0.
The purpouse of this is to freeze TCP on client (with window probe
thecnique). So i want to know how I must modify my packet to do this.

I've already modified a server data packet to ACK with window size=0, but
now i must reuse a client packet as a server packet.
Best regards
Marco A.


