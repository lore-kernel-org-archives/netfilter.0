From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: fwmark iptables/ip routing interaction question
Date: Fri, 16 May 2008 17:03:57 +0200
Message-ID: <482DA25D.70703@plouf.fr.eu.org>
References: <49159.212.190.198.36.1210171014.squirrel@webserver6.intec.ugent.be> <alpine.LNX.1.10.0805071703150.30395@fbirervta.pbzchgretzou.qr> <48271D8B.5030608@alust.homeunix.com> <alpine.LNX.1.10.0805111938210.19952@fbirervta.pbzchgretzou.qr> <482731F8.9030806@alust.homeunix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <482731F8.9030806@alust.homeunix.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Alexei Ustyuzhaninov a =E9crit :
>>
>>> I have a weird with the same scenario: after rerouting a packet goe=
s
>>> out through another interface but keeps the source address of the=20
>>> original interface.
>>
>> Yes that is ... how the code is currently written it seems.

The source address is chosen before the packet is sent to the OUTPUT=20
chains, and cannot be changed by the rerouting code, this would break=20
things such as connection tracking. It requires stateful NAT so the=20
correct original address is put back in replies. By the way, DNAT in th=
e=20
OUTPUT chain used to implicitly change the source address when the new=20
destination address caused the output interface to change until kernel=20
2.6.11.

> Well, maybe you can suggest how to work around this? :) I tried snat,=
=20
> but this solution seems not to work.

SNAT should work on packets creating a new connection (i.e. in the stat=
e=20
NEW).
