From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: not sure ESTABLISHED TCP traffic will have ACK flag setalways...
Date: Fri, 8 Apr 2005 16:01:49 -0500
Message-ID: <006901c53c7e$2ead1c90$f5001eac@riverview.office>
References: <1112975844.3544.94.camel@seberino.spawar.navy.mil>
	<20050408205224.GA15635@vetz.homelinux.org>
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

> This problem is resolved by the TCP window? Am I right?

If the ""problem that you are referring to is how many unACKed packets can
be sent by either side before it retransmits the packet that has not been
ACKed, then Yes this number is controlled by the TCP Window size.  The TCP
Window size is asically the number of TCP packets that can be sent out and
still on the wire before the sender resends a packet assuming that it was
dropped.

> One side CAN send more packets.

Yes I believe that this is correct.  Any packets sent by the server MUST be
ACKed by the client, but the client could ACK the SYN number of a packet
sent later in the conversation thus ACKing all packets that were sent up to
the point just prior to the number that was ACKed.  What??? When a packet is
ACKed, the ACK number is the number of the next sequence number that the
receiving system is expecting to receive from the server.  Thus if I have
received packets 1234, 1235, 1236, and 1237 from you I would send a packet
back to you with an ACK of 1238 statin gthat I'm expecting your next
sequence number to be 1238 effectively ACKing all packets up to and
including 1237.



Grant. . . .


