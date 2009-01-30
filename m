From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Subject: Re: icmp forward
Date: Fri, 30 Jan 2009 12:36:06 +0100
Message-ID: <4982E626.80800@cetrtapot.si>
References: <4982B7F3.4020603@cetrtapot.si> <4982C662.7030807@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4982C662.7030807@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mart Frauenlob <mart.frauenlob@chello.at>
Cc: netfilter@vger.kernel.org

Mart Frauenlob wrote:
> Hinko Kocevar wrote:
>> Our customers want to be able to ping the mobile device behind the
>> linux firewall
>> and IMHO it is not possible for ICMP packets to be forwarded since i=
t
>> is a protocol
>> by itself (not a TCP/UDP style service).
>>
>>  =20
>=20
> *clearing my throat*
> TCP and UDP are protocols no services! many services use TCP/UDP prot=
ocol!
> TCP and UDP are very different, UDP is a connectionless protocol, in
> opposite to TCP.
>=20
> So ICMP is more like UDP, than like TCP.

Right.

>> Is it possible to 'port forward' ICMP requests?
>>  =20
>=20
> First try, then cry ;-p
>=20
> If u have an unused ip addr. on your gw, you could use that one to na=
t
> the icmp, so your gateway still is reachable with icmp.
>=20


Hmm that seems like a viable solution - totally forgot about the networ=
k
interface aliasing 8).

Thanks!

--=20
Hinko Ko=E8evar, OSS developer
=C8ETRTA POT, d.o.o.
Planina 3, 4000 Kranj, SI EU
tel     ++386 (0) 4 280 66 03
e-mail  hinko.kocevar@cetrtapot.si
http    www.cetrtapot.si

