From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Trying to use NETMAP for 1-1 NAT
Date: Mon, 15 Mar 2004 07:33:07 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403150733.07149.Antony@Soft-Solutions.co.uk>
References: <Pine.GSU.4.58.0403142225080.22714@adore.lightlink.com> <20040315041348.GT26800@samad.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040315041348.GT26800@samad.com.au>
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
To: netfilter@lists.netfilter.org

On Monday 15 March 2004 4:13 am, Alexander Samad wrote:

> Okay, my answer is not really a netfiler answer, but why not run an
> IPSEC tunnel between each site and then route over the ipsec tunnel.

Even simpler to setup, and maybe adequate for the task, would be a plain IP in 
IP tunnel (see http://lartc.org for details).   It doesn't have the security 
of an IPsec tunnel, but then neither does the nat solution which Nick is 
trying to get working in the first place.

I think an IP tunnel would be a 'cleaner' network arrangement than lots of nat 
around the place, but the choice is yours, of course.

Regards,

Antony.

> On Sun, Mar 14, 2004 at 10:57:18PM -0500, Nick Taylor wrote:
> > I am posting a newbie question here, so I hope for your patience with me.
> > We have had an unsolved problem which is driving us crazy for quite a
> > while, and I stumbled upon the NETMAP patch, which seems to do exactly
> > what we require.  Unfortunately, I haven't been able to use the module,
> > and I'm hoping someone on the list can point me in the right direction.
> > Thanks in advance for your help.
> >
> > We have a remote office with a T1 line, which is quite expensive for us
> > to maintain, and saturates frequently.  We wish to increase the bandwidth
> > available to us, and our remote office is close enough to use DSL over
> > bare copper which our telco will provision for us, so the problem is
> > multiplexing over the various DSL modems.  If someone has a clever scheme
> > for this already, I would love to hear about it, I could obviate the need
> > for the NETMAP module.  However, the following details what I want to do,
> > and where in the process I stopped...
> >
> > Many, many netblocks are routed from our main office to the remote
> > office.  The DSL modems we use, however, are only capable of storing 8
> > routes, so we figured we could 1:1 NAT each of the subnets of interest
> > into a large private space, send it across the DSL modems, and 1:1 NAT it
> > back to the real IP addresses at the other end.  The other option we
> > thought of was to use the modems as bridges, but it seems this would
> > require a seperate (physical) interface in the linux box at each end for
> > each modem. While this solution would work right now, it doesn't scale
> > well.
> >
> > So, enter NETMAP...
> >
> > I downloaded linux-2.4.25.tar.gz from ftp.kernel.org, and after a few
> > attempts got a kernel that worked for everything else I needed.  I got
> > the patch-o-matic as per the instructions in
> > http://www.netfilter.org/documentation/HOWTO//netfilter-extensions-HOWTO.
> >html .
> >
> > I patched my kernel with NETMAP, turned it on in make menuconfig, did:
> > make dep && make bzImage && make modules && make modules_install
> > cp arch/i386/boot/bzImage /boot/vmlinux-2.4.25-patched
> > lilo
> > reboot
> >
> >
> > Then I played with:
> > iptables -t nat -A POSTROUTING -s 192.168.33.0/24 -j NETMAP --to \
> >    192.168.44.0/24
> >
> > which gives the error:
> > iptables v1.2.7a: Unknown arg `--to'
> >
> > so, I try:
> > iptables -t nat -A POSTROUTING -s 192.168.33.0/24 -j NETMAP
> > iptables v1.2.7a: Couldn't load target
> > `NETMAP':/usr/lib/iptables/libipt_NETMAP.so: cannot open shared object
> > file: No such file or directory
> >
> > Right...
> > find / -regex '.*NETMAP.*' -print
> > ...
> > /lib/modules/2.4.25/kernel/net/ipv4/netfilter/ipt_NETMAP.o
> > ...
> >
> > Okay, so it's a kernel module, not a shared object, and that's what I
> > expected...  so, maybe I need to modprobe it?  That has exactly the
> > same results.  Maybe the userspace tool needs an update?  Following
> > instructions again found in
> > http://www.netfilter.org/documentation/HOWTO//netfilter-extensions-HOWTO.
> >html, I do:
> > cvs -d :pserver:cvs@pserver.netfilter.org:/cvspublic login
> > cvs -d :pserver:cvs@pserver.netfilter.org:/cvspublic co
> > netfilter/userspace cvs server: warning: new-born netfilter/userspace has
> > disappeared
> >
> > Uh, oh!  Now I am stuck.  Is there a new location I should be looking for
> > the userspace?  Is updating the userspace the right thing to be doing? 
> > Is this patch "not right" on 2.4.25?  Anyone have any other suggestions
> > what I should do?
> >
> > Thanks for your help!

-- 
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing on usenet and in e-mail?

                                                     Please reply to the list;
                                                           please don't CC me.


