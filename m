From: Jack Bowling <jbinpg@shaw.ca>
Subject: Re: Help with invalid argument
Date: Sat, 06 Jul 2002 09:38:04 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <0GYU007LM67HFQ@l-daemon>
References: <EPEHIDPIPEBFNAHLCHPGAEMCCEAA.dennis@core-enterprises.com>
 <EPEHIDPIPEBFNAHLCHPGKEMFCEAA.dennis@core-enterprises.com>
Reply-To: Jack Bowling <jbinpg@shaw.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <EPEHIDPIPEBFNAHLCHPGKEMFCEAA.dennis@core-enterprises.com>
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

** Reply to message from Dennis Cardinale <dennis@core-enterprises.com> on Sat, 06 Jul 2002 12:31:21 -0400


> OK...solved my own problem.
> 
> userspace/make install all
> 
> does not copy the new iptables binaries to the /sbin directory.
> 
> Is there a script to do this?  Can I do it manually? Is there a way to do it
> so that the binaries used are compatible with the chosen kernel at boot
> time?

Just edit this section of the Makefile in your iptables source top directory to the following:

#PREFIX:=/usr/local
LIBDIR:=/lib
BINDIR:=/sbin
MANDIR:=/usr/share/man
INCDIR:=/usr/include

before you do the make and make install.

jb

