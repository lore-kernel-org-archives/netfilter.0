From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: Saving IPTable rules..oops
Date: Thu, 30 Dec 2004 01:45:14 -0500 (EST)
Message-ID: <Pine.LNX.4.05.10412300139250.29138-100000@darkstar.sysinfo.com>
References: <1104359353.1972.40.camel@localhost>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1104359353.1972.40.camel@localhost>
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

> On Wed, 2004-12-29 at 15:15, R. DuFresne wrote:
> <snip>
> > > > Jason
> > > The way I've typically seen it work is that the init.d/iptables script
> > > calls iptables-restore and passes it the /etc/sysconfig/iptables file. 
> > > This file is written when you do init.d/iptables save.
> > 
> > 
> > perhaps on redhat and debian, and maybe suse systems that have moved away
> > from the standard upon which linux was formed, namely bsd.  Those dists
> > that retain their bsd layouts have no /etc/init.d directory, everything
> > lies under /etc/rc.d/.  They also lack the red-hat layout of a
> > /etc/sysconfig/ directory.  And it's a shame things are seperating out in
> > the linux world like this as many of the tools and toys bewing created
> > either conform to the new redhat layouts or follow older established
> > standards.  Thus, some tools that have been coming out the past few years
> > are only good under redhat or debian or suse, and fail to function if they
> > compile at all, without being hacked prior to a make, and sometimes my
> > skills are not enough to hack them into compiling at all uunder a
> > different, more standard dist. <sigh>
> > 
> > 
> > Thanks,
> > 
> > Ron DuFresne
> 
> Thanks for pointing that out, Ron.  I was going to mention it but then
> thought it would just muddy the waters.  We use both SYSV and BSD style
> scripts in the ISCS project.  The iptables script in the rc directories
> can still call iptables-restore and reference an iptables file.  That's
> what we typically do.  If I recall correctly, isn't there also a step in
> BSD style initiations that can call SYSV style scripts? I thought I
> recalled seeing that on Slackware - John
> 

Which surprised me when first seeing it in early Slackware versions and to
this date, but, it's description seems to clarify;

sysvinit (init, the parent of all processes)

System V style init programs by Miquel van Smoorenburg
that control the booting and shutdown of your system. These support a
number of system runlevels, each with a specific set of utilities
spawned.  For example, the normal system runlevel is 3, which
starts agetty on virtual consoles tty1 - tty6. Runlevel 4 starts xdm.
Runlevel 0 shuts the system down.

Seems to more support others in this thread about the basis of linux
systems <GNU?> design...

Now the scripts do include a start;stop;restart functionality, that was
lacking in earlier versions <which one could easily add in earlier, I
still run a system with a modified 3.5 version of Slackware and had to add
that functionality to parts of the rc.* files I wanted the functionality
for...

Still all housed unter /etc/rc.d/

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


