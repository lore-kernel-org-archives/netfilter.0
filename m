From: Jason Opperisano <opie@817west.com>
Subject: Re: Questions on state
Date: Sun, 13 Mar 2005 21:29:38 -0500
Message-ID: <1110767378.19878.15.camel@hubcap.ljm.dom>
References: <200503131623.42711.jsimmons@goblin.punk.net>
	<1110764535.19878.5.camel@hubcap.ljm.dom>
	<200503131809.51240.jsimmons@goblin.punk.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <200503131809.51240.jsimmons@goblin.punk.net>
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

On Sun, 2005-03-13 at 21:09, Jeff Simmons wrote:
> The ip_conntrack module adds ALL connections to the conntrack table? Even ones 
> where the state isn't used by the filter table?

yes.  unless you have compiled in support for the raw table and use the
NOTRACK target to disable  connection tracking for specific connections.

the "-m state --state X" match is just a match, not a directive to do
anything.

-j

--
"Call this an unfair generalization if you must, but old people are
 no good at everything."
	--The Simpsons


