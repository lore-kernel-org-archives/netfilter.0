From: Jason Opperisano <opie@817west.com>
Subject: Re: block uid range in 1 rule with match owner ?
Date: Thu, 20 Jan 2005 16:55:46 -0500
Message-ID: <1106258145.5024.28.camel@hubcap.ljm.dom>
References: <02df01c4ff35$40031570$0a01a8c0@cc8273a>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <02df01c4ff35$40031570$0a01a8c0@cc8273a>
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
To: netfilter@lists.netfilter.org

On Thu, 2005-01-20 at 16:16, abcabc@home.nl wrote:
> How can I block a range of uid's in 1 rule ?
> 
> I tried this, but that gave an error.
> iptables -A OUTPUT -p tcp --match owner --uid-owner 1000:2000 -j DROP
> 
> Is it at all possible?

that's not how the owner match works.  it only matches a single uid. 
dunno how hard it would be to hack the source to support the range
operator, as i know zip about C/C++.

-j

--
"Facts are meaningless. You could use facts to prove anything that's
 even remotely true!"
	--The Simpsons


