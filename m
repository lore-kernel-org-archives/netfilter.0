From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: Saving IPTable rules..oops
Date: Thu, 30 Dec 2004 01:33:46 -0500 (EST)
Message-ID: <Pine.LNX.4.05.10412292155200.29138-100000@darkstar.sysinfo.com>
References: <1104352147.7318.73.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1104352147.7318.73.camel@hubcap.ljm.dom>
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
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

On Wed, 29 Dec 2004, Jason Opperisano wrote:

> On Wed, 2004-12-29 at 15:15, R. DuFresne wrote:
> > perhaps on redhat and debian, and maybe suse systems that have moved away
> > from the standard upon which linux was formed, namely bsd. 
> 
> linux has no roots in *BSD.  linux uses the concepts of run levels;
> wheres *BSD does not.  run levels are a concept taken from System V
> style systems like Solaris 2.x+. 


Although if continued <this thread> it may have to go off list <moved to  
another list?>, be renamed, etc, it might be argued that all things unix
are BSD based, at lesat since unix is often refered to as tcp/ip based
which did come out of BSD/Berkley.  Minix used a BSD based file system, as
did linux in it's early days, but, I digress, and will refrain, though
find such discusions interestingly fascinating <smile>...

> 
> >  Those dists
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
> 
> the linux standards base is an attempt to address your concerns:
> 
>   http://www.linuxbase.org/
> 

I tapped Mr Volkerding on this back when LSB2.0 was publically announced.
He was not keen to the whole concept.  How did he put it, something on the
order of it being an attempt to "getting everyone to agree that Red Hat is
the standard Linux".  Certification is not free, in fact it requires alot
of time, resources, work, and cash to do so.  Mr Volkerding stressed the
opinion that it was a fruitless endeavour that bloated the whole OS with
extended libs, and something less then a sane approach to
'standardization'.  I was left with the impression that Slackware will not
go the LSB route, at least not in the forseable future.

> my guess is that the /etc/sysconfig/ concept will be part of it (if it's
> not already--i haven't read through the whole thing).
> 

Not as of yet that I saw in the 2.1 version, /etc is not so deeply defined
that I saw, but, most likelyt Red-hat will get it's way....


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




