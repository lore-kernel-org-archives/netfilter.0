From: Jason Opperisano <opie@817west.com>
Subject: Re: Netfilter bug ? NAT'ed connections ignore icmp redirect
Date: Wed, 15 Sep 2004 11:36:12 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095262572.1899.66.camel@wolfpack.ljm.dom>
References: <20040915133959.GA22165@hswn.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040915133959.GA22165@hswn.dk>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Wed, 2004-09-15 at 09:39, Henrik Stoerner wrote:
> I have a setup where I use a Linux box with netfilter to forward
> tcp connections between a "client" and a "server.
> 
> The Linux box has a default gateway defined. However, there are
> multiple other routers on the same network, and the default
> gateway router sends ICMP redirects to inform the Linux box 
> which router should be used to reach some destination.
> 
> In ascii art (somewhat simplified):
> 
> 
> 				  |----| firewall |---| server |
>                                   |
>                                   |
>                                   |----| routerA |-------
>                                   |    | def.gw  |
>       | Linux NAT |   ------------|
>                                   |
>                                   |----| routerB |----------
>                                   |
>                                   |----| routerC |----+-----
>                                   |                   |
>                                   |                   |
>                                   |                   |
> 				                  | client |
> 

since this is primarily a "firewall guy" mailing list; i believe i am
required by law to state:  do not rely on ICMP redirects to route your
network.  removing my "firewall" hat for my "routing" hat now:  do not
rely on ICMP redirects to route your network.  removing my "routing" hat
for my
"in-the-true-spirit-of-linux-everything-i-want-to-do-should-work-the-
way-i-want-no-matter-how-many-RFC's-it-goes-against-or-how-bad-of-an-
idea-it-is" hat...i will try to explain why i think you're seeing this
behavior...

and no--i don't think this is a *bug* in netfilter, i think it's a
symptom of how linux handles ICMP redirects and the routes created by
them.  if you read up on how linux treats an ICMP redirect that it
receives--it limits the scope of the resulting route to host
communications.  therefore, i believe the "linuxnat" box is ignoring the
route created by the ICMP redirect because the source of the packet is
not local at the time of the routing decision.

follow this:

SYN:
	ORIGINAL PACKET:
		clientip.unpriv -> linuxnat.1984

	PREROUTING (DNAT):
		clientip.unpriv -> server.1984
       
	*** ROUTING DECISION ***

	POSTROUTING (SNAT):
		linuxnat.unpriv -> server.1984

SYN-ACK:
	ORIGINAL PACKET:
		server.1984 -> linuxnat.unpriv

	PREROUTING (UNDO SNAT):
		server.1984 -> client.unpriv
       
	*** ROUTING DECISION ***

	POSTROUTING (UNDO DNAT):
		linuxnat.1984 -> client.unpriv  

so--at the time of the routing decision for the reply packet--the source
is the server IP, not the linuxnat machine's IP.

check the output of "ip route list table all" on linuxnat and look at
the "scope" that the route to "client" ends up under.  more
importantly--see if it shows up in the output of "ip route list table
all scope global" as my guess is that it does not.

if you've actually read this far--may i humbly suggest using a dynamic
routing protocol to route your environment?  zebra/quagga is pretty
painless--especially if you're familiar with cisco IOS configuration
syntax.

-j

-- 
Jason Opperisano <opie@817west.com>


