From: Jason Opperisano <opie@817west.com>
Subject: Re: assigning alias ip address
Date: Fri, 10 Sep 2004 08:45:51 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094820350.1900.59.camel@wolfpack.ljm.dom>
References: <003c01c496e3$b6416c60$f82ffea9@black>
	<1094816812.1900.16.camel@wolfpack.ljm.dom>
	<005e01c49730$f628a620$f82ffea9@black>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <005e01c49730$f628a620$f82ffea9@black>
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
Cc: John Black <black@arbbs.net>

On Fri, 2004-09-10 at 08:23, John Black wrote:
> > routing.  the "one-arm" router scenario can be made to work, as long as
> > you understand the traffic flow and the routing quirks that can arise. 
> > the $25,000 question is:  what is the default gateway of 10.10.10.11 and
> > .12?
> 
> the gateway for these ip address is 10.10.10.1

which is an IP address on what device, and where is this device located
in the logical flow of traffic?

> > is there a particular reason why your netfilter box can't have 2 NICs in
> > it, with the servers placed behind it?
> > 
> 
> the netfilter box has 4 NICs
> eth0 (outside world)
> eth1 (192.168.1.0/24) 
> eth2 (192.168.2.0/24) 
> eth3 (192.168.3.0/24) 

was the 10.10.10.x stuff in your original post an analogy for (outside
world)?

since my dentistry skills are a bit rusty, i'll answer you question in
the generic case:

when you DNAT a request packet (TCP SYN, for example), you need to
ensure that the reply packet (TCP SYN-ACK) also "goes through" the
device performing the DNAT.  otherwise--the threeway handshake will
never complete.  the fancy word for this is asymmetric routing. and it
looks something like:

1)  client sends SYN from 1.2.3.4 to 5.6.7.8

2)  DNAT device receives SYN packet from 1.2.3.4 destined for 5.6.7.8
and DNATs it to 9.10.11.12

3)  9.10.11.12 receives SYN packet from 1.2.3.4 and replies with SYN-ACK
directly through it's default gateway (which is not the DNAT device, nor
is DNAT device upstream from this gateway)

4)  client (1.2.3.4) receives SYN-ACK from 9.10.11.12 and discards it,
as client never sent a SYN to 9.10.11.12.

the cheap and dirty solution is to have DNAT device perform an
additional SNAT on the request from 1.2.3.4 to make it appear to come
from ${DNAT device's IP address}; thus ensuring that 9.10.11.12 will
send it's SYN-ACK back through DNAT device.  the downside is that it
makes all your traffic appear to come from one IP address--which has it
obvious logging/tracking disadvantages.

the preferred solution is to perform the DNAT at such a point in the
network topology as to avoid an asymmetric routing situation.

not sure if this helps, hurts, or annoys.

-j

-- 
Jason Opperisano <opie@817west.com>


