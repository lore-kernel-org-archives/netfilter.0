From: Jason Opperisano <opie@817west.com>
Subject: Re: SSH Brute force attacks
Date: Sat, 14 May 2005 11:47:23 -0400
Message-ID: <20050514154723.GA24528@bender.817west.com>
References: <427B93EE.3030905@eccotours.dyndns.org>
	<427C4EA3.5090501@riverviewtech.net>
	<4281FC1A.8090000@eccotours.dyndns.org>
	<42824D1E.7040508@riverviewtech.net>
	<42825732.8010206@verisignlabs.com>
	<428259CE.3080708@riverviewtech.net>
	<42825D48.2060003@verisignlabs.com>
	<20050511203452.GA13902@bender.817west.com>
	<4285A29C.1020200@hotpop.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <4285A29C.1020200@hotpop.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Sat, May 14, 2005 at 10:02:52AM +0300, Georgi Alexandrov wrote:
> Jason Opperisano wrote:
> 
> >On Wed, May 11, 2005 at 03:30:16PM -0400, Pete Toscano wrote:
> > 
> >
> >>Freaky.  My output is the same as yours with the exception of the 1.2.11
> >>string.
> >>
> >>recent v1.2.11 options:
> >><snip same stuff that you have>
> >>ipt_recent v0.3.1: Stephen Frost <sfrost@snowman.net>.
> >>http://snowman.net/projects/ipt_recent/
> >>
> >>I'm a little confused about the difference between "recent v1.2.11" and
> >>"ipt_recent v0.3.1"  Is one a kernel component and the other the
> >>userspace part?
> >>   
> >>
> >
> >yes, ipt_recent == kernel module.  the 1.2.11 is the version of the
> >iptables userspace utility.
> >
> > 
> >
> >>I'm also a little confused about p-o-m.  Is this something I can apply
> >>without recompiling my (modular) kernel? 
> >>   
> >>
> >
> >no.
> > 
> >
> I don't agree Jason. You can compile only the needed modules.

that's a *very* dangerous piece of advice.  i'm sure you can find
examples of PoM modules that are completely self-contained code that you
can just compile as a module and copy into your /lib/modules/`uname -r`
tree.  hell--'recent' may even be an example of such a module.  general
advice; however, is that if you add patches from PoM, you recompile both
your kernel and your iptables userspace.  this is true for more patches
in PoM than it is untrue for.  i (for one), prefer not to have a rash of
ppl follow this ill advice and start posting messages of why none of
their nat rules will apply any more.

my 2c...from experience...and from trying to support the
inexperienced...

-j

--
"Peter: You all know how observant I am.
 TV Announcer: And now back to Star Trek.
 Peter: Holy crap. Uhura's black?"
        --Family Guy

