From: Askar Ali Khan <askarali@gmail.com>
Subject: Re: router/firewall
Date: Fri, 2 Jul 2004 15:26:56 +0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <a0f69e504070203265f6fc9f8@mail.gmail.com>
References: <a0f69e504070122354e2d19d5@mail.gmail.com> <200407020952.41515.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407020952.41515.Antony@Soft-Solutions.co.uk>
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
To: netfilter <netfilter@lists.netfilter.org>

Lot of new things for me :)


On Fri, 2 Jul 2004 09:52:41 +0100, Antony Stone
<antony@soft-solutions.co.uk> wrote:
> 
> On Friday 02 July 2004 6:35 am, Askar Ali Khan wrote:
> 
> > Im learning lot of new things here specially from Mr. Antony Stone he
> > is master :)
> 
> Please - I do not necessarily know more than other people who are here - I
> just happen to answer more of the questions, and possibly answer them a
> little sooner than others.
> 
Ofcourse your contribution to this mailing list is greattt, no one but
your there with solution to lot of ours problem :)
heh i don't wana make your fly with all this sorta praises ;)
/anthony blueshes
;)

> > Alright here with another very beginner question :)
> > my linux box is part of LAN where net is connected via windowz system.
> > my linux box uses windows box as gateway to Internet.
> 
> Sounds like the wrong way round to me - what protects (firewalls) your Windows
> machine from all the bad stuff out there on the Internet?
security is not a concern here to me,  but windowz working fine with
my dialup modem.
> 
> > There is another windowz client (1) now I want to make my this linux
> > box "gateway/firewall" for that window client.
> >
> > first thing I did to enbble forwarding on  my linux box with..
> >                 net.ipv4.ip_forward = 1
> >
> > my only  interface on this linux box is eth0 i also created another
> > vitual interface eth0:1, now i want to accept LAN tarffic from windows
> > client on eth0 and forward it "outbound" on eth0:1
> > howto? :)
> 
> So, you have a Linux machine with only one interface, and you want to make it
> a router for a machine on your network, with its upstream gateway being
> another machine on the same network?
> 
> This sounds like a horribly complicated routing setup to me (this *is* a
> routing question, by the way - not a netfilter question), and I really
> wouldn't advise doing it.
> 
> From a security point of view, if you do not physically separate two networks
> by plugging them into different network cards on a router (firewall), then
> the security can be so easily bypassed that it is pointless.
> 
> From a network management point of view, trying to route packets between
> different machines, all on the same physical LAN (and, I suspect, also all on
> the same logical subnet), is a very difficult thing to make work (and in my
> opinion not something you should even try to make work).
> 
> However, to answer your netfilter-specific questions, and educate you about
> virtual interfaces:
> 
> > I will appreciate if someone teach me for both cases
> > 1) to use the interface etho0 to foward packets
> > 2) also to use the other virtual interface eth0:1 for fowarding
> >
> > It means I need to separate scripts one for eth0 and another for eth0:1
> 
> Routing is a separate matter from netfilter - you have to get the routing
> working first, and then you can use netfilter to block certain packets so
> that they don't get routed.
> 
> Secondly, netfilter doesn't allow things like eth0:1 (it won't accept the
> colon), so all you do is use the normal interface name (eth0).   It's the

heh yeah that why iptables aways complains whanever i include eth0:1
in a rule, okay i get rid of this virtual interface :)

> asme physical interface anyway, and this will do what you want - you can use
> -i eth0 and -o eth0 to match packets coming in or going out on eth0:1
> 
> If you *really* want some help getting that weird setup your described earlier
> working, you'll need to provide a network diagram with some IP addresses, and
> a clear description of what you want routed where and how you think replies
> should get routes back again.
>
 
> I really do not advise it though :)
hmm I dunoo how to create diagram, however im trying to give you and idea, 
1) windows machine IP 192168.0.1 (connected to Internet dialup modem) ------>A
2)linux machine IP 192.168.0.2---->B
3)Another windows machine 192.168.0.3----->C

its a very simple LAN :) what i want to do is instead of traffic for
Internet goes from C------->A,       A--------->C
its travel from C----->B------->A,                         A---->B----->C
that only C uses the linux box as router/firewall, all the traffic
from C first travel to B and then to A . :)

Regards

Askar
> 
> Regards,
> 
> Antony.
> 
> --
> Having been asked for a reference for this man,
> I can confirm that you will be very lucky indeed if you can get him to work
> for you.
> 
>                                                      Please reply to the list;
>                                                            please don't CC me.
> 
>

