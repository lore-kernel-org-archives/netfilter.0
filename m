From: Stephen Satchell <list@satchell.net>
Subject: nft -- documentation on fib_addrtype missing
Date: Thu, 10 Oct 2019 12:41:28 -0700
Message-ID: <37a942dc-dff2-d087-3455-78565e290050@satchell.net>
Reply-To: list@satchell.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

I'm just getting started with NFTABLES work in preparation for
upgrading to CentOS 8.  In trying to understand how I can
migrate my existing IPTABLES configuration, I ran into a
roadblock: what are the acceptable values for "fib_addrtype",
and what do they mean.  So I started poking around to see what
I could find for myself.

My follow-on project is to describe how to implement the
recommendations in BCP-38 using IP-ROUTE and NFTABLES.

Does my research glean accurate information?  If so, can
that information be added to the wiki and to
Git/nftables/doc/primary-expression.txt just before
"Using fib expressions"?

nftables v0.8 (Joe Btfsplk), CentOS Linux release 7.7.1908 (Core)
(Checked against v0.9.2 in the Git nftables repository)

---From man 8 nft:
FIB EXPRESSIONS
    fib {saddr | daddr | [mark | iif | oif]} {oif | oifname |
       type}

    A fib expression queries the  fib  (forwarding  information
    base)  to  obtain  information such as the output interface
    index a particular address would use. The input is a  tuple
    of  elements  that is used as input to the fib lookup func‐
    tions.

    fib expression specific types

    +---------+--------------------+------------------+
    |Keyword  | Description        | Type             |
    +---------+--------------------+------------------+
    |oif      | Output interface   | integer (32 bit) |
    |         | index              |                  |
    +---------+--------------------+------------------+
    |oifname  | Output interface   | string           |
    |         | name               |                  |
    +---------+--------------------+------------------+
    |type     | Address type       | fib_addrtype     |
    +---------+--------------------+------------------+

NOTE:  The type "fib_addrtype" is not defined in any documentation
I can find.  A search for "fib_addrtype" turned up the source file
from which I extracted what appears to be a table of acceptable
symbols, shown next.  I then went hunting around to find the exact
meaning of each of the associated route types, which I include.

I believe some of this information should be added to the nft(8)
man page in some form, for completeness.  I question the utility
of throw and nat discussions. I'm also concerned about the tag
"not implemented" in the discussion of anycast.



---From src/fib.c:
SYMBOL("unspec",        RTN_UNSPEC),
SYMBOL("unicast",       RTN_UNICAST),
SYMBOL("local",         RTN_LOCAL),
SYMBOL("broadcast",     RTN_BROADCAST),
SYMBOL("anycast",       RTN_ANYCAST),
SYMBOL("multicast",     RTN_MULTICAST),
SYMBOL("blackhole",     RTN_BLACKHOLE),
SYMBOL("unreachable",   RTN_UNREACHABLE),
SYMBOL("prohibit",      RTN_PROHIBIT),



---From man 8 iptables-extensions:
UNSPEC      unspecified address (i.e. 0.0.0.0)
UNICAST     unicast address
LOCAL       local address
BROADCAST   broadcast address
ANYCAST     anycast packet (address?)
MULTICAST   multicast address
BLACKHOLE   blackhole address
UNREACHABLE unreachable address
PROHIBIT    prohibited address



---From man 8 ip-route:
Route types:

       unicast - the route entry describes real paths to
       the destinations covered by the route prefix.

       unreachable - these destinations are unreachable.
       Packets are discarded and the ICMP message host
       unreachable is generated.  The local senders get an
       EHOSTUNREACH error.

       blackhole - these destinations are unreachable.
       Packets are discarded silently.  The local senders
       get an EINVAL error.

       prohibit - these destinations are unreachable.
       Packets are discarded and the ICMP message communi‐
       cation administratively prohibited is generated.
       The local senders get an EACCES error.

       local - the destinations are assigned to this host.
       The packets are looped back and delivered locally.

       broadcast - the destinations are broadcast
       addresses. The packets are sent as link broadcasts.

       throw - a special control route used together with
       policy rules. If such a route is selected, lookup
       in this table is terminated pretending that no
       route was found. Without policy routing it is
       equivalent to the absence of the route in the rout‐
       ing table. The packets are dropped and the ICMP
       message net unreachable is generated. The local
       senders get an ENETUNREACH error.

       nat - a special NAT route. Destinations covered by
       the prefix are considered to be dummy (or external)
       addresses which require translation to real (or
       internal) ones before forwarding. The addresses to
       translate to are selected with the attribute via.
       Warning: Route NAT is no longer supported in Linux
       2.6.

       anycast - (not implemented) the destinations are any‐
       cast addresses assigned to this host. They are
       mainly equivalent to local with one difference:
       such addresses are invalid when used as the source
       address of any packet.

       multicast - a special type used for multicast rout‐
       ing. It is not present in normal routing tables.
