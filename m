From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: conntrack and ESTABLISHED / UNREPLIED connections
Date: Mon, 14 Jul 2008 10:55:30 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0807141026370.17325@blackhole.kfki.hu>
References: <486D31D9.9070900@tigertech.com> <4872A115.2030604@tigertech.com>
 <Pine.LNX.4.64.0807081130220.7417@blackhole.kfki.hu> <4873A605.1010209@tigertech.com>
 <Pine.LNX.4.64.0807090842270.11391@blackhole.kfki.hu> <4874E5AB.4070700@tigertech.com>
 <Pine.LNX.4.64.0807101247240.13027@blackhole.kfki.hu> <4876AD43.3020205@tigertech.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4876AD43.3020205@tigertech.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert L Mathews <lists@tigertech.com>
Cc: netfilter@vger.kernel.org

On Thu, 10 Jul 2008, Robert L Mathews wrote:

> Jozsef Kadlecsik wrote:
> 
> > Client sends RST, which is out of (before) the window (left edge is at
> > 2354211889), thus ignored by the server.
> 
> That makes sense, but it seems like conntrack processes the RST and marks the
> original connection as closed, then treats the server resends as new outgoing
> connections, which doesn't seem right.
> 
> In other words, if the server's TCP stack is ignoring the RST, shouldn't
> conntrack ignore it, too?

In theory, yes. But conntrack does not have got the same info as the end 
nodes, e.g. packets which were seen and taken into account by conntrack 
may get lost in transit. The window sizes in netfilter can easily be 
slightly wider than the real window sizes at the sender and the receiver. 
This is the reason why conntrack may think the RST segment is valid and 
therefore destroys the conntrack entry.
 
> Whatever it is, it's unfortunately quite common -- as I said, any of our
> reasonably-busy Web servers show thousands of such phantom connections from
> hundreds of unique IP addresses.

Still, it's quite strange. Why such RST packets are generated at all?

"Late" packets (i.e. packets which are received after a connection is 
destroyed in conntrack) creates "phantom" connections if 
nf_conntrack_tcp_be_liberal is enabled (which is the default). We have to 
balance on a two-edge sword: if we keep the connection in memory too long 
after we have seen a complete termination (FIN-FIN-ACK or RST), then we 
waste memory and conntrack is susceptible to DoS attacks; if we destroy 
the connections too fast, the late packets create phantom connections or 
false alarms.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
