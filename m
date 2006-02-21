From: "Gary W. Smith" <gary.w.smith@primeexalia.com>
Subject: Re: --reject-with icmp-host-unreachable VS DROP
Date: Tue, 21 Feb 2006 09:06:50 -0800
Message-ID: <1140541610.6320.6.camel@pxt-lp04.pxt.primeexalia.com>
References: <43FB3A42.3040301@eccotours.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43FB3A42.3040301@eccotours.co.za>
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
To: Brent Clark <bclark@eccotours.co.za>
Cc: netfilter@lists.netfilter.org

First off, you have a double -j in there.  Secondly, REJECT is similar,
but not the same as DROP.  In either case, REJECT is the end of the
chain.  So it's useless to put the -j DROP there.

But the first one should be fine.  If you are worried about continued
DOS attacks, etc, look at -j TARPIT.  It requires you to recompile the
kernel but it's the best thing for slowing people down.

Gary Smith

On Tue, 2006-02-21 at 18:05 +0200, Brent Clark wrote:
> Hi all
> 
> I have a default policy of DROP for the INPUT, OUTPUT AND FORWARD.
> 
> I was thinking what just before the end of a FORWARD chain, I would use something like this.
> 
> $IPT -t filter -A FORWARD -j -j REJECT --reject-with icmp-host-unreachable
> $IPT -t filter -A FORWARD -j DROP
> 
> Would anyone be kind to advise me on whether this is ok.
> 
> I defianltly think it will slow some applications from continuously retrying.
> 
> Kind Regards
> Brent Clark
> 
> 

