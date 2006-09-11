From: Andrew Schulman <andrex-cmaem7PIVQQM4YKboWzA4l6hYfS7NtTn@public.gmane.org>
Subject: where did the condition and time extensions go?
Date: Mon, 11 Sep 2006 05:44:32 -0400
Message-ID: <pubag25l8vm6pjquvfvagpoo0pg5oo4oo7@4ax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:netfilter-request-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: netfilter-bounces-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org
Errors-To: netfilter-bounces-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org

OK, I figure this has to be a FAQ, but I can't find the answers around
anywhere.

What the hell happened to most of the extensions in patch-o-matic-ng?  I
found a reference somewhere to say that they've been "retired".  Too bad
for us users.  I happen to depend on the condition and time patches, which
apparently have been retired.

Are there any plans to restore the removed patches?  Have they been placed
in a hold queue somewhere, awaiting work to make them functional again?  I
thought that was the purpose of the old "extra" set et al.

Looking at the latest iptables source, I see it includes source for the
condition and time extensions.  But these two extensions are missing from
pom-ng and from the 2.6.17 kernel source (AFAICT).  Does this mean that the
latest iptables can use them, without setting kernel options?  Or do we
have a conflict between iptables, which includes them, and kernel/pom-ng,
which don't?

Was this change announced to users anywhere?  If not, it doesn't treat us
users, who depend on the deleted material, very well.

And in fact, as of today, the last several days' snapshots of pom-ng are
completely empty.  What the hell is going on at netfilter.org?

Sorry for my frustration.  It would probably help if I could find somewhere
where someone troubled to explain all of this when it happened.

Andrew.

--
To reply by email, change "deadspam.com" to "alumni.utexas.net"


