From: "Carlos Fernandez Sanz" <cfs-netfilter@nisupu.com>
Subject: Re: Routing problem
Date: Sat, 14 Feb 2004 16:19:31 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003a01c3f30d$f21c9630$1530a8c0@HUSH>
References: <002c01c3f247$9d3ee350$1530a8c0@HUSH> <200402131712.44158.Antony@Soft-Solutions.co.uk> <000a01c3f2d6$677d1680$1530a8c0@HUSH> <200402140909.20468.Antony@Soft-Solutions.co.uk>
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

(sorry, the first time it went out incomplete)

> > The link between the carrier and the linux box happens using WAN
addresses,
> > ie. 172.x.y.1 (them) <--> 172.x.y.99 (us). All traffic is exchanged
using
> > those two addresses - they just won't route traffic not being routed
from
> > 172.x.y.99.
>
> Oh, so when you say "WAN address", you actually mean another private
address
> (172.x.x.1), not the public address you've been assigned as part of your
> pool?

Exactly. WAN is the term the carrier uses for this.
>
> I think I understand now - you're talking about the router addresses which
can
> talk to each other, not the source addresses of the packets being
routed...

Exactly. Those are always public IP addresses.

> > The route also has 192.168.21.1 on another NIC, which is connected to
our
> > own LAN. It also has our first public address - so traffic we generate
to
> > internet uses this public address, and traffic coming from internet goes
to
> > this public address. (being routed through the 172.x.y.z) addresses.
>
> What (exactly) do you mean by "It also has our first public address"?   Is
> that public IP assigned to one of your router's interfaces?   If it is,

Actually I don't have it *assigned*, because the interface where packets
come from internet has 172.x.y.99... so when anything comes to our first
public address, I DNAT it to the router private address. I guess I could 'ip
addr add' the IP instead of doing this.
then
> simply connect the machine needing the second public IP address on it to
that
> interface,

How? By connecting the router interface, the second machine, and the carrier
gateway to the same switch/hub? I'm not sure that would do, remember that
packets to the internet must come from the router using the 172.x.y.99
address...so the second machine and the carrier gateway can't talk to each
other directly.


Carlos.


