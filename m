From: "Carlos Fernandez Sanz" <cfs-netfilter@nisupu.com>
Subject: Re: Routing problem
Date: Sat, 14 Feb 2004 09:41:56 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000a01c3f2d6$677d1680$1530a8c0@HUSH>
References: <002c01c3f247$9d3ee350$1530a8c0@HUSH> <200402131550.25323.Antony@Soft-Solutions.co.uk> <003301c3f24e$a8683b80$1530a8c0@HUSH> <200402131712.44158.Antony@Soft-Solutions.co.uk>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter <netfilter@lists.netfilter.org>

I'll try to express it more clearly, since you're not the only one who
didn't get me right :-)

The link between the carrier and the linux box happens using WAN addresses,
ie. 172.x.y.1 (them) <--> 172.x.y.99 (us). All traffic is exchanged using
those two addresses - they just won't route traffic not being routed from
172.x.y.99.

We own *5* public addresses, and they route the traffic to all those
addresses via 172.x.y.99 (our router).

The route also has 192.168.21.1 on another NIC, which is connected to our
own LAN. It also has our first public address - so traffic we generate to
internet uses this public address, and traffic coming from internet goes to
this public address. (being routed through the 172.x.y.z) addresses.

OK, so I said we have 5 public addresses, one being used for the router for
general internet access and 4 spare.

So far, when I needed someone to have a public IP (whatever the reason), I
just said in iptables "all packets from this internal IP address goes out
using this external IP address, and all packets coming from the outside for
this external address we send to this internal IP". Works fine.

Problem is, we have a specific situation where the real IP of the computer
behind the firewall matters, because it's used as part of the signature. So
I need this computer to actually *own* the address, and have the router just
forward the traffic from one interface to the other with no NAT whatsoever.

Just for the record, our user is a SAP employee who needs to access the SAP
internal network from our office. They have a setup to allow workers to
connect from home, etc, but obviously they didn't thought they could connect
from another LAN...

----- Original Message ----- 
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: "netfilter" <netfilter@lists.netfilter.org>
Sent: Friday, February 13, 2004 18:12
Subject: Re: Routing problem


> On Friday 13 February 2004 4:30 pm, Carlos Fernandez Sanz wrote:
>
> > > > Before you ask: I can't connect this special computer to the same
place
> > > > I connect the linux box (which would be the obvious solution)
because
> > > > the carrier expects traffic to come from one WAN IP, owned by the
linux
> > > > box.
> > >
> > > How do they expect you to use any of the other IPs in the pool they
have
> > > given you?
> >
> > I do use them by redirecting traffic from the linux box to the
destination
> > boxes (such as all trafic for public IP 2 goes to 192.168.21.2, for
> > example). This works fine, *except* in this particular case, where any
> > NATing is not an option. I need the computer behind the linux box to
> > actually own the public address, because it signs packets with it.
>
> I still don't understand.   One of your above statements must be
incorrect:
>
>  - either the ISP requires all your outgoing traffic to come from a single
> public address,
>
>  - or you can send traffic from IP1, IP2, IP3 etc as you wish.
>
> If the first is true (you have to send all traffic from just a single
address)
> then I don't see how you can do NAT from IP2 to 192.168.21.2, because the
> reply packets going back out to the Internet are going to have the source
> address (after de-NATting) of IP2 - therefore you *are* being allowed to
send
> from more than one public IP.
>
> If the second is true (you can send from IP1, IP2, IP3 etc as you wish)
then
> as you said in the first place, you can connect the user who wants to use
> some nasty protocol which embeds OSI layer 3 information into OSI layer 7
> traffic to the same place as your existing Linux box and give them a real
> public IP of their own.
>
> What does your ISP claim will happen if you use more than one of your
assigned
> pool of IP addresses for the source address of outgoing traffic?
>
> Antony.
>
> -- 
> The first fifty percent of an engineering project takes ninety percent of
the
> time, and the remaining fifty percent takes another ninety percent of the
> time.
>
>


