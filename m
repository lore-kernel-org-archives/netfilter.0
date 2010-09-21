From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Basic Routing
Date: Mon, 20 Sep 2010 22:34:10 -0500
Message-ID: <4C9827B2.3040406@riverviewtech.net>
References: <490DD23F.7060406@amfes.com> <49119087.5060307@thehaxbys.co.uk> <4911D85E.2080109@riverviewtech.net> <4C97D4B6.2000609@amfes.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C97D4B6.2000609@amfes.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Daniel L. Miller wrote:
> Once upon a time I asked this list some routing questions.  I've almost 
> got it - I swear I've ALMOST got it.  One more little push and I think 
> I'm there.

*chuckle*

Here's a *nudge* to help you get there.  ;-)

> Given the specific architecture:
> Windows Workstation 192.168.5.100, default gateway 192.168.5.1
> Linux Gateway/Router/VPN node 192.168.7.2, 192.168.5.1, 192.168.0.90, 
> default gateway 192.168.7.1
> DSL Modem 192.168.7.1

It sounds like your Windows workstation (192.168.5.100) uses your Linux 
router (192.168.5.1) as its default gateway and that your Linux router 
(192.168.5.1, 192.168.7.2 and 192.168.0.90) uses your DSL modem 
(192.168.7.1) as its default router.

(Windows)---(Linux)---(DSL)---(Internet)

Correct?

> Linux Server/Router/VPN server/Virtual Server 192.168.0.71, 
> 192.168.56.1, default gateway 192.168.0.1
> Virtual Machine 192.168.56.20, default gateway 192.168.56.1

It sounds like your virtual machine (192.168.56.20) uses your Linux 
router (192.168.56.1) as its default gateway and that your Linux router 
(192.168.56.1, 192.168.0.7) uses <something> (192.168.0.1) as its 
default gateway.

(VM)---(Linux)---(<something>)---(Internet)

Correct?

I'm not sure what the <something> is that has the IP address 192.168.0.1.

Further, I can't tell if the 192.168.0.x networks on the two Linux 
routers is the same network (or VPN) or not.  -  For the sake of 
conversation (and demonstration) I'm going to continue as if they are.

If the above two system share the 192.168.0.x network, we end up with a 
topology that might be depicted like this:


                +---(DSL)---(Internet)
                |
(Windows)---(Linux)---+
                       |
                       +---(<something>)---(Internet)
                       |
      (VM)---(Linux)---+

Or via IP:



                                       +---(192.168.7.1)---(0.0.0.0/0)
                                       |
(192.168.5.100)---(192.168.5.1, 192.168.7.2, 192.168.0.90)---+
                                                              |
 
+---(192.168.0.1)---(0.0.0.0/0)
                                                              |
             (192.168.56.20)---(192.168.56.1, 192.168.0.71)---+

(I'm not sure if that's going to work wrap properly or not.)

I'm going to take a stab and presume that the what you are calling 
"Linux Gateway/Router/VPN node" is a VPN client that is connected to 
what you are calling "Linux Server/Router/VPN server/Virtual Server" and 
that it is being bridged in to the 192.168.0/24 network.

Correct?

For the sake of conversation (and demonstration) I'm going to continue 
as if I am correct.

> What is the "easiest" way of "achieving routing" between the Windows 
> Workstation and the Virtual Machine?

Add a route to the "Linux Gateway/Router/VPN node" so that it knows that 
it can get to the 192.168.56/24 network via the "Linux Server/Router/VPN 
server/Virtual Server" (192.168.0.71).  And vice versa, add a route to 
the "Linux Server/Router/VPN server/Virtual Server" so that it knows 
that it can get to the 192.168.5/24 network via the "Linux 
Gateway/Router/VPN node" (192.168.0.90).

> Is this an instance where NAT 
> would make administration simpler instead of "pure" routing?  The 
> cumbersome-but-working method I have employed at the moment includes;

No.  NAT is seldom a better solution than "pure" routing.

> add 192.168.56.0/24 via 192.168.0.71 route to Workstation

The workstation doesn't need to explicitly have a route because it's 
default gateway has one.

> add 192.168.56.0/24 via 192.168.0.71 route to Linux Gateway
> add 192.168.5.0/24 via 192.168.0.90 route to Linux Server

That's all you should need to do.

I am curious, why do you consider this to be "cumbersome"?

> I almost understand the need for the 192.168.5.0/24 entry on the Linux 
> Server side - because otherwise the router doesn't know how to reply, 
> and the same goes for the 192.168.56.0/24 entry on the Gateway side - 
> otherwise the Gateway doesn't know how to reach that subnet in the first 
> place.  But, if the Gateway is defined as the default for the 
> Workstation, why is a routing entry required for the Workstation?

No, the routing is not required on the Windows workstation or the 
virtual machine because their respective default gateways know the 
routes for them.

You did find your answer, but hopefully this will help you understand 
why the answer you found works.

It might not be obvious, and seem to complicate things, but I don't 
think I would bridge the VPN client in to the VPN server's network.  I 
would rather set up a small network between the VPN client and the VPN 
server and set up routes on the VPN server to what is on either end. 
(In your case, it would be a matter of changing the next hop gateway / 
router that the "Linux Server/Router/VPN server/Virtual Server" used.) 
Doing this will help prevent spurious traffic from the 192.168.0/24 
network from going through the VPN to the "Linux Gateway/Router/VPN 
node".  Further, you will have the capability for more security on the 
"Linux Server/Router/VPN server/Virtual Server" in such as you can use 
IPTables to firewall (based on network) the VPN traffic.  Also, your 
(completely) "Linux Gateway/Router/VPN node" is dependent on the 
configuration of the 192.168.0/24 network, where as if it was routed, 
you would simply need a route referencing the "Linux Server/Router/VPN 
server/Virtual Server", with out caring what is on the other side of the 
"Linux Server/Router/VPN server/Virtual Server", there by separating the 
networks.  As it is (using bridging) you can't change things (addresses 
/ network config / etc.) on the 192.168.0/24 network with out 
re-configuring the "Linux Gateway/Router/VPN node".

Setting up the additional routed VPN may seem like extra work, but it 
allows for abstraction / isolation / simplification of things for 
changes later.  -  Comparing things to the internet, think what would 
happen if you had to re-configure your internet connection every time 
your ISP made changes (additions / removal) to their back haul 
providers.  Routing allows you to simply rely on your ISP's upstream 
(gateway) IP, and let them worry about what is beyond that.  ;-)



Grant. . . .
