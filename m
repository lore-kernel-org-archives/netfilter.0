From: "Jee J.Z." <jz105@york.ac.uk>
Subject: Re: libipq
Date: Tue, 20 Apr 2004 13:21:30 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003501c426d2$02e423f0$68892090@grouse>
References: <OFD0D60AB8.75553E41-ON65256E7C.001E4C71@hss.hns.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: aksingh@hss.hns.com
Cc: netfilter@lists.netfilter.org

Hi Amit,

> hi Jee
>
>   I think you got my question wrong ... my design is as follows :
> first my netfilter hook returns NF_QUEUE and hence the packet goes to
> ip_queue and from there to the user process. The user process always sets
> the verdict to either NF_ACCEPT(if it wants the kernel to handle it again)
> or NF_DROP(if it wants the kernel just to drop the packet since the user
> process has taken the ownership now). The user process wld never return
> NF_QUEUE and hence there should not be any infinite loops here.

You can try return NF_QUEUE using ipq_set_verdict() from userspace, that
gives you an infinite loop. Also, if you try NF_REPEAT, that gives you an
infinite loop as well (I think NF_REPEAT causes the kernel to repeat the
same hook). I tested it. Other than these two targets, of course you won't
get inifnite loops.

Jee

> -Amit
>
>
>
>
> "Jee J.Z." <jz105@york.ac.uk> on 06/21/2004 08:19:41 PM
>
> To:    Amit Kumar Singh/HSS@HSS
> cc:
>
> Subject:    Re: libipq
>
>
> > 1) is libipq library distributed with all 2.4 series kernels, i use
>
> I think so.
>
> > 2.4.2-2smp, but i cant locate libipq.h on my system
> > 2) i had a doubt regarding nf_hook filters returning NF_QUEUE, nobody
has
> > replied so ill try and make my question more specific ---
> >       - i use a PRE_ROUTING hook to capture all ipv4 packets  >>> this
is
> > fine
> >       -the hook function returns NF_QUEUE return code and hence the
> packet
> > goes to ip_queue(assuming i have loaded ip_queue module, the kernel
gives
> > upprocessing this packet here
> >               - a user process i create is listening on the netlink
> socket
> > for the packet just given to ip_queue, once it gets the packet it plays
> > with it and reinjects the packet using ip_set_verdict ... here two
things
> > might happen, one is that my user process decides to keep the packet for
> > itself and returns a verdict of NF_DROP in ip_set_verdict(in which case
> the
> > packet is dropped on being reinjected into the kernel, i hope this is
the
> > case, right ?).   Secondly, the process might actually want to reinject
> the
> > packet into the kernel and hence it calls ip_set_verdict with a verdict
> of
> > NF_ACCEPT. On receiving this second type of packet(after reinjection), i
> > expect the kernel not to repeat the same hook, cos if it does then im
> stuck
> > in an infinite loop.
>
> No. When you set NF_ACCEPT, the packet will go where it should go. When
you
> set NF_QUEUE in ipq_set_verdict, the packet will be put in the QUEUE
target
> again, and therefore infinite loop starts.
>
> Jee
>
> > is my understanding correct(just the third point) or is there any chance
> of
> > me getting into an infinite loop if i use this method.
> >
> > thanks
> > Amit
> >
> >
> >
> >
> >
> > Alistair Tonner <Alistair@nerdnet.ca>@lists.netfilter.org on 04/19/2004
> > 02:18:14 PM
> >
> > Sent by:    netfilter-admin@lists.netfilter.org
> >
> >
> > To:    netfilter@lists.netfilter.org
> > cc:
> >
> > Subject:    Re: Iptables and Kernel
> >
> >
> > On April 19, 2004 04:34 am, Norman Zhang wrote:
> > > >I'm running 2.6.3. with iptables 1.2.9 and p-o-m-ng h323 patch -- 
they
> > > > work for me -- but I'm referring to a home lan ond only one
> netmeeting
> > > > seesioon from the LAN  -- we haven't tried multiple sessions from
> > inside
> > > > the lan ... either to the same netmeeting sessioon or to different
> > ones.
> > >
> > > Sorry it is me again. I tried to compile pomng using
> > >
> > > # KERNEL_DIR=/usr/src/linux ./runme pending
> > > # KERNEL_DIR=/usr/src/linux ./runme base
> > > # KERNEL_DIR=/usr/src/linux ./runme extend
> > >
> > > but couldn't find h323-conntrack-nat patch being offered. I did see
> > > owner-socketlookup mention something about H.323. May I ask how do I
> > > applied h323-conntrack-nat patch to iptables and kernel-2.6.5 alone? I
> > > can see the subfolder h323-conntrack-nat under pomng.
> >
> >  Okay -- I'm a twit --- I'd assumed since my loadup script was completed
> > without errors that things had worked all the way through ... looking
> again
> > it seems that the h323 stuff only applies against 2.4.x kernels -- 
Joseph
> > K.
> > hasn't ported it -- likely because its slightly hackish .. And Lord
KNOWS
> > why
> > netmeeting is working through my firewall ... other than the fact of a
> good
> > old ESTABLISHED RELATED rule ... I do know that it only works outbound,
> if
> > someone wants to call into the LAN they have to call on a specific port
> and
> > I
> > have that port forwarded to the destination host.
> >
> >  As such, this is Yet Another Thing I might look at.
> >
> >
> >  Alistair Tonner
> >
> > >
> > > Regards,
> > > Norman
> >
> >
> >
> >
> >
>
>
>
>
>


