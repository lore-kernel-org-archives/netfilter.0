From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Problem with DNAT of UDP packets getting undone
Date: Tue, 06 Nov 2007 21:24:15 +0100
Message-ID: <4730CD6F.7040400@plouf.fr.eu.org>
References: <54395395F049BD4E8C97CC924B45A7A6062E227D@brexc47p> <32559.217.166.60.19.1194368615.squirrel@ma.rtij.nl> <4730B87B.10901@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4730B87B.10901@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Hello,

Grant Taylor a =E9crit :
> On 11/06/07 11:03, Martijn Lievaart wrote:
>=20
>> This is expected. A nat mapping is set up on the first packet of a=20
>> "connection" and a reverse NAT is done automagically on all return=20
>> packets. Exactly what you are seeing.
>=20
> I'll agree to the NATing part.

So do I. Otherwise, stateful NAT would not work very well.

> However the fact that the OP is=20
> successfully using the loopback interface surprises me.  It was my=20
> (mis)understanding that the loopback interface was holly and would no=
t=20
> talk to traffic that did not originate or terminate on the loopback=20
> interface as well.

You may confuse with the restriction from some RFCs stating that=20
127.0.0.0/8 addresses are reserved for internal host use, i.e. the=20
loopback interface. There is no such restriction for other addresses=20
that may be configured on the loopback interface. Also, the Linux IP=20
stack follows the "weak" model by default, so any unicast address=20
(except 127.0.0.0/8) configured on any interface  can be used for=20
communications on any other interface. So any non-127.0.0.0/8 address=20
configured on the loopback interface can be used for communications on=20
any other interface.

> Or is the a side effect that the NATing code is=20
> sending the traffic out the loopback interface destined to the loopba=
ck=20
> interface as well, thus NATing is bridging the security barrier?  I a=
m=20
> almost positive that the same could not be done with routing.

Nope, NAT has nothing to do with this, and the loopback interface is no=
t=20
involved.

>> This cannot easily be solved with current Linux kernels. Current=20
>> kernels only do connection oriented NAT. You could insert a Cisco=20
>> device or something similar to do the kind of NAT you require.
>=20
> Would it be possible to use stateless NATing via IP Route 2 rather th=
an=20
> IPTables to achieve this?

The old stateless NAT in the routing code controlled with iproute2 is=20
considered broken and all references to it were removed from kernel=20
2.6.9. But a new stateless NAT is coming with the next kernel release=20
2.6.24.

=46or now, an ugly workaround may be to use the NOTRACK target in the=20
'raw' table on the (supposedly) return packets, to skip the connection=20
tracking and the automagic reverse DNAT. I think this will work for DNS=
=20
over UDP, maybe not so well for TCP.
