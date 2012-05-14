From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: Problems with a forward rule
Date: Mon, 14 May 2012 17:12:39 -0400
Message-ID: <201205141712.39592.neal.p.murphy@alum.wpi.edu>
References: <CAEjQA5JVsMUizFWODGe+OT88owqbPU0=ZjtRugq6Eg8z1U3A=w@mail.gmail.com> <201205141355.03803.neal.p.murphy@alum.wpi.edu> <4FB15E74.5070102@gmail.com>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4FB15E74.5070102@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Monday 14 May 2012 15:35:16 carlopmart wrote:
> Sorry If you have misunderstood me, but I only want to allow that host
> to access to a specific LAN, not this LAN access to this host
> (http://marc.info/?l=netfilter&m=133697780513851&w=2) ...

Allow me to restate the rules in a slightly different format.

At least four rules are required if you wish to absolutely restrict a host to 
communicating with some other LAN. And these four rules must be the first 
rules in the FORWARD chain in order to be guaranteed to work regardless of 
other rules you may later add after them in the chain.

Definitions:
'the host': the host you wish to restrict.
'the LAN': the only LAN 'the host' is allowed to access. It is specified
    symbolically as you did not specic an address for it.
'conn': an established TCP/IP 'relation' between two hosts, whether it is
    using a connection-oriented protocol like TCP or SCTP or a
    connectionless protocol.
'NEW': the first packet of a new, not-yet-established conn.
'RELATED': the first packet of a new, not-yet-established conn that a
    helper module has determined is related to an existing conn between
    those two hosts.
'ESTABLISHED': a packet belonging to a conn that has seen traffic in both
    directions. Once established, there is no way to determine if a conn
    started out as NEW or RELATED (well, without resorting to CONNMARKs).

The first two and last two rules below together guarantee that 'the host' may 
communicate ONLY with nodes on 'the LAN', regardless of any rules you may add 
after. Do note that rules you add *before* these six rules may affect 'the 
host' if they are not written with great care.

--------------
# The first two rules explicitly allow traffic between 'the host' and
#   'the LAN'. You must explicitly allow packets travelling in each
#   direction. Once a packet is ACCEPTed, no further rules are processed.

# Allow 'the host' to access 'the LAN' using NEW and RELATED initial
#   packets and packets in ESTABLISHED conns
iptables -A FORWARD -s 172.24.50.3/32 -d a.b.c.d/netmask \
  -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT

# Allow nodes on 'the LAN' to access 'the host' using RELATED initial
#   packets and packets in ESTABLISHED conns
iptables -A FORWARD -s a.b.c.d/netmask -d 172.24.50.3/32 \
  -m state --state RELATED,ESTABLISHED -j ACCEPT


# The next two rules log traffic from 'the host' to anywhere else
#   and from anywhere else to 'the host'. Rule processing continues
#   after the packet has been LOGged.

# Log packets from 'the host' to anywhere else
iptables -A FORWARD -s 172.24.50.3/32 -j LOG \
  --log-prefix "FORWARD found packet from 172.24.50.3 to somewhere else: "
iptables -A FORWARD -d 172.24.50.3/32 -j LOG \
  --log-prefix "FORWARD found packet to 172.24.50.3 from somewhere else: "


# These last two rules explicitly drop traffic between 'the host' and
#   anywhere else. They preclude unintended consequences of new rules
#   you may add to the end of the chain in the future.
iptables -A FORWARD -s 172.24.50.3/32 -j DROP
iptables -A FORWARD -d 172.24.50.3/32 -j DROP
--------------

The first two rules allow traffic between 'the host' and 'the LAN' as you 
require. 'The host' may access any node on 'the LAN' at any time using any IP 
protocol. Nodes on 'the LAN' may send all return traffic and may open RELATED 
conns as detected by a netfilter helper module (such as FTP's DATA channel) 
but may not otherwise initiate unsolicited conns to 'the host'.

The second two rules are optional if you don't want to track attempts by 'the 
host' to access other nodes.

The last two rules are optional if you will never add more rules to the end of 
the chain because the chain's policy, DROP, will drop those packets. If you 
plan to add more rules to the end of the chain, I strongly suggest you use 
these last two rules to ensure that your added rules don't interfere.


Again, the two ACCEPT rules and the two DROP rules together guarantee that 
'the host' may communicate only with nodes on 'the LAN' even if you add more 
rules to the end of the chain. But remember that carelessly written rules you 
insert *before* these four rules can change the restrictions you've placed on 
'the host' and negate that guarantee.
