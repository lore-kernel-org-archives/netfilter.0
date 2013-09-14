From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Wrong routing when combining ip rule with SNAT
Date: Sat, 14 Sep 2013 19:17:22 +0200
Message-ID: <52349A22.9060307@plouf.fr.eu.org>
References: <8761u59uit.fsf@vostro.rath.org> <5232B01B.2030007@atc.tcs.com> <5234678F.6010401@plouf.fr.eu.org> <52348363.6080804@rath.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <52348363.6080804@rath.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Nikolaus Rath a =E9crit :
>=20
> I see. Out of curiosity: how is the source address selected when the
> packet is created, and in which situation would the source entry in t=
he
> routing table become effective?

The source address selection process is quite complicated and I'm not
sure I know all the details. As far as I know, the selected source
address is, in decreasing order of priority :
- the source address specified by the sending process/socket
- the source address specified in the routing table entry used for the
destination
- the address of the output interface matching the destination prefix o=
f
the routing table entry
- the address of the output interface
- any other suitable address of any other interface (i.e. not a loopbac=
k
address if the destination is not local)

>> Possible workarounds :
>> - Add a route on ebox to let it know that 192.168.17.47 is reachable
>> through rath. My favourite choice.
>=20
> Yes, that would be the simplest solution. But the problem is that thi=
s
> address varies depending how and where vostro got its connectivity. O=
r
> did you mean something other than a static extra route?

I mean any means to create that route. May be dynamic, using a routing
protocol. However if ath is a tunnel using the other address for
encapsulation, this workaround may not be applicable easily
(encapsulated packets must still be routed normally).

>> - Use SNAT to the address of the output interface on vostro.
>=20
> Sounds ugly...

Yes. But simple to setup and effective.

>> - Use connection mark (connmark) by iptables on ebox so that replies=
 to
>> original packets received on a given interface are forwarded to the =
same
>> interface.
>=20
> I guess I'll try this. Could you give some more details? I'm not sure
> how to create a rule that *changes* the outgoing interface.

It's not very different from marking packets for advanced routing.
I haven't done that recently, but here is a basic overview :

# mark the connections of packets received on rath
iptables -t mangle -A PREROUTING -i rath -j CONNMARK --set-mark 1

# copy the connection mark to the packets received on eth0
iptables -t mangle -A PREROUTING -i eth0 -j CONNMARK --restore-mark

# use the mark to route packets received on eth0
ip rule add fwmark 1 dev eth0 table tovpn
