From: Ranjeet Shetye <ranjeet.shetye2@zultys.com>
Subject: Re: [Re: Newby]
Date: Mon, 27 Dec 2004 17:13:31 -0800
Message-ID: <20041228011331.GA12894@ranjeet-pc2.zultys.com>
References: <Pine.LNX.4.05.10412271735140.18976-100000@darkstar.sysinfo.com>
	<1104187452.7318.3.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1104187452.7318.3.camel@hubcap.ljm.dom>
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


I use Gentoo when I want to learn things, and ArchLinux when I want
things to just run e.g. data server at home.

Original poster should look into ArchLinux (www.archlinux.org). It is a very
minimalistic, binary-based Linux distro with a very good package manager 
(pacman). Depending on the repository you tap into, you can also access
bleeding edge stuff.

ArchLinux also has a very BSD like init system. I've never been a fan of
slackware cos it is too much work. If I am going to run slackware and manage
packages manually (swaret didn't quite cut it for me), I might as well
run BSD, and benefit from freebsd's ports system, use portsupgrade and also
depend on openbsd's pf.

For a server Linux kernel, I use cko-sources with
/proc/sys/kernel/interactive set to 0.

Hope that helps.


* Jason Opperisano (opie@817west.com) wrote:
> On Mon, 2004-12-27 at 17:38, R. DuFresne wrote:
> > redhat in my experience is one of the harder dists to par down to minimum
> > installs.  Course, I'm a slackware bigot in the linux realm, YMMV.  For a
> > minimum install on slackware one requires the a series and the n series at
> > least.  Though one can go into each series and pick particular packages as
> > needed/required as well.  Having only slight experience with debain and
> > suse, I can't speak for those dists at all.
> 
> suse has a minimal install, which is nice.  customizing a kernel in suse
> is not.
> 
> the ultimate minimalistic install; IMHO, is gentoo.  not for the
> impatient types though.
> 
> -j
> 
> --
> "Getting out of jury duty is easy. The trick is to say you're
>  prejudiced against all races."
> 	--The Simpsons
> 
> 

-- 
Ranjeet Shetye
Senior Software Engineer
Zultys Technologies
Ranjeet dot Shetye at Zultys dot com
http://www.zultys.com/
 
The views, opinions, and judgements expressed in this message are solely those of
the author. The message contents have not been reviewed or approved by Zultys.


