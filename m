From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: Weird TCP flags?
Date: Fri, 12 Dec 2003 11:05:19 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312121105.19702.JALaramie@Loudoun-Fairfax.com>
References: <003101c3c065$f61ad790$13fea8c0@melita.com> <200312120941.44245.JALaramie@Loudoun-Fairfax.com> <200312121438.24448.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200312121438.24448.Antony@Soft-Solutions.co.uk>
Content-Disposition: inline
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
To: Netfilter <netfilter@lists.netfilter.org>

On Friday 12 December 2003 09:38, Antony Stone wrote:
> On Friday 12 December 2003 2:41 pm, Jeffrey Laramie wrote:
> > Duh! Boy do I feel like an idiot. Last night I blamed it on
> > sleeplessness. Today I'll blame it on coffee. Yup, that's it, I haven't
> > had enough coffee yet.
>
> Time for a weekend, perhaps, Jeff?
>

Yeah, I definitely need a vacation. Next time I post something stupid like 
that *smack* me and say "Shut Up Jeff, let me answer this!"

The TTL of his packet was about 60 secs lower than what I usually see which 
makes Chris's explanation sound likely. How does TTL get calculated? Does 
each host set a new TTL for it's packets or does it calculate it from the 
time of the original SYN packet? In this situation which host is slow 
responding, the server?

Jeff

