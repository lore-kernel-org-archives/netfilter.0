From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Routing problem
Date: Sat, 14 Feb 2004 09:09:20 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402140909.20468.Antony@Soft-Solutions.co.uk>
References: <002c01c3f247$9d3ee350$1530a8c0@HUSH> <200402131712.44158.Antony@Soft-Solutions.co.uk> <000a01c3f2d6$677d1680$1530a8c0@HUSH>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000a01c3f2d6$677d1680$1530a8c0@HUSH>
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

On Saturday 14 February 2004 8:41 am, Carlos Fernandez Sanz wrote:

> The link between the carrier and the linux box happens using WAN addresses,
> ie. 172.x.y.1 (them) <--> 172.x.y.99 (us). All traffic is exchanged using
> those two addresses - they just won't route traffic not being routed from
> 172.x.y.99.

Oh, so when you say "WAN address", you actually mean another private address 
(172.x.x.1), not the public address you've been assigned as part of your 
pool?

I think I understand now - you're talking about the router addresses which can 
talk to each other, not the source addresses of the packets being routed...

> We own *5* public addresses, and they route the traffic to all those
> addresses via 172.x.y.99 (our router).

Okay.

> The route also has 192.168.21.1 on another NIC, which is connected to our
> own LAN. It also has our first public address - so traffic we generate to
> internet uses this public address, and traffic coming from internet goes to
> this public address. (being routed through the 172.x.y.z) addresses.

What (exactly) do you mean by "It also has our first public address"?   Is 
that public IP assigned to one of your router's interfaces?   If it is, then 
simply connect the machine needing the second public IP address on it to that 
interface, pointing to the first public IP as the default route.   Provided 
your NAT rules are only applied to what was originally 192.168.21.x traffic, 
then those packets with (source address = second public IP) will simply go 
through the router and work without NAT.

If, on the other hand, you don't mean that the first public IP has been 
assigned to one of the interfaces on your router, then I see you have three 
choices (no doubt there are others, maybe some will be suggested by people):

1. Add another interface to the router, assign it your first public IP, and 
proceed as described in the paragraph above.

2. Add another interface to the machine requiring the public IP, make sure the 
software running on it binds to the public IP and not the private one, and 
set up a route on your router telling it "public IP number 2 can be found via 
this gateway", giving it the private address of the special machine as the 
gateway address.

3. Add an interface to the router and assign it some completely new IP 
address, outside any of the network ranges you are currently using (eg 
192.168.250.1), and create a point-to-point link to the machine requiring the 
public IP (which now needs only one interface, and is assigned that public 
IP, but again using a point-to-point route).

You might be able to achieve any of the above using a virtual interface 
instead of a physical one, but that would be harder to debug in the event of 
problems.

I hope we're getting somewhere now :)

> Just for the record, our user is a SAP employee who needs to access the SAP
> internal network from our office. They have a setup to allow workers to
> connect from home, etc, but obviously they didn't thought they could connect
> from another LAN...

Why don't they just use a VPN?

Antony.

-- 
In science, one tries to tell people
in such a way as to be understood by everyone
something that no-one ever knew before.

In poetry, it is the exact opposite.

 - Paul Dirac


