From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Possible IPTables bug in INPUT interface filtering?
Date: Tue, 20 Apr 2010 12:37:36 +0200
Message-ID: <4BCD83F0.8000906@plouf.fr.eu.org>
References: <p2l464fbb2d1004152012p719184c9g57ac7c7562994929@mail.gmail.com>	 <4BC880E0.3070100@plouf.fr.eu.org> <t2w464fbb2d1004191515hd4f9fe2cofe500bab85945682@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <t2w464fbb2d1004191515hd4f9fe2cofe500bab85945682@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

John Engelke a =E9crit :
>>
>>> So this box has two interfaces on the local subnet, eth0 and eth1.
>> Are both interfaces connected to the same subnet ? If so, I don't ca=
ll
>> this "multihomed".
>=20
> According to the link at http://en.wikipedia.org/wiki/Multihoming ,
> this setup can be described as "Multiple Interfaces, Single IP addres=
s
> per interface". So I'm actually trying to limit load on one interface
> using IPTables, which is a little different but nonetheless a variant
> on the concept.

You did not clearly answer my question : are both interfaces connected
to the same subnet ? Please detail your network setup.

>>> I would like to restrict VNC to only one of the interfaces, eth1. A=
t
>>> the start, VNC does not work. So I add this:
>>>
>>> -A INPUT -i eth1 -p tcp -m multiport --port 5900 -j ACCEPT
>>>
>>> Then, VNC starts working on eth0 AND eth1.
>> Are you sure ? How do you know ?
>=20
> Well I know because I added the line to the iptables rules file in
> /etc/sysconfig and restarted the service. It didn't work before I
> added the line and restarted. I tested both IPs before and after.

This is not proof. As I wrote, either IP address may be used on either
interface. Proof would be some packet capture or iptables log on eth0.

> So are you stating that without providing the IP address that you are
> able to filter solely on the interface name (i.e. -i eth0 or -i eth1)=
?

Yes, if I want to filter only on the interface. Again, when doing so an=
y
(non loopback) address assigned to any interface is reachable through
that interface, not only the specific address assigned to it.

>> If both interfaces are connected to the same subnet, by default your=
 box
>> accepts packets destined to any local non-loopback address on any
>> interface, including packets destined to the address assigned to eth=
1 on
>> eth0 and vice versa. This is because Linux enforces the "weak" host =
model.
>=20
> Okay, fine. But I don't see anything in either the man pages for
> IPTables nor in the examples linked from netfilter.org to indicate
> this. If the '-i' interface flag only works under certain conditions
> the documentation ought to state those conditions. I RTFM for this
> one.

I don't see why this needs to be indicated there. This is not related t=
o
netfilter or iptables.

> Bottom line is interface filtering doesn't really work when it
> requires IP/subnet parameters too. Bug or not it's unexpected
> behavior.

It is just unexpected to you because packets don't flow the way you
think. Packets for a given address may arrive on any interface.
Addresses and interfaces are mostly independent.
