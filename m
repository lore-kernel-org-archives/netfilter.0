From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: not sure ESTABLISHED TCP traffic will have ACK flag setalways...
Date: Sat, 09 Apr 2005 13:33:59 -0500
Message-ID: <42582017.5030402@riverviewtech.net>
References: <1112975844.3544.94.camel@seberino.spawar.navy.mil>
	<20050408205224.GA15635@vetz.homelinux.org>
	<006901c53c7e$2ead1c90$f5001eac@riverview.office>
	<20050409062431.GA17505@spawar.navy.mil>
Reply-To: gtaylor@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050409062431.GA17505@spawar.navy.mil>
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
To: seberino@spawar.navy.mil
Cc: netfilter@lists.netfilter.org

> Thanks for your reply.  I did not know you could ACK multiple sequence
> numbers with a single ACK.  That really helps.   You obviously
> have a deep knowledge of TCP.

You are welcome.  I have some info in my head but I'm not entirely sure that it is 100% accurate, I'm hoping that it's close though.  So if you find any thing wrong with what I'm saying please let me know.

> I am still confused why anyone could believe that packets //without//
> the ACK flag set are suspicious.  Going back to your scenario above,
> there is a faster side blasting packets (1234, 1235, 1236, 1237...)
> faster than the other side is sending packets.  Clearly the
> faster side cannot set the ACK bit in all those packets
> (1234, 1235, 1236, 1237...) on because the fast side has fewer
> incoming packets to acknowledge right?

When the faster sending site sends it's packets to the slower receiving site the packets that are sent (1234, 1235, 1236, 1237...) will all have the same Acknowledgment number set in their packet stating that the next packet the faster sender receives from the slower client should be that Sequence number.  I personally do not know of a scenario where it would be plausible to receive a TCP packet with out the ACK bit set except during the SYN, SYN-ACK, ACK-ACK initiation phase and even just the first packet does not have the ACK bit set.  Even if you send a RST (reset), FIN (finish), PSH (push), URG (urgent) (I'm trying to remember my flags here with out looking them up so I could be wrong) flags they will all be during an on going TCP conversation and thus would have the ACK bit / flag set.  The only really questionable flag is the RST where some TCP/IP stacks will send packets with the 
 RST flag set if they mistakenly receive a packet that was not destined to them.  This is i
mplementation dependent and not clearly defined in RFCs and thus a matter of some confusion.  IMHO the stack tat received this packet should just drop the packet as it was obviously not meant for it and there was a failure elsewhere.



Grant. . . .

