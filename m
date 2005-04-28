From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: NAT to a client
Date: Thu, 28 Apr 2005 14:28:41 -0500
Message-ID: <42713969.2000609@riverviewtech.net>
References: <652c9e655b89.655b89652c9e@vsnl.net>	<20050428143538.GA29900@bender.817west.com>	<42711B92.105@riverviewtech.net>
	<20050428173838.GA30382@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050428173838.GA30382@bender.817west.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

> client connects to squid, squid connects to web server; two separate
> unrelated connections (besides the fact that 1 inspires 2).  i
> understand that the number 3128 falls within the range 1024 - 65535; and
> if squid is configured to bind only to the internal interface, you'd
> have a 1/64511 chance of seeing a squid server use sport = 3128 and
> dport = 80 to fetch content from an origin web server, but it's not
> likely enough to deserve a dedicated filter rule, IMHO.

*nod*

I was very aware and would expect that the there were two distinctly different TCP connections, even though the 2nd one is caused by the 1st one.  What I was not aware of is if Squid would send traffic to web servers from a known port and thus would be able to filter based on that.  I can't say as I'm surprised or disappointed by that fact.



Grant. . . .

