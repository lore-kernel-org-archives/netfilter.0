From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Help with understanding MASQ and packet flow through iptables
Date: Sat, 8 Jun 2002 20:02:25 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206081902.g58J2UA31520@Networker.rockstone.co.uk>
References: <F556i14bcLMqvsyRbHy0002025d@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <F556i14bcLMqvsyRbHy0002025d@hotmail.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Saturday 08 June 2002 7:05 pm, Linux Rulz wrote:

> I'll make this short.  I'm running RedHat 7.1, kernel 2.4, and iptables
> with MASQ modules.  I'm having trouble understanding the flow of a packet
> coming into my box, so I'm confused as to which chains to use.
> Since my packets are MASQed, does that handle the forwarding for me,

No, it does not automatically handle FORWARDing - you still have to create 
rule to allow the packets through your machine.   Masquerading does 
automatically handle the reverse translation of the packets, though, so you 
only need to specify that they get source translated on the way out, and they 
will automatically get destination (de)translated on the way back in.

This is true no matter whether you use MASQUERADE or SNAT to do the original 
translation.

> and all I need to use is INPUT/OUTPUT...

The INPUT and OUTPUT chains are only for packets terminating on the netfilter 
machine itself.   eg if you want to SSH to the box running netfilter, you 
need rules in your INPUT chain to allow that connection on TCP port 22, and 
to allow the replies back out through the OUTPUT chain.

However, if you want to SSH *through* the netfilter machine to some other 
machine routed beyond it, you do not need any rules in your INPUT and OUTPUT 
chains at all, and they can DROP everything - in this case you only need to 
have rules in your FORWARD chain to allow the initial connection and the 
returning reply.

> or do I need to use the FORWARD chain too?

IPtables is a lot simpler than IPchains.   The rules for filtering and 
address translation are:

1. packets coming in to the machine traverse the PREROUTING chain in the nat 
table.   Here you can do Destination NAT.

2. packets are now either destined for the local machine running netfilter, 
or some other system which it can route to.

3a. if the packet is destined for the local machine, it traverses the INPUT 
chain in the filter table and if that ACCEPTs it, it goes to the local 
service waiting to process the packet.

3b. if the packet is destined for some other machine, it traverses the 
FORWARD chain in the filter table, and if that ACCEPTs it, it goes on to the 
POSTROUTING chain in the nat table (where it might get Source NATted), and 
then goes out of the relevant interface.

4. packets which are generated on the local machine, by a client or a server 
running on the box, traverse the OUTPUT chain in the filter table, and then 
the POSTROUTING chain in the nat table.   Same situation as for routed 
packets in 3b above.

From the above you can see that packets *either* go through the INPUT / 
OUTPUT chains (if they are to / from the local machine) *or* they go through 
the FORWARD chain (if they are being routed by the box).   Packets no longer 
go through all three chains as they used to with IPchains.

All packets coming in go through the PREROUTING nat chain, and all packets 
going out go through the POSTROUTING nat chain.


Hope this helps,

.

Antony.

