From: Les Mikesell <les@futuresource.com>
Subject: Re: Saving IPTable rules..oops
Date: Wed, 29 Dec 2004 14:30:39 -0600
Message-ID: <1104352238.2940.29.camel@moola.futuresource.com>
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
Cc: Netfilter users list <netfilter@lists.netfilter.org>, "John A. Sullivan III" <jsullivan@opensourcedevelopmentcorp.com>

On Wed, 2004-12-29 at 14:15, R. DuFresne wrote:

> > The way I've typically seen it work is that the init.d/iptables script
> > calls iptables-restore and passes it the /etc/sysconfig/iptables file. 
> > This file is written when you do init.d/iptables save.
> 
> 
> perhaps on redhat and debian, and maybe suse systems that have moved away
> from the standard upon which linux was formed, namely bsd.

Linux is a kernel and it leans more in the sysV direction.  As I
recall, the early versions supported termio.h, not sgtty.h before things
converged to the posix termios.h

> Those dists
> that retain their bsd layouts have no /etc/init.d directory, everything
> lies under /etc/rc.d/. 

Retain?  Perhaps you mean 'were built separately', omitting the sysv
init functionality?

> And it's a shame things are seperating out in
> the linux world like this as many of the tools and toys bewing created
> either conform to the new redhat layouts or follow older established
> standards.  

SysV and bsd styles separated before Linux was invented. It's a shame
they never converged and that bsd style distributions still don't have
a decent way to start and stop services.

---
  Les Mikesell
   les@futuresource.com



