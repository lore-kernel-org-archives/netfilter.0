From: Jason Opperisano <opie@817west.com>
Subject: Re: RELATED ICMP packets of type 3
Date: Fri, 11 Feb 2005 10:49:55 -0500
Message-ID: <20050211154955.GA2644@bender.817west.com>
References: <200502111757.16352.e-boogie@yandex.ru>
	<20050211150635.GA2371@bender.817west.com>
	<200502111641.19968.victor@nk.nl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200502111641.19968.victor@nk.nl>
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
To: netfilter@lists.netfilter.org

On Fri, Feb 11, 2005 at 04:41:19PM +0100, Victor Julien wrote:
> > yes.  personally (for whatever that is worth), i allow ICMP Types 3, 11,
> > and 12 [*].
> 
> Will these all be accepted by the accepting all RELATED packets? Or do i need 
> extra rules to allow them?

in theory--they are RELATED.  in practice, i allow them explicitly.
looking at one of my firewalls, it appears as though there are ICMP Type
3 packets that get past the RELATED rule and hit the explicit allow rule,
but the counters for the explicit allow for types 11 and 12 are at 0.

-j

--
"Me lose brain? Uh, oh! Ha ha ha! Why I laugh?"
        --The Simpsons

