From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: Saving IPTable rules..oops
Date: Wed, 29 Dec 2004 15:15:04 -0500 (EST)
Message-ID: <Pine.LNX.4.05.10412291453001.27815-100000@darkstar.sysinfo.com>
References: <1104345151.1976.28.camel@localhost>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1104345151.1976.28.camel@localhost>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "John A. Sullivan III" <jsullivan@opensourcedevelopmentcorp.com>
Cc: Netfilter users list <netfilter@lists.netfilter.org>

On Wed, 29 Dec 2004, John A. Sullivan III wrote:

> On Wed, 2004-12-29 at 13:03, Jason Williams wrote:
> > Morning.
> > 
> > Well, spent a better part of the night playing with IPTables. Tried out 
> > some rules, tweaked this, broke that. Was a lot of fun.
> > 
> > Anyway, as I am getting ready to make one of my servers go live, I realized 
> > something that I completely overlooked. Very important thing I might add.
> > 
> > Basically, once you put all your rules into IPTables via the command line, 
> > how do you save your rules? I saw a command, iptables-save, but that just 
> > outputs the rules in a readable format.
> > 
> > I started thinking and came up with the following:
> > 
> > 1) Does iptables read the init script in /etc/init.d/ upon bootup of a 
> > server/box and use those rules for the system?
> > 
> > or
> > 
> > 2) Does it read a plain text file some where an use those rules instead?
> > 
> > wasn't quite sure and since im going on 22 hours without sleep, im positive 
> > I missed it some where.
> > 
> > With that in mind, was hoping someone could fill in the details.
> > 
> > IF it is the case the the system reads the iptables init script upon 
> > bootup/restart, that means I need to work on my scripting. :)
> > 
> > Anyways, hoping for a little clarity here.
> > 
> > Cheers,
> > 
> > 
> > Jason
> The way I've typically seen it work is that the init.d/iptables script
> calls iptables-restore and passes it the /etc/sysconfig/iptables file. 
> This file is written when you do init.d/iptables save.


perhaps on redhat and debian, and maybe suse systems that have moved away
from the standard upon which linux was formed, namely bsd.  Those dists
that retain their bsd layouts have no /etc/init.d directory, everything
lies under /etc/rc.d/.  They also lack the red-hat layout of a
/etc/sysconfig/ directory.  And it's a shame things are seperating out in
the linux world like this as many of the tools and toys bewing created
either conform to the new redhat layouts or follow older established
standards.  Thus, some tools that have been coming out the past few years
are only good under redhat or debian or suse, and fail to function if they
compile at all, without being hacked prior to a make, and sometimes my
skills are not enough to hack them into compiling at all uunder a
different, more standard dist. <sigh>


Thanks,

Ron DuFresne
-- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        admin & senior security consultant:  sysinfo.com
                        http://sysinfo.com

...Love is the ultimate outlaw.  It just won't adhere to rules.
The most any of us can do is sign on as it's accomplice.  Instead
of vowing to honor and obey, maybe we should swear to aid and abet.
That would mean that security is out of the question.  The words
"make" and "stay" become inappropriate.  My love for you has no
strings attached.  I love you for free...
                        -Tom Robins <Still Life With Woodpecker>


