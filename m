From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: next topic:  --limit and --burst-limit
Date: Wed, 30 Oct 2002 13:47:08 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210301343140.24838-100000@localhost.localdomain>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter mailing list <netfilter@lists.netfilter.org>


  i've read three different explanations about these options,
and all three disagree with each other.  so let me start with
a simple question or two.

  first, as i read it, you can use the "--limit" option by itself,
without --burst-limit.  if you do that, then this limit is considered
a *hard* limit -- say 5/sec -- and once you hit that limit, you're
done until the next time unit.  is this correct?

  adding "--burst-limit", on the other hand, allows you to exceed
the first limit, but you end up paying for it down the road.
however, i'm still unclear on what the burst-limit represents
and how it gets recharged.  can someone explain this, preferably
with an example containing numbers?  

rday


