From: "Dick St.Peters" <stpeters@NetHeaven.com>
Subject: Re: Help with alias interfaces
Date: Wed, 23 Jun 2004 15:01:13 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <16601.54137.766533.681609@saint.heaven.net>
References: <FLECICIIDHIEIENHHOOLIEFNCCAA.esanz@minorplanetusa.com>
	<200406231553.01584.Antony@Soft-Solutions.co.uk>
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406231553.01584.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Antony Stone writes:
> The deprecated way to get multiple IPs results in pseudo-interface names such 
> as eth1:0, eth1:1 etc as you discussed.

Deprecated by whom?  I use secondary IPs a lot, and I've never before
heard anyone call the standard way of doing them "deprecated".  Plus
I, for one, prefer having pseduo-interface labels for manipulating
them.  Labels are handy, especially if you use names instead of
numbers.  (eth0:bob is as valid as eth0:1.)

>   The recommended way to assign 
> multiple IPs on one interface (ip addr add a.b.c.d dev eth1) simply results 
> in multiple IPs on the interface - no strange new names appear, therefore I 
> think it is a much more obvious and clear way of doing it.

This is probably a case where context and background determine what is
more "obvious" and "clear".  For me, not having those labels would
mean an enormous amount of work.  My administration scripts use, on a
many times daily basis, a small utility that does an SIOCGIFCONF ioctl
to get an array of interfaces.  They sometimes use an alias interface
label to ifconfig the alias interface down.  Without separate labels,
these scripts would turn off the physical interface ... not good!  I
would have to chase down all such instances in a lot of scripts on
many systems.

(BTW, I wrote that utility for SunOS and Ultrix in April 1988, and it
still works for Linux 2.6, with only a couple minor changes.  By far
the largest change is that Linux doesn't return a sorted array,
requiring a qsort() call for neatness.)

--
Dick St.Peters, stpeters@NetHeaven.com 
Gatekeeper, NetHeaven, Saratoga Springs, NY

