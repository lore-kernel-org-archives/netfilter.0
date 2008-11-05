From: John Haxby <jch@thehaxbys.co.uk>
Subject: Re: Basic Routing
Date: Wed, 5 Nov 2008 12:24:39 +0000
Message-ID: <49119087.5060307@thehaxbys.co.uk>
References: <490DD23F.7060406@amfes.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4910E095.2050003@amfes.com>
References: <013f01c93d0c$f4a47410$dded5c30$@info>
References: <490DF4CA.1010808@amfes.com>
References: <490E12DF.6090602@riverviewtech.net>
References: <490E597B.50400@amfes.com>
References: <490E633D.20103@riverviewtech.net>
References: <490F5103.8070409@amfes.com>
References: <4910D722.6050008@riverviewtech.net>
References: <4910E095.2050003@amfes.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: dmiller@amfes.com
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

Daniel L. Miller wrote:
> *Head bouncing on desk*  You just had to do it.  You just HAD to throw 
> something else in, didn't you?  Ok - no VPN during these 
> discussions!!!  That's next thread.


Perhaps the problem is that the good people on this list know just too
much about the finer points of routing and the caveats and wrinkles that
you occasionally need to avoid special purpose problems.

For the most part, though, it's actually quite simple.   And I know that
some of the things I will say are wrong in some cases and I would hope
that someone will explain to me where they're wrong and maybe we'll all
be enlightened.

Anyway, routing first.   For a given machine it's pretty
straightforward.   You have an IP address to which you want to send a
packet (routing is per-packet, not per-connection).   Type "route -n"
and run your finger down the list of routes from top to bottom.   Use
the "genmask" to mask off the bits in the IP address that you have (that
is, "and" it -- eg an IP address of 192.168.2.5 and a genmask of
255.255.255.0 will give you 192.168.2.5).  If the result is the same as
the destination column then you send the packet to the gateway and
device indicated.

There are two special cases in the routing table: a gateway of 0.0.0.0
means "this machine" which means, basically, that you're on the same LAN
as the destination IP.   A destination of "0.0.0.0" (and similar mask)
is usually called the default route: if you take the conjunction ("and")
of any IP address and 0.0.0.0 you'll get 0.0.0.0 and so any address not
previously matched will go to the indicated gateway.

You may notice that the routing table is sorted by the number of zeroed
bits in the genmask column: 255.255.255.0 comes before 255.255.240.0
which comes before 255.255.0.0 and so 0.0.0.0 is always last.  That's
why you can run your finger down the routing table from top to bottom to
find where a packet will go and that, of course, is exactly what the
kernel does.

Most machines only have a single NIC and are connected to a single
network and have a default route so the routing table has only two
entries: the local LAN and the default route.   Machines with more than
one network device will have more routing entries -- you need at least
two network devices (real or virtual) to have any need for more complex
routing.

I slipped in "(real or virtual)" there for a reason.  When you set up a
VPN connection from home to the office then it is exactly as though you
have put an extra network card in your machine and run a very long cable
to the office.   You now have two network devices, one connected to the
local LAN and one connected to the office network and a routing table to
match.   Actually, there's one small difference between a virtual
private network and a real private network (apart from miles of cat-5
cable): there is a route with a genmask of 255.255.255.255 that is used
to route traffic to the machine at the other end of the vpn link.
Apart from that, think of a VPN has just another NIC that happens to be
called (usually) tun0 instead of eth1.


Right.  NAT.

NAT is completely different to routing.    In routing a packet is sent
to a gateway machine completely unmodified (apart from some housekeeping
things that you don't need to worry about right now).   NAT is different
because it modified the IP packets.   For most people, NAT modifies the
source IP address and port -- that means that when you're at home
surfing the net behind your Netgear firewall/router/ADSL modem then the
source IP address isn't 192.168.0.2, it's whatever IP address your ISP
gave you.  Your partner/children/cat surfing the net on a machine whose
local IP address is 192.168.0.3 will also have the IP source address of
their IP packets rewritten to that same IP address that your ISP gave
you -- you will appear to be using the same computer as far as any web
server is concerned.

Some organisations, like the one I work for, use network 10 for internal
IP addresses but any external connections appear to originate from a
public IP address in exactly the same way.   There are a couple of
thousand people on this site all sharing one external IP address, all,
apparently crowded round one screen sharing the same keyboard.

An organisation I used to work for had a class A subnet all of its own,
network 15 and I had a machine whose address was 15.145.139.57 (well, I
might have, I don't remember exactly what it was).  In principle that
machine was able to connect to the external network without any sort of
NAT and, equally, machines from the outside world could connect to it.
In practice, of course, there were (and presumably still are) firewalls
that prevented such traffic.  Access to the Big Bad Internet was (and
maybe still is) through a proxy: this is different to NAT:  routing
happens at the IP packet level; NAT happens at the TCP (or UDP) connect
level; proxying happens at the application protocol level.  You point
Firefox at an HTTP proxy that can either return a page it has prepared
earlier or run the HTTP request on your behalf.  It's a lot more
complicated than that but that's because it's happening at the protocol
level and so involves all kinds of icky details that TCP and IP neither
know nor care about.

And finally, just to round things off, there's a class of proxy called a
transparent proxy.  As far as firefox (or anything else) can tell it's
connecting to the outside world directly, but in practice connections
are redirected to a proxy by some messing by iptables or some similar
cleverness in a Cisco router.   Transparent proxies are quite cool.


Does that help or has it left you even more confused?

jch

