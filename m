From: "Jee J.Z." <jz105@york.ac.uk>
Subject: Re: network setup help
Date: Sun, 11 Apr 2004 00:33:03 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00d001c41f54$2b238ac0$68892090@grouse>
References: <008301c41f2d$4be932e0$68892090@grouse> <200404102350.24148.Antony@Soft-Solutions.co.uk>
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
To: netfilter@lists.netfilter.org

Hi Antony,

Thanks for your reply. Please see inline:

> On Saturday 10 April 2004 7:54 pm, Jee J.Z. wrote:
>
> > Dear all,
> >
> > I am trying to setup three PCs and do some simple filter+nat jobs. The
> > situation is specified below:
> >
> > 1.PC1 has one NIC with a global IP connected to a Switch;
> > 2.PC2 has two NICs, eth0 with a global IP connected to the Switch and
eth1
> > with an internal IP (192.168.0.1/24) directly connected to PC3's eth1;
> > 3.PC3 has two NICs, eth0 with a global IP connected to the Switch and
eth1
> > with an internal IP (192.168.0.2/24) directly connected to PC2's eth1.
>
> !? Why !?
>
> (Either, why are PC2 and PC3 connected, or, why are both PC2 and PC3
connected
> to the switch?)
>
> > I am trying to send packets from PC1 to PC3, via PC1/eth0(global
> > IP)-->PC2/eth0(global
IP)-->PC2/eth1(192.168.0.1)-->PC3/eth1(192.168.0.2).
> > Actually, PC3/eth0 is not in used in the case.
>
> So, what's PC3/eth0 for?

You are right. PC3/eth0 is a redundancy in this setup. That's why I tried
disabling PC3/eth0. I am just curious that when more than one NIC are
activated, which one will the PC choose to send packets? I guess one of them
should be a default NIC, right? How do I know or set one as default?


> I think your problem is a routing table (almost certainly the one on PC3,
but
> possibly the one on PC2).

Right. I am quite new to setting up routing tables. That should be the
reason... :(

> Look at the routing table of each machine the packets are going through,
and
> then the replies trying to get back again, and see if (a) there is a path,
> and (b) it makes sense.

Both PC2 and PC3's routing look like:
Destination                Gateway                   Genmask
Flags      Metric      Ref      Iface
192.168.0.0               0.0.0.0                     255.255.255.0
U            0           0        eth1
144.32.xxx.0              0.0.0.0                     255.255.254.0
U            0           0        eth0
127.0.0.0                  0.0.0.0                     255.0.0.0
U            0           0         lo
0.0.0.0                     144.32.xxx.yyy           0.0.0.0
UG           0           0        eth0

I haven't added anything to the routing tables, and not quite sure what
rules I should add. I have ever tried adding a default gateway, but it
doesn't seem to work. I know I must be missing something obvious. Could you
show me your thoughts?

> I think once you've done this you will find the source of your problem,
but I
> really do recommend you think about your network setup, and the path you
are
> trying to get packets to take, and ask yourself "why do it like this?"

Once getting rid of PC3/eth0, four NICs remained are involved:
PC1/eth0-->PC2/eth0-->(filter,nat)-->PC2/eth1-->PC3/eth1. Then any problems?

> For your benefit I have specifically selected the sig on this email :)

Thank you!:)

> Regards,
>
> Antony.
>
> -- 
> 90% of networking problems are routing problems.
> 9 of the remaining 10% are routing problems in the other direction.
> The remaining 1% might be something else, but check the routing anyway.
>
>                                                      Please reply to the
list;
>                                                            please don't CC
me.
>
>
>


