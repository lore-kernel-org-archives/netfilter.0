From: "James B. Hiller" <jhiller@visi.net>
Subject: Re: linux-2.6.9-rc1 compilation and configuration issue (fwd)
Date: Tue, 7 Sep 2004 21:55:54 -0400 (EDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200409080155.i881ts4K012789@bassett.home.org>
References: <1094603246.1751.25.camel@wolfpack.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1094603246.1751.25.camel@wolfpack.ljm.dom> from "Jason
	Opperisano" at Sep 07, 2004 08:27:27 PM
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
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

Hi Jason.

> On Tue, 2004-09-07 at 19:33, James B. Hiller wrote:
> > Hi!
> > 
> > No takers?  Or have I put this in the wrong forum?  If I have, please
> > let me know where to go with it.
> 
> i'm not really qualified to answer this question, (which has never
> stopped me before)...and hey--beggars can't be choosers...  ;-)

You bet.  Thanks for giving it a throw.

> 2.6.9-rc1 seems pretty bleeding edge...  the 2.6 series has kind of
> become a test branch as it is, but sheesh--that's really out there.  do
> you have a "gotta have it" reason to run this kernel?  if not--i'd say
> stick with the "release" version:  2.6.8.1...  seems these kind of
> compilation issues would be par-for-the-course on an "rc" kernel.

With maybe one or two exceptions beginning in late 2.4.X when I started
using rc's and mmX, no, clean compilation hasn't been an issue.  My main
reason for moving with each change is that for about a year, I've been
working with a developer who's trying to get DMA-related bugs out of
the switch from using SCSI emulation to having SCSI handling built into
the IDE driver.  Until that's done, I can't use DMA with my CD writer,
where before I could.  His bugfixes have been going into 2.6.7+, a bit at
a time, through the mm branch.

> anyways...if you must--you should probably be following the
> netfilter-devel list (and linux-kernel for that matter)--check out the
> post from Harald Welte (with patch):
> 
> http://marc.theaimsgroup.com/?l=netfilter-devel&m=109346594923412&w=2

Thx!  I haven't been looking at netfilter-devel, since until now, it was
a non-issue for me.  What that particular item, and a few after it, show
is that indeed there is a known issue both with NAT in general and
double NAT in 2.6.9-rc1; and that the hang I'm getting is affecting others
as well.  So that tells me I don't need to try to report it; I'm not using
a dumb netfilter configuration; and that it may get better in -rc2++.  Since
my DMA issue isn't done yet anyway, no harm in laying back from -rc1.

I really appreciate the pointer!

regards,
jbh

