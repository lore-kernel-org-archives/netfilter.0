From: "James B. Hiller" <jhiller@visi.net>
Subject: Re: linux-2.6.9-rc1 compilation and configuration issue (fwd)
Date: Wed, 8 Sep 2004 16:41:32 -0400 (EDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200409082041.i88KfW6j017244@bassett.home.org>
References: <413F56CB.2090509@pbl.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <413F56CB.2090509@pbl.ca> from "Aleksandar Milivojevic" at Sep 08,
	2004 02:00:27 PM
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Cc: netfilter@lists.netfilter.org

Hi!

> Jose Maria Lopez wrote:
> [snip]
> > there are things simply impossible.
[snip snip]
> 
> Becoming way off topic, anyhow...

Well, actually, not really - from following a post that Jason provided me
yesterday in response to my re-posted question, you can easily see how
the modularity/patching issue is to some degree a factor in the behavior
I was asking about.

Here was Jason's post to me; notice the post he references:
---------------------------------------------------
On Tue, 2004-09-07 at 19:33, James B. Hiller wrote:
> Hi!
> 
> No takers?  Or have I put this in the wrong forum?  If I have, please
> let me know where to go with it.

[snip]

2.6.9-rc1 seems pretty bleeding edge...  the 2.6 series has kind of
become a test branch as it is, but sheesh--that's really out there.  do
you have a "gotta have it" reason to run this kernel?  if not--i'd say
stick with the "release" version:  2.6.8.1...  seems these kind of
compilation issues would be par-for-the-course on an "rc" kernel.

anyways...if you must--you should probably be following the
netfilter-devel list (and linux-kernel for that matter)--check out the
post from Harald Welte (with patch):

http://marc.theaimsgroup.com/?l=netfilter-devel&m=109346594923412&w=2
-----------------------------------------------------

If you follow that one backward and forward, you'll see other very
related patch/modularity discussion, and how the issue most likely
influences exactly what I asked about.

And also note that it became a topic on both the netfilter-devel list
and the linux-kernel list.

So... I'd say, not OT that much, or even at all!

BTW - from the info in that thread, I more or less got the answer I was
trying to get:  my config choices most likely should be expected to work;
it's principally an issue with this particular release; and I should expect
that it will get better.

thx,
jbh

