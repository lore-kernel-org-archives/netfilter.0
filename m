From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Loopback security...
Date: Wed, 23 Apr 2008 12:51:47 +0200
Message-ID: <480F14C3.3010403@plouf.fr.eu.org>
References: <480D47F6.9080808@riverviewtech.net> <480DC570.80303@solutti.com.br> <480DF156.5060801@riverviewtech.net> <480E0CA2.2030902@plouf.fr.eu.org> <480E3FE9.8070008@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <480E3FE9.8070008@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Grant Taylor a =E9crit :
> On 04/22/08 11:04, Pascal Hambourg wrote:
>=20
>> There is no such traffic forwarded between the loopback interface an=
d=20
>> another interface, because it just makes no sense. The loopback is=20
>> designed for local host communications : all that is sent through it=
=20
>> is received back by the host, and all that is received through it wa=
s=20
>> sent by the host.
>=20
> Under normal circumstances I would agree with you completely.  Howeve=
r=20
> there are (and have been) cases where there is a need to have other=20
> systems communicate with a given systems loopback interface.  More=20
> specifically (and closer to what prompted this discussion) is if I ha=
ve=20
> a system that had in the past a service bound to loopback that is no =
no=20
> longer there that I would like to redirect this traffic out to a=20
> different system.  Thus traditionally I could DNAT traffic in the OUT=
PUT=20
> chain to the new address.  This way I would not need to re-configure=20
> software or deal with software that can not be re-configured.  In thi=
s=20
> case I want what starts as local traffic to be redirected OUT OF the=20
> loopback ""network and for replies to come back in to it.

Ah, I see what this is all about. The problem is not the loopback=20
interface, it is the loopback address range 127.0.0.0/8. Some RFC state=
s=20
that "127.0.0.0/8 must not be used outside a host", so the routing code=
=20
in the Linux kernel discards packets with a source or destination=20
address in this range which are sent or received through a non loopback=
=20
interface.

When you send a packet to a local address, the default source address=20
selected by the stack is the same as the destination address. In older=20
kernels (before 2.6.11), the DNAT target in the OUTPUT chain used to=20
change the source address to match the new output interface. But newer=20
kernels don't do this any more. So if the original destination address=20
is within 127.0.0.0/8 and the new destination address is not local, the=
=20
packet is discarded because it is to be routed through a non loopback=20
interface with a source address within 127.0.0.0/8.

>> Of course not. Why would it ? The destination is local (see 'ip rout=
e=20
>> show table local'), and is treated just as any other local destinati=
on=20
>> like 10.0.0.1. Traffic is forwarded only when the destination is rem=
ote.
>=20
> If this was a second ethernet interface verses the loopback interface=
,=20
> the answer would be "of course it would".

Because things would be different. The routing table would be different=
=2E=20
A subnet assigned to the loopback interface is marked "local". A subnet=
=20
assigned to an ethernet interface is not. I repeat, there is no point i=
n=20
forwarding traffic destined to a local destination.

> Let me try explaining this again.
>=20
> A
>   lo: 127.0.0.1/8 and 192.0.2.1/24
> eth0: 10.0.0.1/24
> Destination   Gateway     Genmask
> 10.0.0.0      0.0.0.0     255.255.255.0
> 127.0.0.0     127.0.0.1   255.0.0.0
> 192.0.2.0     0.0.0.0     255.255.255.0
> 0.0.0.0       10.0.0.X    0.0.0.0
>=20
> B
>   lo: 127.0.0.1/8
> eth0: 10.0.0.254/24
> Destination   Gateway     Genmask
> 10.0.0.0      0.0.0.0     255.255.255.0
> 127.0.0.0     127.0.0.1   255.0.0.0
> 192.0.2.0     10.0.0.1    255.255.255.0
> 0.0.0.0       10.0.0.X    0.0.0.0
>=20
> In this case, B should route any traffic that is to 192.0.2.0/24 over=
 to=20
> A.  A would then receive this traffic and forward it to the loopback=20
> interface.
>=20
> If you are hanging up on my use of the word "forward" for traffic tha=
t=20
> comes in one interface destined to an address bound to a different=20
> interface then please do not, or change the word.

Your use of "forward" is improper. What you describe is just local=20
delivery. A packet is forwarded when it arrives at an interface, goes=20
through the FORWARD chains and goes *out* through an interface. A packe=
t=20
sent to a local address does not follow this path, even though the=20
destination address bound to an interface other than the one which=20
received the packet. It goes through the INPUT chains for local=20
delivery. The interface to which the destination address is bound is no=
t=20
involved.

> If you would prefer, substitute the word "route" for the word "forwar=
d".

Neither. "Route to an interface" would also mean that the traffic goes=20
out that interface.

> Yes this is (usually) common sense.  However my question was "Is it=20
> possible to change this behavior...", which still stands.

What behaviour ? Discarding traffic to or from 127.0.0.0./8 on a non=20
loopback interface ? I guess there have been some patches.
