From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Questions on DNAT and pre/postrouting...
Date: Tue, 20 Jul 2004 22:22:39 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407202222.39239.Antony@Soft-Solutions.co.uk>
References: <Pine.LNX.4.44.0407201652340.20957-100000@signals10.bu.edu>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0407201652340.20957-100000@signals10.bu.edu>
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

On Tuesday 20 July 2004 10:02 pm, Jeffrey C Albro wrote:

> I've seen this referred as un-DNATing.  It makes perfect sense
> that due to the client expecting packets back from the address it sent
> them to that this is required behavior, but can this be turned off or
> controlled?

Sorry - forgot to reply to this bit.

I can think of two ways to avoid it:

1. Turn off connection tracking for the packets you don't want reverse NATted 
(possibly all packets?) with the NOTRACK target.

2. Use iproute2 to do your NAT rules (I believe this is not stateful, and 
therefore doesn't do automatic reverse NAT for you).

Regards,

Antony.

-- 
90% of networking problems are routing problems.
9 of the remaining 10% are routing problems in the other direction.
The remaining 1% might be something else, but check the routing anyway.

                                                     Please reply to the list;
                                                           please don't CC me.


