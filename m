From: "Jee J.Z." <jz105@york.ac.uk>
Subject: Re: ipq_set_verdict
Date: Tue, 20 Apr 2004 15:57:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <014d01c426e7$d0073290$68892090@grouse>
References: <OFD3EC3B35.6B678258-ON65256E7C.004CBA78@hss.hns.com>
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
To: aksingh@hss.hns.com, Sven Schuster <schuster.sven@gmx.de>
Cc: netfilter@lists.netfilter.org

Hi Amit and Sven,

It's good to find some people on the list who are interested in libipq
programming to discuss with. For libnet, please refer to
http://www.packetfactory.net/projects/libnet/.

Amit, would you mind let me know what goals are you expecting by doing all
you described. Just for curiosity, you don't have to answer if you do mind.

Cheers,
Jee

> hey  Jee and Sven
>
> thanks both of u for that, yes i guess you are right that wont work,i
> looked into the kernel source for the same, i can reinject just one packet
> for the one i took from the kernel...and the id has to be the same, so i
> cant use this.
> can u give me some good libnet links.
>
> thanks
> Amit
>
>
>
>
>
> "Jee J.Z." <jz105@york.ac.uk>@lists.netfilter.org on 04/20/2004 07:19:12
PM
>
> Sent by:    netfilter-admin@lists.netfilter.org
>
>
> To:    Amit Kumar Singh/HSS@HSS
> cc:    "Sven Schuster" <schuster.sven@gmx.de>,
>        <netfilter@lists.netfilter.org>
>
> Subject:    Re: ipq_set_verdict
>
>
> Hi again,
>
>
> > hi
> >
> >   I thought of a way of reinjecting absolutely new packets into the
> kernel
> > .... suppose i call ip_set_verdict (this in turn calls nf_reinject) to
> > inject packets into the kernel)for the new packets that a user space
> > process generates. nf_reinject has a parameter nf_info which probably
> tells
>
> When you call ipq_set_verdict, there must be a packet waiting for
userspace
> processing in the kernel. You can reinject any packet content as you wish
> by
> setting NF_ACCEPT, however, you have to use the packet id of the packet
> currently waiting in the kernel.
>
> > the kernel from which hook was this packet captured and hence from where
> to
> > continue when this is reinjected(from the next hook onwards). Now,
> suppose
> > I have a PRE_ROUTING hook that captures the packets and sends it to my
> user
> > space process. This process might  return some packets to be reinjected
> and
> > might generate some of its own that it wants injected into the kernel
> (from
> > pre_routing stage but bypassing the netfilter PRE_ROUTING hook) .. for
> > these newly generated packets I can use the same nf_info param i used
for
> > the packets that i captured from the kernel and that will make the
kernel
> > think that they were captured by the PRE_ROUTING hook and so after
> > reinjection continue from after the PRE_ROUTING hook....so for these
> > packets routing decision would be taken after injection and hence these
> > newly packets cld either be outbound(going to the wore) or inbound (the
> > ones that need to travel up the stack from ip).
>
> Good idea. But keep in mind that one original packet only allow you to
> generate and inject one new packet using libipq, IMO. However, if you use
> libnet, I believe you can generate as many new packets as you wish and
> inject them.
>
> Not sure I get what you mean rightly. Let me know if I miss something.
>
> Jee
>
> > This sounds good to me but can this be done or am i thinking on wrong
> lines
> > here. Please suggest if im wrong.
> >
> > thanks
> > Amit
> >
> > "DISCLAIMER: This message is proprietary to Hughes Software Systems
> Limited
> > (HSS) and is intended solely for the use of the individual to whom it is
> > addressed. It may contain  privileged or confidential information and
> > should not be circulated or used for any purpose other than for what it
> is
> > intended. If you have received this message in error, please notify the
> > originator immediately. If you are not the intended recipient, you are
> > notified that you are strictly prohibited from using, copying, altering,
> or
> > disclosing the contents of this message. HSS accepts no responsibility
> for
> > loss or damage arising from the use of the information transmitted by
> this
> > email including damage from virus."
> >
> >
> >
>
>
>
>
>


