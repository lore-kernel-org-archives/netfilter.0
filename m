From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: more questions about kernel config options for iptables
Date: Tue, 8 Apr 2003 07:01:34 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0304080644440.25860-100000@dell>
References: <200304080304.25765.netfilter@newkirk.us>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200304080304.25765.netfilter@newkirk.us>
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
To: Joel Newkirk <netfilter@newkirk.us>
Cc: iptables mailing list <netfilter@lists.netfilter.org>

On Tue, 8 Apr 2003, Joel Newkirk wrote:

> On Monday 07 April 2003 05:18 pm, Robert P. J. Day wrote:

> >   first, the basic Connection tracking option claims to be
> > necessary for masq/NAT.  what value is that option if it is
> > the only one selected?  it may be *necesasry* for masq/NAT,
> > but it certainly doesn't seem to be *sufficient*.  what is
> > the value of selecting that single option to the exclusion
> > of all others.  what does it allow you to do?
> 
> Conntrack is what supports stateful filtering - without it you won't have 
> the "--state" match, and can only filter explicitly on IPs, port 
> numbers, etc.

not quite the question i was asking.  read on ...

> >   next, notice that "IP tables support" also claims to be
> > necessary for masq/NAT.  if that's the case, it would seem
> > that these two options should somehow be interdependent.
> 
> Well, if you're going to use MASQUERADE then you need iptables support, 
> even if you're not going to use iptables for any filtering.

right, that's what the kernel config options seem to suggest.
so what is the value of selecting *only* "Connection tracking"
if you don't select "IP tables support" as well?  note that,
based on the dependencies in the kernel config process, this is
certainly allowable, but it's not clear to me what this would
represent.

RECAP:  just to make sure folks understand what i'm trying to 
clarify, here are two "features" of the kernel config process
for netfilter i find confusing:

1) you can select "IP tables support" without selecting one
   of its submenu options, "Packet filtering".  what is the
   possible value of this?  what can you do?  as i read it,
   perhaps it means that you can still do filter-less
   NAT and masquerading.  if that's the case, i can accept
   that.

2) you can select "Connection tracking" (which is allegedly
   required for NAT/masq), without selecting "IP tables support",
   which also claims to be necessary for NAT/masq.  this
   suggests that "Connection tracking" should have a dependency
   of "IP tables support", no?

i have three tentative goals here:

a) to clarify what each of the NF kernel config options
   represents

b) to make sure all of the dependencies are represented

c) to clean up the menu structure so that it makes more
   sense, and possibly add more useful info to the help
   screens

i'm quite willing to move this discussion to the kernel
mailing list if it's more appropriate there, but i figured
i'd start here first.

rday


