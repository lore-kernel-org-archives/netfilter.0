From: Jack Bowling <jbinpg@shaw.ca>
Subject: Re: Help with invalid argument
Date: Sat, 06 Jul 2002 11:31:37 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <0GYU00921BGS9X@l-daemon>
References: <0GYU007LM67HFQ@l-daemon>
 <EPEHIDPIPEBFNAHLCHPGCEMGCEAA.dennis@core-enterprises.com>
Reply-To: Jack Bowling <jbinpg@shaw.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <EPEHIDPIPEBFNAHLCHPGCEMGCEAA.dennis@core-enterprises.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
To: netfilter@lists.samba.org

** Reply to message from Dennis Cardinale <dennis@core-enterprises.com> on Sat, 06 Jul 2002 12:44:56 -0400


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
> > Is there a script to do this?  Can I do it manually? Is there a way to do
> it
> > so that the binaries used are compatible with the chosen kernel at boot
> > time?
> 
> Just edit this section of the Makefile in your iptables source top directory
> to the following:
> 
> #PREFIX:=/usr/local
> LIBDIR:=/lib
> BINDIR:=/sbin
> MANDIR:=/usr/share/man
> INCDIR:=/usr/include
> 
> before you do the make and make install.


The above Makefile only controls where the userspace part of iptables goes during the make install. The netfilter kernel modules are added to the kernel source when you do the "make most-of-pom", etc. Then you have to compile your kernel source again. If you have already compiled the kernel source using the same iptables code then you just have to run the make install again (with the edited prefixes) to put the userspace stuff in the right place. It may be an idea to go into the /usr/local directory and clean out all the stuff that was placed in there by the previous make install just to avoid possible clashes.

jb

