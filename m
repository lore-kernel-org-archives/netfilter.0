From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: Success routing mark'ed packets - but still confused why it
 didn't work the first time....
Date: Wed, 9 Apr 2008 06:15:24 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804090612580.2229@fbirervta.pbzchgretzou.qr>
References: <ftgq9j$mf$1@ger.gmane.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <ftgq9j$mf$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Eric B." <ebenze@hotmail.com>
Cc: netfilter@vger.kernel.org


On Wednesday 2008-04-09 00:06, Eric B. wrote:

>Step 2) Marking the packets:
>Originally, I tried mark'ing packets in the mangle Prerouting table destined
>for my machine's virtual ip.  I was under the impression that any response
>to those packets would maintain the mark and hence be routed through the
>appropriate routing table created in step 1.  However, this didn't work.

No, use CONNMARK as shown in http://dev.computergmbh.de/NF-Cookbook.tx

>And without any way of "seeing" whether the outgoing packets were marked, I
>couldn't tell why they weren't being routed properly (BTW - is there a way
>to "see" the mark on the packet in the log?)

LOGMARK :p

>My solution was to use the mangle Output table to mark all the outgoing
>packets with their source being the virtual ip.  Once I did that, success.
>My outgoing packets are properly redirected out the appropriate gateways.

Make sure you do not set a mark in an input/prerouting
chain so that it accidentally hits the routing rule
because that would mean incoming packets are diverted
before they reach the machine.

>However my question now is the root of my confusion.  If a packet is mark'ed
>in the Preroute mangle table, is that mark not supposed to be maintained
>throughout the life of the packet,

The mark is maintained during the life of the packet (until you change it
of course).

> including the machine's response to that
>packet?

Response is a new packet. Only the ctmark (connection mark)
can "survive" here.
