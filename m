From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: "DNAT" w/o changing source address?
Date: Thu, 04 Oct 2007 10:23:28 -0500
Message-ID: <47050570.7010609@riverviewtech.net>
References: <1191424890.25752.27.camel@localhost.localdomain>	 <47042728.1060508@riverviewtech.net>	 <1191503642.13379.12.camel@localhost.localdomain>	 <4704F5F5.7010601@plouf.fr.eu.org> <1191507779.13379.50.camel@localhost.localdomain> <4704FFD6.8050304@plouf.fr.eu.org>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4704FFD6.8050304@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 10/04/07 09:59, Pascal Hambourg wrote:
> Do you mean that they are in different subnets ?

I doubt that the OPs systems are on different subnets, nor do I think 
that it really matters for what s/he is wanting to do.

> Private/public addressing does not matter here. You can have public 
> addresses behind a NAT box, although it may sound unusual (NAT is mostly 
> used to hide private addressing when you don't have enough public 
> addresses). The important word is "behind", meaning that traffic in both 
> directions flows through the NAT box. This is important because the NAT 
> box changed the source and/or destination address on the original 
> traffic, so it must put it back on the reply traffic in order for the 
> client to accept it as a reply. It's not the SNAT rule which puts the 
> original address back, it only makes the server see the NAT box as the 
> client and send the reply traffic back to it. But the drawback is that 
> the server does not see the real client source address.
> 
> Without SNAT, the mail server could use the NAT box as a gateway at 
> least for SMTP reply traffic (this could be done with advanced routing 
> if the mail server runs Linux) if they are in the same subnet or if a 
> tunnel can be established directly between them.

Ah yes, the old triangle of systems is being avoided.  System A talks to 
system B who talks to system C who talks back to system A.  System A 
knows that it talked to system B who for some strange reason is not 
replying while there is this other character system C that is striking 
up a conversation very improperly and as such being told where to RST to!

> Sorry, I do not know how LVS works. I just know how Netfilter NAT works.

As I understand it there are basically three different modes of 
operation for Linux Virtual Server (a.k.a. LVS) load balancers / 
directors:  NATing, Direct Routing, and Tunnel (a variant of DR).

I think DR and or Tunnel would be the better of the modes for this 
situation, seeing as how NAT will not work because the reverse traffic 
does not flow back through the LVS Director.

As I understand it (which could very well be flawed) in DR and Tunnel 
mode, your upstream router says that the virtual server is available via 
the next hop of the LVS director.  The LVS director in turn load 
balances and forwards (routes) the traffic on to the real servers which 
have the target IP bound to an interface.  Thus when the traffic does 
come in to the real server it comes in and goes directly in to the bound 
IP and associated services.  Thus when the services reply to the traffic 
they use the targeted IP as the source IP for reply traffic.  Thus we 
end up with system A talking to system C by way of system B with system 
C replying directly through routing.

I think DR and Tunneling are more of a switching / bridging technology 
in such as they alter the target ethernet mac addresses between the 
various systems to spread the load.

I'm not quite sure how you could emulate this with out using LVS, except 
possibly with bridging and EBTables rules to alter the target MAC of the 
inbound frames so that they are re-forwarded on to the real server. 
However for this to work your systems will have to be in the same 
broadcast domain.  If you want help with this, drop me a line and I'll 
see what I can 'switch' up.  ;)



Grant. . . .
