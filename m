From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: How exactly does RELATED work in Connection Tracking?
Date: Thu, 24 Oct 2002 11:06:37 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210241006.g9OA6gL04057@vulcan.rissington.net>
References: <000801c2798e$a7dcfd70$09c809c0@PENT4> <1035325277.10494.18.camel@elendil> <000b01c27aac$d6b2a270$09c809c0@PENT4>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000b01c27aac$d6b2a270$09c809c0@PENT4>
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
To: netfilter@lists.netfilter.org

On Wednesday 23 October 2002 4:57 pm, Matthew Donofrio wrote:

> >Connection tracking relies on data structures. In those, to be quick,
> >you have tuples that are used to recognise packets going both ways. A
> >tuple is a set of datas that caracterize a packet for Netfilter. Theses
> >tuples are used firstly to build conntrack table entries, and then to
> >try to match theses entries against further packets. That means when you
> >see a packet, you can calculate its own tuple, and then compare it to
> >the ones that are in data structures that represent current conntracked
> >flows.
> >
> >When a packet reaches the box, then Netfilter looks at it, extract from
> >the header its own tuple and then compares it to known tuples that are
> >part of current conntracked connections. If it matches one of theses
> >tuples, then it is ESTABLISHED. It is also compared to all expectations.
> >If it matches one expectation, then we know this packet is RELATED (and
> >if it does not match anything, it is NEW). Then, we can create a new
> >structure for him with tuples and so on and treat the flow as others.
>
> The tuple is just the source address and destination address for a
> particular packet, correct?

No.   For TCP and UDP packets the tuple also contains the source and 
destination port numbers.

> So is it safe to say that the  only fields
> that are compared for connection tracking are the source and destination
> addresses?

No, otherwise if a client connected to a server using http, and then set up a 
new connection to the same server by ssh (same IP addresses, different port 
numbers), they would appear to be the same connection !

> So, if a packet comes in and the source and destination
> addresses match an entry in the conntrack state table, then we can say that
> it is part of some ESTABLISHED connection.  Thanks again.

If a packet comes in and the source and destination addresses and port 
numbers match an entry in the conntrack state table (with source and 
destination either way round, to allow for reply packets) then we can say 
that it is part of some ESTABLISHED connection.   You're welcome.

Antony.

-- 

How I want a drink, alcoholic of course, after the heavy chapters
involving quantum mechanics.

 - 3.14159265358979

