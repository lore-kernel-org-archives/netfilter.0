From: aksingh@hss.hns.com
Subject: libipq
Date: Mon, 19 Apr 2004 18:43:18 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF631E6CC8.C8BB8FBC-ON65256E7B.00474A37@hss.hns.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org





hi

1) is libipq library distributed with all 2.4 series kernels, i use
2.4.2-2smp, but i cant locate libipq.h on my system
2) i had a doubt regarding nf_hook filters returning NF_QUEUE, nobody has
replied so ill try and make my question more specific ---
      - i use a PRE_ROUTING hook to capture all ipv4 packets  >>> this is
fine
      -the hook function returns NF_QUEUE return code and hence the packet
goes to ip_queue(assuming i have loaded ip_queue module, the kernel gives
upprocessing this packet here
              - a user process i create is listening on the netlink socket
for the packet just given to ip_queue, once it gets the packet it plays
with it and reinjects the packet using ip_set_verdict ... here two things
might happen, one is that my user process decides to keep the packet for
itself and returns a verdict of NF_DROP in ip_set_verdict(in which case the
packet is dropped on being reinjected into the kernel, i hope this is the
case, right ?).   Secondly, the process might actually want to reinject the
packet into the kernel and hence it calls ip_set_verdict with a verdict of
NF_ACCEPT. On receiving this second type of packet(after reinjection), i
expect the kernel not to repeat the same hook, cos if it does then im stuck
in an infinite loop.

is my understanding correct(just the third point) or is there any chance of
me getting into an infinite loop if i use this method.

thanks
Amit





Alistair Tonner <Alistair@nerdnet.ca>@lists.netfilter.org on 04/19/2004
02:18:14 PM

Sent by:    netfilter-admin@lists.netfilter.org


To:    netfilter@lists.netfilter.org
cc:

Subject:    Re: Iptables and Kernel


On April 19, 2004 04:34 am, Norman Zhang wrote:
> >I'm running 2.6.3. with iptables 1.2.9 and p-o-m-ng h323 patch -- they
> > work for me -- but I'm referring to a home lan ond only one netmeeting
> > seesioon from the LAN  -- we haven't tried multiple sessions from
inside
> > the lan ... either to the same netmeeting sessioon or to different
ones.
>
> Sorry it is me again. I tried to compile pomng using
>
> # KERNEL_DIR=/usr/src/linux ./runme pending
> # KERNEL_DIR=/usr/src/linux ./runme base
> # KERNEL_DIR=/usr/src/linux ./runme extend
>
> but couldn't find h323-conntrack-nat patch being offered. I did see
> owner-socketlookup mention something about H.323. May I ask how do I
> applied h323-conntrack-nat patch to iptables and kernel-2.6.5 alone? I
> can see the subfolder h323-conntrack-nat under pomng.

 Okay -- I'm a twit --- I'd assumed since my loadup script was completed
without errors that things had worked all the way through ... looking again
it seems that the h323 stuff only applies against 2.4.x kernels -- Joseph
K.
hasn't ported it -- likely because its slightly hackish .. And Lord KNOWS
why
netmeeting is working through my firewall ... other than the fact of a good
old ESTABLISHED RELATED rule ... I do know that it only works outbound, if
someone wants to call into the LAN they have to call on a specific port and
I
have that port forwarded to the destination host.

 As such, this is Yet Another Thing I might look at.


 Alistair Tonner

>
> Regards,
> Norman




