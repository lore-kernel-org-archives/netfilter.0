From: Ben Russo <ben@umialumni.com>
Subject: Re: Best distro for firewalls.
Date: 11 Nov 2002 14:00:47 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1037041247.3428.28.camel@ben.mis.tnsi.com>
References: <003901c289aa$0014bd40$6601a8c0@s3ac>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <003901c289aa$0014bd40$6601a8c0@s3ac>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Rowan Reid <rreid@studio3arc.com>
Cc: 'iptables-list' <netfilter@lists.samba.org>

On Mon, 2002-11-11 at 12:44, Rowan Reid wrote:
> I've been runnign on Sues for a few years now. Currently I run 8.0. But
> I've been a little disappointed with there online updates, and a few
> other things over all.  I'm looking for a good console only base system
> install using an up to date well patched kernel. Also a very good update
> system for patches. With SuSE since everything is controlled by Yast
> updating manually really isn't a viable option. Can some of you give me
> some input on like Redhat Dabian and such. Just so you know I typically
> do an ftp install, with a custom configured Kernel and firewall scripts.
> 
>  
> Rowan Reid
> Job Captain, 
> Systems Administrator
> STUDIO 3 ARCHITECTS
> 909  982  1717
> 

Well, I don't know that much about any Linux Distributions other than 
RedHat.  

It is very easy to create a boot floppy for a machine to do installs via
NFS, FTP, or SAMBA, and with a simple kickstart script you can
completely automate the install and the configuration.  there are
sections in the "kickstart" script where you can run pre and post
install scripts.  So you could perform your setup just about any way you
want, such as installing default config files after installation, or
fetching and installing third party after-market RPMs' via wget, or
building a kernel by throwing in a custom .config file and Makefile and
rerunning the compile. (you can even set up PXEboot server and then you
don't even need the floppy disk).

When you install the box and boot up for the first time you can run 
"up2date-config --nox"  to setup your automatic patch fetching and
install system with a GPG key from redhat and set the other options.

You can install packages (and automatically get all the dependencies)
by doing "up2date -i PKGNAME".  So for example if you installed a base
system and then later decided that you wanted web mail you could do:
	"up2date -i squirrel-mail" (I think that is the right pkg name).
It would fetch the most up-2-date version of squirrell mail available
from RedHat, plus it would also fetch php and apache and sendmail
etc....

By default RedHat 8 sets up the "rhnsd" daemon which will check in with
redhat through an https connection to the redhat network to check for
patches and such.  You can configure it to to work in various ways.

You get one free web rhn.redhat.com  subscription for one machine.  
(you can buy more if you want them).

If you setup the rhnsd daemon on the box when you install it you will be
e-mailed when new updates are available, and by going to the
rhn.redhat.com site and logging in you can review the errata and
schedule the updates to be pushed to your server and installed
automatically the next time the servers rhnsd daemon checks in it will 
be pushed the updates you scheduled through the web interface.

If you don't want to do it that way, and really want to do it from the
console you can use up2date-nox from the command line, but it isn't as
easy as using the gui.  You would have to do "up2date-nox --list" to get
a list of available updates, and then do "up2date -i $EACH" for the
updates.

Tripwire, and iptables, arpwatch, logwatch, pppoe, cipe, vtund etc.. are
all available for install from the standard  install medium, so for a
firewall that is nice... The defualt kernel has just about everything
available as a module by default.  The install allows for LVM, Software
RAID, journalling file systems etc. from the install menus.

stunnel and VNCserver with fvwm makes a nice, secure and relatively
lightweight (compared to KDE or GNOME) remote GUI console.
To make it even more lightweight you can remove the xload and xclock and
xbiff from the fvwmrc in /etc/X11/fvwm2/system.fvwm2rc.  I like to use
that on boxes because I can start up a few Xterms that monitor various
things and tail certain log files with filters and then I can check up
on the server at a glance with a simple command.

	http://www.stunnel.org/examples/vnc.html

But I would think that the new versions of SUSE and Debian and Mandrake
and Gentoo all have similar capabilities, just different commands and
syntax and config files to get the same things done.

-Ben.


