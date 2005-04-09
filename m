From: seberino@spawar.navy.mil
Subject: Re: not sure ESTABLISHED TCP traffic will have ACK flag setalways...
Date: Fri, 8 Apr 2005 23:24:31 -0700
Message-ID: <20050409062431.GA17505@spawar.navy.mil>
References: <1112975844.3544.94.camel@seberino.spawar.navy.mil>
	<20050408205224.GA15635@vetz.homelinux.org>
	<006901c53c7e$2ead1c90$f5001eac@riverview.office>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <006901c53c7e$2ead1c90$f5001eac@riverview.office>
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
Content-Transfer-Encoding: 7bit
To: "Taylor, Grant" <gtaylor@riverviewtech.net>
Cc: netfilter@lists.netfilter.org

> Thus if I have
> received packets 1234, 1235, 1236, and 1237 from you I would send a packet
> back to you with an ACK of 1238 statin gthat I'm expecting your next
> sequence number to be 1238 effectively ACKing all packets up to and
> including 1237.
>

 Grant

Thanks for your reply.  I did not know you could ACK multiple sequence
numbers with a single ACK.  That really helps.   You obviously
have a deep knowledge of TCP.

I am still confused why anyone could believe that packets //without//
the ACK flag set are suspicious.  Going back to your scenario above,
there is a faster side blasting packets (1234, 1235, 1236, 1237...)
faster than the other side is sending packets.  Clearly the
faster side cannot set the ACK bit in all those packets
(1234, 1235, 1236, 1237...) on because the fast side has fewer
incoming packets to acknowledge right?

Chris

