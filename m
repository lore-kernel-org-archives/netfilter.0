From: Jason Opperisano <opie@817west.com>
Subject: RE: blocking msn
Date: Thu, 23 Dec 2004 11:32:48 -0500
Message-ID: <1103819568.6478.86.camel@hubcap.ljm.dom>
References: <20041223162009.84CF06E5D8@smtp.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041223162009.84CF06E5D8@smtp.sterenborg.info>
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

On Thu, 2004-12-23 at 11:20, Rob Sterenborg wrote:
> You can do that, but last time I checked there were multiple IP's that
> MSN Messenger connects to.
> So, when you block one it will try another. You'll end up with a list of
> MSN servers to block.

yeah--i use the squid method, as i prefer not to have to maintain lists
of IP addresses/netblocks in a never-ending loop, as opposed to a single
line in squid.conf.

-j

--
"I've added an extra ingredient just for you.  The merciless peppers
 of Quetzlzacatenango!  Grown deep in the jungle primeval by the
 inmates of a Guatemalan insane asylum."
	--The Simpsons


