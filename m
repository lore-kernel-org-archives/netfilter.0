From: "Dennis Cardinale" <dennis@core-enterprises.com>
Subject: RE: Help with invalid argument
Date: Sat, 6 Jul 2002 15:20:24 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <EPEHIDPIPEBFNAHLCHPGIEMHCEAA.dennis@core-enterprises.com>
References: <0GYU00921BGS9X@l-daemon>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <0GYU00921BGS9X@l-daemon>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Netfilter Mailing List <netfilter@lists.samba.org>

Thanks for the help, Jack.  Everything is working fine now.

In regard to the last message, I'll rephrase the question:

If the netfilter userspace tools that now occupy /sbin are compiled from
current netfilter CVS source tree, will they still execute properly when
called from within the framework of the prior kernel (before pomming it)?

You do not need to answer the question.  As soon as I have time, I'll reboot
the old kernel and try it myself.

I've been running Linux for about a year now, and, actually I am pretty
proud of the small amount of knowledge I have gained over that time.
Occasionally, though, I get frustrated trying to piece together all of the
scattered information trying to get something (i.e. H323) to work.

BTW, I've noticed that I can initiate netmeeting calls from behind my
router, but others cannot call me (they wind up calling 192.168.x.x, which
obviously does not exist on the internet).  I assume this is because of the
limitations of ip_conntrack_h323 (that I think I read about).

This will not normally be a problem for me, as most of the calling (by my
wife, to Ecuador) can be initiated elsewhere.  The only inconvienience would
be if I wanted to netmeeting with my business partner, who is also behind a
linux router/firewall.

I assume that this is what OpenH323Gatekeeper is for.  Does anyone know if a
gatekeeper can be run simultaneously with ip_conntrack_h323 so that both
situations work?

Thanks again.

Dennis

-----Original Message-----
From: netfilter-admin@lists.samba.org
[mailto:netfilter-admin@lists.samba.org]On Behalf Of Jack Bowling
Sent: Saturday, July 06, 2002 2:32 PM
To: netfilter@lists.samba.org
Subject: Re: Help with invalid argument


** Reply to message from Dennis Cardinale <dennis@core-enterprises.com> on
Sat, 06 Jul 2002 12:44:56 -0400


> what happens if I boot the old kernel?
>
> -----Original Message-----
> From: netfilter-admin@lists.samba.org
> [mailto:netfilter-admin@lists.samba.org]On Behalf Of Jack Bowling
> Sent: Saturday, July 06, 2002 12:38 PM
> To: netfilter@lists.samba.org
> Subject: Re: Help with invalid argument
>
>
> ** Reply to message from Dennis Cardinale <dennis@core-enterprises.com> on
> Sat, 06 Jul 2002 12:31:21 -0400
>
>
> > OK...solved my own problem.
> >
> > userspace/make install all
> >
> > does not copy the new iptables binaries to the /sbin directory.
> >
> > Is there a script to do this?  Can I do it manually? Is there a way to
do
> it
> > so that the binaries used are compatible with the chosen kernel at boot
> > time?
>
> Just edit this section of the Makefile in your iptables source top
directory
> to the following:
>
> #PREFIX:=/usr/local
> LIBDIR:=/lib
> BINDIR:=/sbin
> MANDIR:=/usr/share/man
> INCDIR:=/usr/include
>
> before you do the make and make install.


The above Makefile only controls where the userspace part of iptables goes
during the make install. The netfilter kernel modules are added to the
kernel source when you do the "make most-of-pom", etc. Then you have to
compile your kernel source again. If you have already compiled the kernel
source using the same iptables code then you just have to run the make
install again (with the edited prefixes) to put the userspace stuff in the
right place. It may be an idea to go into the /usr/local directory and clean
out all the stuff that was placed in there by the previous make install just
to avoid possible clashes.

jb


