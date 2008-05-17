From: Alexei Ustyuzhaninov <alust@alust.homeunix.com>
Subject: Re: fwmark iptables/ip routing interaction question
Date: Sat, 17 May 2008 09:53:37 +0600
Message-ID: <482E56C1.2070508@alust.homeunix.com>
References: <49159.212.190.198.36.1210171014.squirrel@webserver6.intec.ugent.be> <alpine.LNX.1.10.0805071703150.30395@fbirervta.pbzchgretzou.qr> <48271D8B.5030608@alust.homeunix.com> <alpine.LNX.1.10.0805111938210.19952@fbirervta.pbzchgretzou.qr> <482731F8.9030806@alust.homeunix.com> <482DA25D.70703@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <482DA25D.70703@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

Pascal Hambourg wrote:
> Hello,
>=20
> Alexei Ustyuzhaninov a =E9crit :
>>>
>>>> I have a weird with the same scenario: after rerouting a packet go=
es
>>>> out through another interface but keeps the source address of the=20
>>>> original interface.
>>>
>>> Yes that is ... how the code is currently written it seems.
>=20
> The source address is chosen before the packet is sent to the OUTPUT=20
> chains, and cannot be changed by the rerouting code, this would break=
=20
> things such as connection tracking. It requires stateful NAT so the=20
> correct original address is put back in replies. By the way, DNAT in =
the=20
> OUTPUT chain used to implicitly change the source address when the ne=
w=20
> destination address caused the output interface to change until kerne=
l=20
> 2.6.11.

Hm. That's not clear to me as I don't know the destination address in=20
advance (and don't want to change it). Anyhow this solution is obsolete=
=20
as I see.

>> Well, maybe you can suggest how to work around this? :) I tried snat=
,=20
>> but this solution seems not to work.
>=20
> SNAT should work on packets creating a new connection (i.e. in the st=
ate=20
> NEW).

Yes, really! The SYN packet goes out through the right interface with=20
the right source address, SYN/ACK comes back and that's all, nothing=20
will happen more.

Anyhow  isn't this problem unresolvable in general? I just want a simpl=
e=20
thing: to send mail via one provider and all other traffic via the othe=
r=20
provider,

--=20
Thanks,
Alexei
