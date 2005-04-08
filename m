From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: not sure ESTABLISHED TCP traffic will have ACK flag set
	always...
Date: Fri, 8 Apr 2005 14:59:23 -0500
Message-ID: <00b101c53c75$7670eec0$f5001eac@riverview.office>
References: <1112975844.3544.94.camel@seberino.spawar.navy.mil>
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
To: Christian Seberino <seberino@spawar.navy.mil>, netfilter@lists.netfilter.org

Yes it is plausable (and common) for one side to send more traffic than the
other side (pick your favorite downloading client for downloading ISOs).
Something to keep in mind (at least as far as I know it) is that for TCP to
operate packets that get sent MUST be ACKnowledged with in the TCP Window
size.  The WINDOW is how many packets can be out in the ether
unACKnowledged.  If a packet goes too long unACKnowledged the sending side
will resend the packet assuming that the packet has been lost somewhere.
That being said for at least 1 packet in every TCP WINDOW size received the
client will send an ACK with the ACK number set to the next Sequence number
that it is expecting to receive.  This is where Window sizeing comes to play
when you try to optimize transmition of data.  ...pause to think about the
question some more...  Something to keep in mind is that just because I'm
receiving data from the server does not mean that I can NOT respond to the
traffic that it has received.  Restated the client has to respond to the
server stating that it did receive the traffic that was sent to it.  Also
any traffic in an established TCP converstaion will have an ACK bit set
acknowlidgeing that it received traffic prior and a sequence number set to
the number of the next packet that it sees.  Thus the server will send a LOT
of packets to the client with the same Sequence number associated with the
ACK field.  I may have some terms / names of fields incorrect but this is
the conceptual understanding that I have of TCP conversations.



Grant. . . .

> Firewall packet filter question.....
>
>
> **After** setting up a TCP connection, it may seem to make
> sense that ALL future packets would set the ACK flag.
>
> (ACK is important in 2 way communication since both sides
> need to constantly confirm //receipt// of _past_ packets.)
>
> Therefore, you might think it would be a good idea to
> set up you firewall to drop packets on ESTABLISHED
> connections that don't have ACK bit set.
>
> However, here is an apparent case where non-ACKs exist!!!...
>
> 1. One way traffic!!! --- sender has nothing to ACK!
>
> 2. One side sends LESS packets then the other! --
>    fast side doesn't have enough incoming to ACK either!
>
> Agree? Why then do people say to drop non-ACK'd packets
> as suspicious??.... I would think it would be common
> for one side to send more packets then the other.  I could
> be wrong.
>
> Chris
>
>
>


