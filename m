From: Jason Opperisano <opie@817west.com>
Subject: Re: Saving IPTable rules..oops
Date: Wed, 29 Dec 2004 15:29:07 -0500
Message-ID: <1104352147.7318.73.camel@hubcap.ljm.dom>
References: <Pine.LNX.4.05.10412291453001.27815-100000@darkstar.sysinfo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.05.10412291453001.27815-100000@darkstar.sysinfo.com>
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
To: netfilter@lists.netfilter.org

On Wed, 2004-12-29 at 15:15, R. DuFresne wrote:
> perhaps on redhat and debian, and maybe suse systems that have moved away
> from the standard upon which linux was formed, namely bsd. 

linux has no roots in *BSD.  linux uses the concepts of run levels;
wheres *BSD does not.  run levels are a concept taken from System V
style systems like Solaris 2.x+. 

>  Those dists
> that retain their bsd layouts have no /etc/init.d directory, everything
> lies under /etc/rc.d/.  They also lack the red-hat layout of a
> /etc/sysconfig/ directory.  And it's a shame things are seperating out in
> the linux world like this as many of the tools and toys bewing created
> either conform to the new redhat layouts or follow older established
> standards.  Thus, some tools that have been coming out the past few years
> are only good under redhat or debian or suse, and fail to function if they
> compile at all, without being hacked prior to a make, and sometimes my
> skills are not enough to hack them into compiling at all uunder a
> different, more standard dist. <sigh>

the linux standards base is an attempt to address your concerns:

  http://www.linuxbase.org/

my guess is that the /etc/sysconfig/ concept will be part of it (if it's
not already--i haven't read through the whole thing).

-j

--
"Another day, another box of stolen pens."
	--The Simpsons


