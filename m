From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: how to harden iptables rules?
Date: Fri, 05 Mar 2010 01:00:50 +0100
Message-ID: <4B9049B2.4010000@plouf.fr.eu.org>
References: <20100303172001.149912au9jha5s8g@webmail.physik.uni-muenchen.de>	 <4B8E9F4A.9080706@plouf.fr.eu.org> <1267703243.22478.57.camel@etppc09.garching.physik.uni-muenchen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1267703243.22478.57.camel@etppc09.garching.physik.uni-muenchen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Christoph Anton Mitterer a =E9crit :
>=20
>>> -A INPUT	-m state  --state ESTABLISHED,RELATED	-j ACCEPT
>> Mostly agree, although I would drop some ICMP types such as redirect=
 or
>> source quench that may be harmful.
> Why would ICMP packets match this rule? Are they (well at least error=
s
> in response to some IP traffic) counted as RELATED?

Yes, "valid" ICMP error messages are RELATED (not ESTABLISHED as I
wrongly stated).

> But probably not things like echo-request, right? What should it rela=
te
> to?

ICMP echo requests are NEW, and "valid" (for conntrack) ICMP echo
requests are ESTABLISHED.

> Well,.. does it really? I've always thought no ICMP error messages wo=
uld
> be generated on errors with ICMP packets?

An ICMP error message must not be sent in reply to an ICMP error
message, but may be sent in reply to an ICMP message that is not an
error type, such as echo.

> btw: Now that I generally block ICMP (except echo-request and
> ESTABLISHED),... would I still need things like:
> net.ipv4.conf.all.accept_redirects =3D 0
> net.ipv6.conf.all.accept_redirects =3D 0

Yes, because valid ICMP redirect messages are RELATED.

> And does someone know whether the log_martians setting only affects
> whether martians are logged or also whether they're really discarded?

Martians are discarded anyway.

>>> 3) What I never clearly understood: Do I have to handle (drop) =20
>>> "external packets" with:
>>> -a source address of 127.x.x.x or :1
>>> -a destination address of 127.x.x.x or :1
>>> -a source address that matches one of the addresses of my other =20
>>> interfaces (e.g. 88.88.88.88 if that is the address of eth0)
>> This is not critical, because the IP stack already discards such pac=
kets.
> Great great,... and I again assumes that this happens "before" netfil=
ter
> comes in place?

This happens at the input routing decision between PREROUTING and INPUT
or FORWARD.

> Well but what I've understood from what you've wrote, this kind of st=
uff
> is discarded automatically by the kernel anyway,... so no need to tak=
e
> manual actions, right?

Well, you're never too sure...

> my interface has e.g. again the address 88.88.88.88
> someone sends packets with destination address 88.88.88.11 to that
> interface (which should be not handled by it)...

An interface should handle any local address, i.e. any address assigned
to itself or to any other interface of the system. Only packets with a
local destination go through the INPUT chains. Otherwise, it depend
whether forwarding is enabled or not : if yes, the packet is forwarded,
if not it is discarded at the input routing decision.

The question is : when a host has multiple interfarce, do you want to
allow packets on an interface but to the address of another interface ?
If yes (weak host model), just filter by interface. If no (strong host
model), filter by interface and by address.

> uhm.... Rethinking this scenario, I'd guess that packets with
> dest=3D88.88.88.11 would be considered as packets to be forwarded, ri=
ght?

Yes if this address is not local.

> So they should be either dropped because of my:
> :FORWARD DROP
> policy or my:
> net.ipv4.ip_forward=3D0
> right?

Right.
