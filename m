From: Scott Lamb <slamb@slamb.org>
Subject: Re: how to block kazaa ?
Date: Tue, 25 Feb 2003 23:28:23 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E5C5077.9020905@slamb.org>
References: <003d01c2dd40$fe922030$210aa8c0@sabirin> <200302252242.25175.netfilter@newkirk.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200302252242.25175.netfilter@newkirk.us>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Joel Newkirk wrote:
> But newer implementations apparently support port-hopping, so it seems 
> that the only confirmed way to stop it with iptables is with the STRING 
> match from patch-o-matic, and block anything with the string "kazaa" 
> (don't recall case requirements) in it.  Compiling a custom 
> kazaa-blocking kernel may be more than you want to do, though.

This strikes me as a pretty bad idea; it'll block more than just kazaa
packets. For one thing, it would block a description of how to implement
the block, unless it were obfuscated to get past itself, which seems
silly to me. And maybe people talking about kazaa also. And even random
binary sequences aren't that unlikely to have problems. The odds of a
given seven random bytes matching are only 1/2^(5*8)=1/2^40. But if you
transfer 1GB/day, multiply that by (2^30)/5. Then you're talking about
odds of 5 in 1024 that you'll have at least one random packet blocked
per day. I predict emails, compressed files, etc. that won't transfer
for no apparently reason because part of it consistently won't transfer.

> Also, if the primary bottleneck is outbound, you might find that using 
> the mangle table in prerouting to set TOS for certain desirable traffic 
> and enacting pfifo queuing discipline will help a great deal - IE change 
> TOS to a favorable value (0x10 perhaps) for specific traffic like HTTP 
> SMTP POP3 IMAP or any VNC or such and then setting TOS to a 'bulk 
> traffic' value (0x02 for example) for the remainder, or for the P2P 
> traffic if it is identifiable.  The pfifo qdisc will always send the 
> 0x10 traffic, and send 0x02 only if there is nothing else waiting to be 
> sent.

I like this much more. It solves the real problem of bandwidth usage
while still allowing them to do it. And I'll guess that the port hopping
only moves on if it doesn't work, not if it has a less favorable TOS
value. So it will stay on the easily-identifiable ports. Or like you
said, you could increase the TOS for packets you're sure aren't P2P
stuff if that doesn't work out.

Scott



