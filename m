From: "Adam D. Barratt" <netfilter.list@adam-barratt.org.uk>
Subject: Re: IP address to MAC address
Date: Tue, 11 Jun 2002 22:32:23 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <081501c2118f$79efcf30$3200a8c0@jungle.funkybadger.org>
References: <001601c2113a$aa85b560$0500a8c0@escritoriomundial.com.br> <200206112040.g5BKetA21075@Networker.rockstone.co.uk> <20020611205543.GC21405@cannon.eng.us.uu.net> <200206112109.g5BL9xA22717@Networker.rockstone.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
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
To: netfilter@lists.samba.org

Antony Stone wrote:

> On Tuesday 11 June 2002 9:55 pm, Ramin Alidousti wrote:
>
> > On Tue, Jun 11, 2002 at 09:40:53PM +0100, Antony Stone wrote:
> > > On Tuesday 11 June 2002 9:38 pm, Tony Earnshaw wrote:
[chomp]
> > > > Did you say 'arp -a'?
> > >
> > > I would have done, if I knew I was root, but the commands I
suggested
> > > work for an unprivileged user too :-)
> >
> > If that information can be read by anybody then the wrapper
program like
> > arp can be run by anybody as well ;-)
>
> Well, on my system at least (Slackware 8.0), /proc/net/arp has
permissions
> -r--r--r-- so anyone can read it.   The arp program is in /sbin, so
it can
> only be run by root.

Non sequiter. /sbin contains, by convention, binaries connected with
system administration. That is *not* the same as "binaries that may
only be executed by root".

/sbin is not on non-root users' paths, by default, but that doesn't
necessarily mean they can't execute stuff that lives there. Certainly,
on my Debian Woody and Sid boxes here, the contents of /sbin
are -rwxr-xr-x ;- the main thing stopping non-root users using some of
them is a lack of privileges, not a lack of execute rights to the
files.

Specifically, arp lives in /usr/sbin on my boxen, and whilst that's
not on my normal user's path, and the files are owned by root.root, I
can quite happily:

  /usr/sbin/arp -a

as any user. Similarly, a non-privileged user has no problems running
/sbin/route.

hth

Adam


