From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Basic Routing
Date: Tue, 04 Nov 2008 17:13:38 -0600
Message-ID: <4910D722.6050008@riverviewtech.net>
References: <490DD23F.7060406@amfes.com> <013f01c93d0c$f4a47410$dded5c30$@info> <490DF4CA.1010808@amfes.com> <490E12DF.6090602@riverviewtech.net> <490E597B.50400@amfes.com> <490E633D.20103@riverviewtech.net> <490F5103.8070409@amfes.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <490F5103.8070409@amfes.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

(Now that I have time *AND* internet, DSL was out at the house last 
night... *GR!!!*)

On 11/03/08 13:29, Daniel L. Miller wrote:
> *dumbly nodding*  Ok.

Ok as in "Dough!" or ok as in "???"?

> *dumbly nodding - slight eye glazing*  Um....ok.

Remember that a system will decide where to hand the packet(s) off to 
(which router) by looking through its own routing table sequentially. 
The first route that is found that matches the destination that you are 
trying to reach is the route that is used to send the packet(s).

The /Default Gateway/ is a special route in such as it is the last 
resort at the end of the routing table.  So if no other routes (if there 
are any) match then the /Default Gateway/ route will match any 
destination, thus sending any packet(s) that did not match any other 
routes out through the /Default Gateway/.  Another way to think of the 
/Default Gateway/ is as a 'Catch All' route.

> *significant eye glazing - jaw slack*  Um...er...maybe...

(Are you having fun yet?)

> Rephrase - "Router C checks it's list of routes, figures out it's 
> clueless with regard to the route for Router D, and passes the buck to 
> Router C's default gateway"

Much closer.  Try this on for size.  "Router C checks it's list of 
routes, figures out it's clueless with regards to the route to host B, 
and passes the buck to Router C's default gateway."  (Remember that 
Router C knows how to reach Router D because they share the common 
connection.)


> *Excitedly* - That's it!  That's the part we need to talk about!  Router 
> "hands off the IP packet to the next router to the next to the next" -

Ok.  I think it's time for a quick segway in to how a packet(s) are 
passed around ethernet networks.

Remember that IP addresses /cross/ network boundaries and that MAC 
addresses are /confined/ with in network boundaries.  So we talk IP 
addresses across multiple different networks.  When two hosts with in 
the same network talk they really talk MAC address to MAC address.

Let's take your fairly simple diagram below.

+---+         +---+         +---+         +---+
| A +---(x)---+ C +---(y)---+ D +---(z)---+ B |
+---+         +---+         +---+         +---+

This is what the sequence of events will be for host A to send an IP 
packet to host B.

  - A sends an ethernet frame with a source MAC address of x.A and a 
destination MAC address of x.C, containing an IP packet with a source IP 
address of x.A and a destination IP address of z.B.
  - C sends an ethernet frame with a source MAC address of y.C and a 
destination MAC address of y.D, containing an IP packet with a source IP 
address of x.A and a destination IP address of z.B.
  - D sends an ethernet frame with a source MAC address of z.D and a 
destination MAC address of z.B, containing an IP packet with a source IP 
address of x.A and a destination IP address of z.B.

Notice how each pair of locally connected hosts (on the same network) 
talk to each other with their own MAC addresses to work together to pass 
the IP packet containing the actual message that is to be sent.

> Router C has a route table -
> 192.168.0.0/24 dev eth0
> 2.3.4.5 dev eth1
> default gateway 2.3.4.4
> 
> Router 2.3.4.4 (premise equipment from mysterious ISP)
> mysterious routing table
> 
> Router 5.4.3.1 (premise equipment from other ISP)
> more mysterious routing table
> 
> Router D has a route table -
> 10.0.0.0/8 dev eth0
> 5.4.3.2 dev eth1
> default gateway 5.4.3.1

Ok.  You just indicated that routers C and D are not directly connected 
to each other on the same ethernet network but rather are in different 
subnets, likely using different ISPs.  This complicates things a bit.

> Does the above communication involve NAT?  No "hosts" or private 
> networks involved - all public IP's between them (unless of course the 
> packets traverse private IP ranges within the ISPs' networks before 
> coming back out.

Possibly, at least for general internet access.  There will be NAT 
between the private LAN IP address space (192.168.0/24 and 10/8) and the 
internet.

That being said, if you establish a VPN between Router C and Router D 
across the internet (which I'm going to assume will be done), you can 
have LAN to LAN traffic with out NATing in between them.  This can 
happen because the VPN will encapsulate the traffic leaving the 
192.168.0/24 network going to the 10/8 network.  This encapsulation raps 
the packets and uses the globally routable IP address of Routers C and D 
as the source and destination IPs for the /VPN/ traffic.  When the VPN 
traffic reaches Router D, it will decapsulate it and send it out to the 
LAN on its end.

So, yes NAT is used to send normal traffic to the internet and no NAT is 
not used (VPN encapsulation is) to send LAN to LAN traffic.

> *Sheepishly* Assume for sake of argument I'm expressing myself poorly - 
> no proxies involved in this discussion.  That would make it too simple.

Ok.  I just had to double check, you understand why.  :)

> *Assertively* No proxy.

*nod*

> Um...no.  Too complicated.
> 
> A==>C<==Internet==>D<===B

(See my email from yesterday afternoon.)

> Two offices on opposite sides of the world linked via Internet.

*nod*

This means that you will most likely be dealing with VPNs

> So the world's most expensive super-duper whatchamacallit (fill in the 
> blank here with router, firewall, bridge, modem, magic cauldron), placed 
> between giant corporate's network (using private address space) and the 
> Internet - will perform NAT?  Somewhere somehow NAT (in particular, 
> source NAT for outbound access from the private and destination NAT to 
> provide services to Internet) must be performed?

Correct.  The word you are looking for is usually a router that does 
firewalling, or sometimes knows as a firewalling router.  (Remember that 
firewalls really /filter/ traffic while routers /route/ traffic, 
sometimes altering it along the way.)

Even IBM and Microsoft (presuming they are using private class IP 
address space) are either running NATing routers between their internal 
corporate networks.  (As an alternative they could be doing proxying, 
but it is most likely that they are using NAT.)



Grant. . . .
