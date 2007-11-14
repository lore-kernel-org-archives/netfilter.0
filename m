From: Andreas Jellinghaus <aj@ciphirelabs.com>
Subject: internal packets to SNAT ip looped back - how to handle them?
Date: Wed, 14 Nov 2007 11:32:07 +0100
Message-ID: <fhej0g$ofh$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi.

I'm starting with the usual example: router with masquerading - hide
the internal 192.168.*.* net and rewrite the source with the internet ip of
the linux router/NAT.

if applications use STUN to find out what there source ip:port is NAT'ed to,
they can use this to allow other people to connect to them. so such a setup
works even fine if both sides have such a setup
Client A -> Linux A -> Internet -> Linux B -> Client B

and the route back works too. given of course both Clients used STUN to find
out what their local port:IP will be NAT'ed to and traded that information
using a third party server.

Now the problem I'm having is this: I want to simulate the above, but in my
case both clients are behind the same linux box.

linux knows this:
        client A:port A         is nat'ed to internet:port A
        client B:port B         is nat'ed to internet:port B
        (port A could become A' and B could become B', but lets
         say we are lucky and it was mapped like this...)

now client A sends a packet from client A:port A to internet:port B.
How can I configure netfilter so this will end up in a packet back
to the local network interface with source Internet:port A and destination
client B:port B?

iptables -t nat -A POSTROUTING -o internet -j SNAT --to in.ter.net.ip
isn't enought, I need a rule with "-d in.ter.net.ip" too?

but more important: when is the reverse step to SNAT done?
the transformation of "to linux B" to "to client B" on "linux B"
in the first example? isn't that done before routing takes place?

you see, I'm a bit confused. I want a packet to be internal - incoming
on the local lan interface, leaving again on the local lan interface -
but the packet should be handled as if it left on the internet interface
(SNAT) and was received again from internet (reverse part of SNAT).

Is there any way how I can set up NAT rules for this? 

and how would I need to firewall such a packet?
allow all packets from Client A to the local in.ter.net.ip?
what will be the outgoing interface at that moment?

Regards, Andreas

