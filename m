From: David <netfilter@kerneldriver.org>
Subject: Problem with buffering packets
Date: Wed, 29 Sep 2010 20:40:00 -0400
Message-ID: <4CA3DC60.1060100@kerneldriver.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

Question:  What is the maximum amount of time a packet can be
buffered before calling nfq_set_verdict?

Question:  Is there a configurable timeout that controls whether or
not a queued packet can be transmitted?

Question:  If there is a configurable timeout, how can the timeout
be changed?

I have a bridge with two interfaces, eth1 and usb0.  I use iptables
to queue all packets from the FORWARD chain:

    # iptables -A FORWARD -j QUEUE

I use libnetfilter_queue to get copies of the packets and buffer them.

If my application is in the forwarding state, it immediately copies
the packet from the receive queue to the transmit queue.  When the
transmit thread sees that the transmit queue is not empty, it gets
the next packet and uses nfq_set_verdict with NF_ACCEPT to transmit
the packet.  This works.

If my application is in the buffering state, it buffers packets
until it receives the command to flush all buffered packets.  It
copies packets from the receive queue to the transmit queue.  When
the transmit thread sees that the transmit queue is not empty, it
gets the next packet and uses nfq_set_verdict with NF_ACCEPT to
transmit the packet.  This does not work

Apparently, if there is a delay of more than a few seconds between
when the application buffers a packet and when it calls
nfq_set_verdict, not all packets get transmitted.  In fact, only the
first buffered packet gets transmitted.

I suspect there is some timeout mechanism in the netfilter code.
However, I was unable to find the exact location of the timeout code.

Thank you,
David
