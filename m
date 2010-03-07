From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: How does netfilter decide which in/out-interface a packet has
Date: Sun, 07 Mar 2010 13:45:22 +0100
Message-ID: <4B939FE2.1030208@plouf.fr.eu.org>
References: <20100303165422.18973x8p8ccy6s84@webmail.physik.uni-muenchen.de>	 <4B8E97BA.9070103@plouf.fr.eu.org>	 <1267698530.22478.27.camel@etppc09.garching.physik.uni-muenchen.de>	 <4B903B4F.2030708@plouf.fr.eu.org> <1267931666.9967.6.camel@fermat.scientia.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1267931666.9967.6.camel@fermat.scientia.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Christoph Anton Mitterer a =E9crit :
>=20
> Before you've said:
>>> How does netfilter decide which in/out-interface a packet has?
>> It doesn't. The packet decides which input interface is arrives on, =
and
>> the routing decision decides which output interface it leaves.
>=20
> So what exactly does it mean?
> a) If the packet physically arrives on e.g. eth0 ("by wire") it's
> interface is counted as eth0, regardless of what its destination-addr=
ess
> says?

Short answer : yes.

Longer answer : more than the physical interface, it is the "logical"
interface that matters. Such logical interfaces types include bridge
(br0), bonding (bond0), VLAN (eth0.1), tunnel (tun0, tap0), PPP (ppp0).=
=2E.

Note that IP aliases such as eth0:1 are just labels and not interfaces,
neither physical nor logical. They have no existence for the stack and
netfilter.

> b) If it appears on any interface (e.g. eth0 or eth1) its interface i=
s
> counted as that one that matches the destination address on the
> packet,... even if it appears physically on eth0 but if it still hast
> the destination address of eth1

No, the address does not matter. In the weak host model, local addresse=
s
are considered to be assigned to the host as a whole, not to their
specific interfaces.

> On Thu, 2010-03-04 at 23:59 +0100, Pascal Hambourg wrote:
>> Christoph Anton Mitterer a =E9crit :
>>> So the kernel basically sees when packets do not leave the box but =
are
>>> just "internal traffic" and uses lo for this?
>>> I assume this also applies for byte counters like RX/TX packets and
>>> they're accounted on lo?
>> Yes and yes.
> Do you perhaps know where I can see this in the code?

No, I am just a user, not a developper.

> And is this also the case for v6?

Of course. Why would it be any different ?

>>>>> "incoming traffic (from remote):
>>>>> 99.99.99.99 --> 127.x.x.x     =3D> is that possible at all? how w=
ould =20
>>>>> the in=3D/out=3D be?
>>>> eth0, but the packet is discarded after PREROUTING by the input ro=
uting
>>>> decision which prohibits receiving a packet with a loopback addres=
s from
>>>> outside (a non loopback interface).
>>> Ah great,... so I don't have to manually drop such stuff... right?
>>> Are such packets dropped (like DROP) or are the rejected with error
>>> codes?
>> They are silently discarded, like DROP. Some of these packets are lo=
gged
>> when sysctl net.ipv4.conf.*.log_martians is enabled. Otherwise you c=
an
>> log (and drop) them with iptables.
> a) Uhmm... wait... you say "otherwise" does this mean if log_martians=
 is
> disabled they are neither logged NOR discarded?

No, they are discarded but not logged. I meant that if a type of packet
is not considered "martian" by the kernel, you can still log and/or dro=
p
it with iptables.

> b) What is all regarded as "martians" here,.. there are different
> definitions on the web...

Yes, and I don't know for sure what it exactly means. The kernel
documentation just says "impossible addresses".
