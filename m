From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Can iptables/ip6tables start and work in parallel
Date: Fri, 15 Sep 2006 10:42:57 +0200
Message-ID: <450A6791.8040900@plouf.fr.eu.org>
References: <Pine.GSO.4.53.0609141945140.3688@compserv1>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.GSO.4.53.0609141945140.3688@compserv1>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Netfilter user list <netfilter@lists.netfilter.org>

Vidya Ravipati a =E9crit :
>=20
>> Yes, of course. iptables and ip6tables are mostly independent, as IPv4
>> and IPv6 are on any dual stack machine (with restrictions due to
>> IPv4-mapped addresses).
>>=20
> Can you mention what are the restrictions on the dual stack machine  wi=
th
> IPv4 mapped addresses

IPv4-mapped addresses are special IPv6 addresses used to represent IPv4=20
addresses. They have the prefix ::ffff:0:0/96, and the last 8 digits are=20
the hexadecimal representation of the IPv4 address. They also have a=20
special human-readable representation. For example the IPv4-mapped IPv6=20
address for 127.0.0.1 is "::ffff:7f00:1" or "::ffff:127.0.0.1".

On IPv4+IPv6 dual stack Linux hosts, by default, IPv6 sockets can also=20
be used for IPv4 communications. IPv4-mapped IPv6 addresses are used to=20
communicate with a remote IPv4 host using a local IPv6 socket. An IPv6=20
socket listening on :: (any local IPv6 address) can also accept IPv4=20
communications and will see the IPv4-mapped addresses (beware with ACL).=20
These communications use IPv4-mapped IPv6 addresses at the IPv6 socket=20
level and real IPv4 addresses at network level, so the real network=20
traffic is IPv4 and only iptables will see it, not ip6tables.

Other operating systems may have different default behaviours. On Linux,=20
the default behaviour can be changed with the kernel parameter=20
(/proc/sys/)net/ipv6/bindv6only. When set to 1, new IPv6 sockets are be=20
limited to "pure" IPv6 communications and cannot use IPv4-mapped=20
addresses, so IPv4 and IPv6 are completely independent.

I think you should find a lot of more detailed documentation on the web,=20
but I don't have any pointer right now.

