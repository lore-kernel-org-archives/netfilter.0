From: Jason Opperisano <opie@817west.com>
Subject: Re: iptables and SMP performance
Date: Mon, 24 Jan 2005 18:58:18 -0500
Message-ID: <1106611098.5057.61.camel@hubcap.ljm.dom>
References: <1106588554.8961.41.camel@d-phiggins-lnx.rovingplanet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1106588554.8961.41.camel@d-phiggins-lnx.rovingplanet.com>
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

On Mon, 2005-01-24 at 12:42, Patrick Higgins wrote:
> Any suggestions?

have you considered (or are you already using) better NICs?  this is
mostly hearsay gleaned from listening to the developers on various lists
(netfilter-dev and openbsd-misc), but certain cards seem to be more
"interrupt heavy" than others.  the ones that seemed to get bashed the
most are the broadcom cards, and the ones that seem to receive the most
praise are the intel gigabit server adapters (i assume you are using
gigE adapters regardless of the speed of your links, i further assume
that these gigE cards are plugged into independent 64-bit PCI-X buses). 
also--if you're already using the intel gigE cards--are you using the
less "free-as-in-speech" but less buggy and better performing driver
from intel vs. the one that RH ships with their kernel?

just a few thoughts outside the "we need more CPU" box...as i have never
been under the impression that something like an in-kernel packet filter
could benefit from multiple CPUs (other than the fact that you can bind
all non-kernel processes to other CPU, for a minimal 10% or so
performance gain).

-j

--
"If something is to hard to do, then it's not worth doing."
	--The Simpsons


