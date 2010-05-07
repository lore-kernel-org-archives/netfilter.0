From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: conntrack-tools 0.9.14 can not block the connection
Date: Fri, 07 May 2010 22:13:49 +0200
Message-ID: <4BE4747D.9010705@plouf.fr.eu.org>
References: <201005061651.40203.rfeng@wurldtech.com> <alpine.LSU.2.01.1005070954230.32277@obet.zrqbmnf.qr> <201005070917.27301.rfeng@wurldtech.com> <alpine.LSU.2.01.1005071823100.23210@obet.zrqbmnf.qr> <4BE46649.1040703@netfilter.org> <4BE4669B.4030904@netfilter.org> <alpine.LSU.2.01.1005072144530.31492@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.01.1005072144530.31492@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Richard Feng <rfeng@wurldtech.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Jan Engelhardt a =E9crit :
> On Friday 2010-05-07 21:14, Pablo Neira Ayuso wrote:
>>>> The documentation seems to be off here. If you only delete a ct
>>>> entry, the next packet (even if a TCP ACK or something) will make
>>>> a new ct with NEW as a ctstate.
>>>>
>>>> To really have a TCP/SCTP connection blocked after deletion of the=
 ct=20
>>>> entry, you have to only allow NEW ctstates with the initla TCP/SCT=
P=20
>>>> packet (SYN/INIT).

Jan made an interesting point. TCP conntrack has a liberal/strict
sysctl, but I do not see any for SCTP conntrack. If I'm not mistaken, i=
s
SCTP conntrack of the liberal or strict kind ?

>>> Yes, you need a well-formed stateful rule-set "to cut" the connecti=
on
>>> (at least you have to add a rule to block traffic in INVALID stats)=
=2E
>> With "stats" I meant "state", and liberal tracking must be disabled =
as said.
>=20
> Which is the default anyway. :-)
>=20
> I think what was really meant was tcp_loose, not tcp_be_liberal.

In my understanding, tcp_loose only allows conntrack to pick up
connections from the middle, but packets are still INVALID until the
required number of packets is seen and accepted. Am I wrong ?
