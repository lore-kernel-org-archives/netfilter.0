From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: ROUTE  woes ?
Date: Tue, 23 Aug 2005 15:52:47 -0500
Message-ID: <200508231552.47761.rob0@gmx.co.uk>
References: <20050823203317.5EA2749EE@sorry.no-ip-here.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050823203317.5EA2749EE@sorry.no-ip-here.net>
Content-Disposition: inline
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

On Tuesday 2005-August-23 15:34, Ruben Cardenal wrote:
> > If all netfilter drivers were built as modules, is an entire
> > compile / reboot necessary? Can you just get away with a "make
> > modules" (and "make modules_install") if the POM drivers are the
> > only thing you're changing?
>
>   Where did I say reboot, dude? :) When you say "recompile your
> kernel" you know you are refering to "make the needed changes, issue
> the needed actions"

Sometimes not, like if a new module requires changing something in a 
driver that was built in. What I was really asking was if POM needs any 
hooks that might not exist in the kernel, and I guess you have answered 
that.

> :) If we needed a reboot for everything, we would be called windows
> : :P

A surprising number of people think they want monolithic kernels which 
*do* rather emulate Windows in their inflexibility. Modularity is one 
of my favourite rant subjects. :)

Thanks for the reply.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

