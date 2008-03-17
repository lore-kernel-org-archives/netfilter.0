From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: simple netfilter machine redirection
Date: Mon, 17 Mar 2008 09:25:40 -0500
Message-ID: <47DE7F64.7090505@riverviewtech.net>
References: <200803162323.m2GNNXe3013255@dell2.home> <alpine.DEB.1.00.0803161825030.19487@p34.internal.lan> <47DDA102.4060607@netoyen.net> <200803170010.m2H0ABFV016415@dell2.home>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200803170010.m2H0ABFV016415@dell2.home>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 03/16/08 19:10, Marty Leisner wrote:
> Right, I don't want any NAT -- I just want it to act as a tcp port 
> relayer (connection A-B is reflected on connection B-C)
> 
> where
> 
> A is the source
> B is the relay machine
> C is the destination
> 
> and all machines are on the same lan.

First this is an idea, I have not tried this in practice yet.

This is also extremely nasty and crosses a lot of layers against (best) 
practices.

You could (in theory) alter the destination MAC address of packets that 
are coming in to machine B destined to machine B's IP on TCP port 80 
over to machine C's MAC address and put them back on the wire. 
Presuming that Machine C knows what to do with the machine B's IP 
address, it can respond with it's MAC address back to machine A with out 
breaking things.

Now considering how you are in a LAN environment (single broadcast 
domain) you will have to make sure that machine C will not respond to 
ARPs for machine B's IP address and thus ensuring that machine B does 
the responding.

In effect what you get is a traffic flow somewhat like this:

Machine A sends packet (from machine A MAC) to MAC-B:IP-B:TCP:port 80
Machine B receives packet and alters it.
Machine B sends packet (from machine A MAC) to MAC-C:IP-B:TCP:port 80
Machine C receives packet and processes it.
Machine C sends packet (from machine C MAC) to MAC-A:IP-B:TCP:<bla>
Machine A receives packet and processes it.

The problem that I see with this is that a switch in the middle is going 
to get confused (be continually learning) where the Machine A's MAC is. 
  First it will see it coming in from where Machine A is connected and 
then it will see it coming in from where Machine B is connected.

However it is entirely possible that you could have Machine B completely 
re-construct a new layer 2 packet and send to Machine C's MAC with its 
own MAC as the source.  But again you are really messing with the layer 
2 network here.

You may also want to look at how Linux Virtual Server does some of what 
it does.  You may be able to use some of what it does to accomplish what 
you are wanting.

With out completely breaking and re-writing the 802.2 rule set and all 
of its support you really should be looking at NAT and / or some sort of 
proxy / gateway program.



Grant. . . .
