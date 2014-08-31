From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Source NAT in  POSTROUTING chain for locally generated packets
Date: Sun, 31 Aug 2014 17:33:11 +0200
Message-ID: <54034037.8020304@plouf.fr.eu.org>
References: <1613016.CfItKYvQAW@nb003> <53FFA866.6020908@plouf.fr.eu.org> <1871539.DT9Mib6pZX@nb003>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1871539.DT9Mib6pZX@nb003>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: ms@sys4.de
Cc: netfilter@vger.kernel.org

Michael Schwartzkopff a =E9crit :
> Am Freitag, 29. August 2014, 00:08:38 schrieb Pascal Hambourg:
>>
>> Michael Schwartzkopff a =E9crit :
>>> For some special reasons I want to alter the IP address of outgoing
>>> packets
>>> that are generated locally to a secondary IP address on my machine.=
 For a
>>> test I use the udp/echo service. Without any rules a tcpdump looks =
like
>>> this:
>>>
>>> 192.168.56.101 is the primary address of the echo server and 192.16=
8.56.16
>>> is the secondary address of the interface.
>>>
>>> 08:24:04.063987 IP 192.168.56.1.48462 > 192.168.56.16.echo: UDP, le=
ngth 6
>>> 08:24:04.064522 IP 192.168.56.101.echo > 192.168.56.1.48462: UDP, l=
ength 6
>>>
>>> So I add the iptables rule:
>>>
>>> iptables -t nat -I POSTROUTING -p udp -s 192.168.56.101 --sport 7 \
>>>
>>>   -j SNAT --to-source 192.168.56.16
>>>
>>> now tcpdump shows that no answer packet is sent out any more:
>>>
>>> 08:24:16.851095 IP 192.168.56.1.55362 > 192.168.56.16.echo: UDP, le=
ngth 6
>>>
>>> With iptables -t nat -L POSTROUTING I can see that the rule is hit =
since
>>> the counter increases. Also a iptables TRACE shows me that the rule=
 is
>>> hit. No filter appears in the TRACE log.
>>>
>>> Any ideas where the packet vanished?
>>
>> Clash with an existing connection entry (the one created by the inco=
ming
>> packet) -> source port changed or packet dropped.
>=20
> SNAT indeed alters the source port that is why the client does not re=
cognizes=20
> the packet now. But I did not find any way not to alter the source po=
rt.

The situation is unclear. In your previous reply, you wrote :
>=20
> Since I so not filter on existing state, the packet should not be dro=
pped=20
> anyway.

The NAT table can drop the packet by itself when the clash with an
existing connection cannot be avoided (usually by changing the source
port automatically). Here, the existing connection is the one created b=
y
the incoming packet. However, the SNAT rule does not force the source
port, this should not happen.

>> What was the full tcpdump command used ?
>=20
> Yes. tcpdump should have captured the package.
>=20
>> Any filters ?
>=20
> No filters at all.

If you did not set any filters in tcpdump, it should indeed have
captured the outgoing packet. What have you changed ?

What is your real goal ?
My guess is that you want to SNAT the outgoing packet so that it looks
like the expected reply for the client. IMO this is the wrong way of
doing things. Instead you should consider using DNAT (or maybe REDIRECT=
)
on the original request packet to redirect it to the  primary address o=
f
the server, 192.168.56.101, so that the reply packet from that same
address is considered as part of the same connection and is
automatically de-NATed with the original address.

A better fix would be that the server sends the reply from the same
address as the one it received the request on. If the echo service is
part of inetd, that can be done in inetd.conf by specifying the local
address to use.

192.168.56.16:echo     dgram   udp     wait    root    internal
