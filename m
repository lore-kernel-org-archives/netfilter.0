From: "John A. Sullivan III" <jsullivan@opensourcedevelopmentcorp.com>
Subject: Re: Saving IPTable rules..oops
Date: Wed, 29 Dec 2004 17:29:13 -0500
Message-ID: <1104359353.1972.40.camel@localhost>
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
To: "R. DuFresne" <dufresne@sysinfo.com>
Cc: Netfilter users list <netfilter@lists.netfilter.org>

On Wed, 2004-12-29 at 15:15, R. DuFresne wrote:
<snip>
> > > Jason
> > The way I've typically seen it work is that the init.d/iptables script
> > calls iptables-restore and passes it the /etc/sysconfig/iptables file. 
> > This file is written when you do init.d/iptables save.
> 
> 
> perhaps on redhat and debian, and maybe suse systems that have moved away
> from the standard upon which linux was formed, namely bsd.  Those dists
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
> 
> 
> Thanks,
> 
> Ron DuFresne

Thanks for pointing that out, Ron.  I was going to mention it but then
thought it would just muddy the waters.  We use both SYSV and BSD style
scripts in the ISCS project.  The iptables script in the rc directories
can still call iptables-restore and reference an iptables file.  That's
what we typically do.  If I recall correctly, isn't there also a step in
BSD style initiations that can call SYSV style scripts? I thought I
recalled seeing that on Slackware - John
-- 
John A. Sullivan III
Open Source Development Corporation
Financially sustainable open source development
http://www.opensourcedevel.com


