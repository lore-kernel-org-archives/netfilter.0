From: "Jee J.Z." <jz105@york.ac.uk>
Subject: Re: network setup help
Date: Sun, 11 Apr 2004 17:01:26 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004901c41fde$3eb952b0$68892090@grouse>
References: <008301c41f2d$4be932e0$68892090@grouse> <200404110059.05382.Antony@Soft-Solutions.co.uk> <001a01c41f68$d1725f50$cb0210ac@jz105> <200404110352.02933.Antony@Soft-Solutions.co.uk>
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



> On Sunday 11 April 2004 3:00 am, Jee J.Z. wrote:
>
> > > Here's what I think is going on:
> > >
> > > PC1 has a simple routing table saying "network 144.32.xxx.0/23 is on
> > > eth0, and the deafult gateway is 144.32.xxx.yyy".   That means if you
> > > ping 192.168.0.2 from PC1 it will send the packets to the default
gateway
> > > :(
> >
> > Oh, sorry to get you confused. I am not trying to ping from PC1 to PC3.
>
> Ah, I read your first posting which said "I am trying to send packets from
PC1
> to PC3, via PC1/eth0 (global IP) --> PC2/eth0 (global IP) --> PC2/eth1
> (192.168.0.1) --> PC3/eth1 (192.168.0.2)" and assumed that this was what
you
> were testing right now and having problems with.
>
> I now see that later on in that first posting you did say "Currently I
fail to
> ping from PC3 to PC2/eth1 (192.168.0.1)", so I guess I should have started
> with the simple stuff first :)
>
> > I am trying to ping from PC2 to PC3 or from PC3 to PC2 to test their
> > connectivity (between PC2 and PC3). Besides the routing table, I am also
> > considering whether my configurations for setting up two NICs on one box
> > are problematic or not at this moment.
>
> Er, well, there's not much you can get wrong with that?   Let's go over a
few
> basics:
>
> 1. Each NIC on one box has an IP address in a different subnet (correct,
> according to your first posting).
> 2. The routing table on each box tells it how to get to each subnet, as
well
> as a default route (correct, according to your second posting).
> 3. The two NICs are connected with a crossover CAT5 cable, or
straight-through
> cables and a hub/switch (?).

It's a crossover cable. The NIC LEDs shine, but the flicker frequency is
very very low. This may be because there are not many packets sent over.

> 4. There are no netfilter rules on either machine dropping packets or
> redirecting them elsewhere (?).

No. I've checked it.

> If you can't ping between PC2 and PC3, how about from PC2 to PC1, or from
PC1
> to PC3? (using their public addresses this time, since PC1 doesn't know
how
> to route to the private addresses)

Yes, when using global IPs, everything works fine. The three machines can
all access the Internet using their global IP.

> > Your descriptions above make sense. And right, I will do filtering and
nat
> > on PC2 after I sort the current problem out. Once I set up filter and
nat
> > on PC2, PC1 does not need "route add -net 192.168.0.0 netmask
255.255.255.0
> > gw 144.32.xxx.b " any more, and PC1 should not know there is a
192.168.0.0
> > network behind PC2, right?
>
> That depends on what NAT you set up on PC2 (and the simplest way to
understand
> what I mean here is "what address would PC1 ping in order to contact
PC3?").

I would like to ftp from PC1 to PC3 in the future, however, I think I should
use "ftp PC2_global_IP". If nat is set up on PC2, PC1 is ftp-ing PC3; if nat
is not set up, then PC1 is ftp-ing PC2. Are there any problems with this
assumption?

> > > However, I still remain puzzled about why you have this crazy setup in
> > > the first place, and what you're trying to achieve by sending pings
from
> > > PC1 to PC3 via PC2, so add the routing table entry to PC1, check
whether
> > > a ping works (with all the cables plugged in, so all the paths shown
on
> > > your original diagram are available), and then try to explain to us
why
> > > you are doing things this way and what you want to achieve.
> >
> > OK, I am trying to set up a simple firewall (just do filtering and nat)
> > between PC3 and the outside world. PC2 is where the firewall locates.
And
> > PC1 is just a traffic sender for testing after the firewall is built up.
>
> In that case, unplug PC3/eth0 -> switch, remove the IP address from
PC3/eth0,
> and set the default gateway for PC3s routing table to 192.168.0.1

OK, I've got rid of PC3/eth0 now. But before I set the default gateway for
PC3, it should be no problem to ping 192.168.0.1 from it, right?

> If you intend PC3 to communicate with the world through PC2, set it up
like
> that in the first place (even though you may not be able to communicate
with
> much of the world beyond your Internet router until you get some NAT
running
> on PC2) because otherwise the routing table on PC3 is just going to
confuse
> matters.

Right.

> See if you can confirm points 3 and 4 above, and perhaps check out the
> paragraph after point 4, and see where that gets you.

Oh, I am even more confused what's going wrong now. :(

> Regards,
>
> Antony.
>
> -- 
> "Reports that say that something hasn't happened are always interesting to
me,
> because as we know, there are known knowns; there are things we know we
know.
> We also know there are known unknowns; that is to say we know there are
some
> things we do not know. But there are also unknown unknowns - the ones we
> don't know we don't know."
>
>  - Donald Rumsfeld, US Secretary of Defence
>
>                                                      Please reply to the
list;
>                                                            please don't CC
me.
>
>
>


