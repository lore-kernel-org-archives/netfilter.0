From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: Weird TCP flags?
Date: Fri, 12 Dec 2003 12:41:37 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1071250896.1973.10.camel@grendel>
References: <003101c3c065$f61ad790$13fea8c0@melita.com>
	 <200312120941.44245.JALaramie@Loudoun-Fairfax.com>
	 <200312121438.24448.Antony@Soft-Solutions.co.uk>
	 <200312121105.19702.JALaramie@Loudoun-Fairfax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200312121105.19702.JALaramie@Loudoun-Fairfax.com>
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
To: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Cc: netfilter <netfilter@lists.netfilter.org>

On Fri, 2003-12-12 at 11:05, Jeffrey Laramie wrote:
>
> Yeah, I definitely need a vacation. Next time I post something stupid like 
> that *smack* me and say "Shut Up Jeff, let me answer this!"

Be careful what you wish for... ;-)

> The TTL of his packet was about 60 secs lower than what I usually see which 
> makes Chris's explanation sound likely. How does TTL get calculated?

Actually, the TTL (63) is dead on if his server is running on Linux or
BSD. Based on the window and packet size, I would guess Linux.

Per the RFC, a host is to "suppose" to decrement the TTL by 1 for every
hop crossed, as well as every second the packet is queued. So for
example a router holding a packet for 5 seconds prior to transmitting
should decrement the TTL by 6.

In reality, most/all devices just decrement by one for hop and don't
look at the time component. IMHO this is useful for us as as a community
as it makes it easier to use TTL for passively fingerprinting packets.

HTH,
C



