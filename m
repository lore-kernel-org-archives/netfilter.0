From: "Joe Patterson" <jpatterson@asgardgroup.com>
Subject: RE: sendto: Operation not permitted
Date: Thu, 30 May 2002 21:01:32 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <NJEFLNJDIFFNMHDEBKMJGEDLDOAA.jpatterson@asgardgroup.com>
References: <20020531005832.K27307@funkyjesus.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020531005832.K27307@funkyjesus.org>
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
To: Nick Drage <nickd@funkyjesus.org>, netfilter@lists.samba.org

kind of the same way that a system determines what an ICMP message relates
to.  For example, the format of an ICMP unreachable message, which includes
such messages as the fragmentation needed and all the network/host/port
unreachables, is:

(8 bits of type{which is value 3 for unreachables})
(8 bits of code {0-15, depending on what kind of unreachable it is})
(16 bits of checksum)
(32 bits of zeros)
(ip header, options, and first 8 bytes of original ip datagram)

or for TTL exceeded (most often used for traceroute, otherwise used for
detecting routing loops):

(8 bits of type{which is value 11 for ttl exceeded})
(8 bits of code {0 or 1, depending on if it was during transmit or
reassembly})
(16 bits of checksum)
(32 bits of zeros)
(ip header, options, and first 8 bytes of original ip datagram)

That last part can be reconstructed to determine what flow caused this
message to be generated.  The IP header will contain the original source and
destination address and the protocol of the packet that caused the icmp
packet to be generated.  For udp, the first 8 bytes of the datagram will
contain the sport, dport, length, and checksum.  For tcp, it will contain
the sport, dport, and sequence number.  For icmp it will contain the type,
code, checksum, and another 4 bytes that are type/code dependant.  Since a
connection with respect to iptables is defined by a
(proto-saddr/sport-daddr/dport) construct, then the information in an icmp
packet is sufficient to match it to a connection description.  The above two
are, I believe, the only icmp messages that should be RELATED to a tcp or
udp connection (or, for that matter, an ICMP "connection".  If I send an
icmp echo request that goes through a router with no route to the
destination network, it should send back an icmp network unreachable from
its own ip address, which would be RELATED to the original icmp echo
request).  Other icmp messages are generally either NEW (i.e., echo
requests) or, I believe, ESTABLISHED (i.e., echo replies to said echo
requests.)  For example, a line from my /proc/net/ip_conntrack shows:

icmp     1 29 src=a.b.c.d dst=207.46.197.102 type=8 code=0 id=1280
[UNREPLIED] src=207.46.197.102 dst=e.f.g.h type=0 code=0 id=1280 use=1

This shows that I'm nat'ing a.b.c.d to e.f.g.h, and have sent a packet of
type=8, code=0, (icmp echo request) with id=1280 to 207.46.197.102, and am
expecting back a packet of type=0, code=0 (icmp echo reply) with id=1280
from that same host.

Excellent documentation on all of this is in "TCP/IP Illustrated, Volume 1:
The Protocols" by W. Richard Stevens.  If you really want to know everything
about IP and don't care that your brain might explode, read it cover to
cover.  :)

-Joe

> -----Original Message-----
> From: netfilter-admin@lists.samba.org
> [mailto:netfilter-admin@lists.samba.org]On Behalf Of Nick Drage
> Sent: Thursday, May 30, 2002 7:59 PM
> To: netfilter@lists.samba.org
> Subject: Re: sendto: Operation not permitted
>
>
> On Thu, May 30, 2002 at 08:55:17PM +0100, Antony Stone wrote:
> > On Thursday 30 May 2002 3:13 pm, alex@pilosoft.com wrote:
>
> > > > This type of ICMP message will be RELATED to an existing TCP
> > > > connection, therefore it will be allowed through the firewall by the
> > > > sort of rulset Claudio was using - if you recall, this was:
> > >
> > > Ah, I didn't know iptables are smart enough to realize that!
> >
> > Yes, this is one of the beautiful things about netfilter /
> iptables - ICMP
> > packets are automatically recognised as being RELATED to the
> TCP packets
> > which they're, well, related to.
>
> How does netfilter determine if the ICMP packet is RELATED to anything in
> the state table?  Anyone suggest documentation that details this?
>
> --
> FunkyJesus System Administration Team
>
>
>
>


