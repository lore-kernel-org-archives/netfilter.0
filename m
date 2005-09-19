From: don-temp2@isis.cs3-inc.com (Don Cohen)
Subject: loss of MIRROR target
Date: Mon, 19 Sep 2005 09:05:01 -0700 (PDT)
Message-ID: <20050919160501.C406A1A81CC@isis.cs3-inc.com>
Return-path: <netfilter-bounces@lists.netfilter.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


Now that I try to upgrade from RH8 to FC4 I notice that the MIRROR
target has been removed from kernel 2.6.  A web search shows that I'm
only about 2 years late in noticing this:
https://lists.netfilter.org/pipermail/netfilter-devel/2003-August/012193.html
So now I file my complaint 2 years late.
I argue that the message I sent a few months ago:
https://lists.netfilter.org/pipermail/netfilter-devel/2005-June/019999.html
illustrates a perfectly legitimate use of this target.  
Furthermore, I actually want to do it.

I suppose I could get almost the same result by doing snat+dnat, but
this is more expensive and, worse, opens up an avenue for attacking me
by filling my connection tables.
I suppose I could install the target in my own kernel.  Is this actually
straight forward?  Where are instructions?  Of course, it becomes a
maintenance problem when you try to track new kernels distributed with
Fedora, which is what I imagined trying to do.  Or is there some
solution to that problem?

Naturally, my first choice would be for MIRROR to be restored to
future kernels so eventually I'd get it back as part of a regular
upgrade.  Any chance?

