From: "Gary Cote" <gcote@transat-tech.com>
Subject: re: pptp patch
Date: Thu, 19 Jun 2003 11:19:31 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OKEKIACJCGNKMLKPKIIKAEJCCOAA.gcote@transat-tech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

John,

I also need to to route pptp traffic through a box with 
recent kernel revisions (2.4.20-18.7 for me at the moment). 
The linux box is neither the pptp client nor server. It's 
just a router/NAT. Would you be so kind as to forward 
anything you might find out over to me? Once I know your
address, I'll do the same.

(sorry for the "me too" post on the list, but I subscribed
 to the group after your posting, and the archive masks out 
 email addresses.)

A couple questions:

. Am I correct in understanding that there are two pptp
  patches out there? One against the latest netfilter
  sources, and the John Hardin/Brian Kushak patch against
  earlier revisions?
  . Is the first one the patch-o-matic extra/pptp-conntrack-nat.patch?

. You said Brian Kushak's 2.4.19 patch won't work against 
  2.4.21. Do you simply mean that patch reported errors, 
  or have you looked into what it would take to port the
  patch to recent kernels? I've taken a quick look through
  it and saw the code has been redesigned in some spots,
  so it's not a simple cut-and-paste job. If it's already
  known to be a lost cause, then I won't waste any more time
  looking at it.

. Your post said you built 2.4.21 netfilter with pptp support.
  I guess this refers back to my first question. Are you
  referring to the pptp-conntrack-nat.patch?

Once I get my head screwed on straight about all this stuff,
and figure out what ground's already been covered, maybe we
can figure out how to get it to work for both of us.

thanks




