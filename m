From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ipt_string...
Date: Thu, 6 May 2004 18:43:12 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405061843.12557.Antony@Soft-Solutions.co.uk>
References: <20040506172636.31443.qmail@web40702.mail.yahoo.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040506172636.31443.qmail@web40702.mail.yahoo.com>
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

On Thursday 06 May 2004 6:26 pm, udo wrote:

> Hello,
>
> Does the string match function better (uses less CPU)
> when matching long patterns or is it better to keep
> the patterns as short as possible?

My advice is not to use the string match at all, or if you do, remember that 
it will not be 100% effective.

The reason is that the match works on IP packets, not on connection streams, 
and therefore if you wanted to match my name "Antony Stone", and it turned 
out that my first name was at the end of one packet, and my second name was 
at the start of the next packet, the match would fail - netfilter would not 
trigger in this situation.

I would recommend you look at solutions which work at the application layer 
instead of the network routing layer for this sort of thing.   Depending on 
exactly what it is you're trying to do, Snort might be a good place to start.

Regards,

Antony.

-- 
90% of networking problems are routing problems.
9 of the remaining 10% are routing problems in the other direction.
The remaining 1% might be something else, but check the routing anyway.

                                                     Please reply to the list;
                                                           please don't CC me.


