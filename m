From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Synflood filtering and Conntrack
Date: Fri, 30 Jul 2010 01:19:56 +0200
Message-ID: <4C520C9C.7090909@plouf.fr.eu.org>
References: <4C4F5DCE.2060304@conversis.de> <4C4FBF16.50203@chello.at> <alpine.LSU.2.01.1007280756510.26636@obet.zrqbmnf.qr> <4C5161E2.8020407@chello.at> <alpine.LSU.2.01.1007291315440.2646@obet.zrqbmnf.qr> <4C516687.6060602@chello.at> <4C517559.2030702@plouf.fr.eu.org> <alpine.LSU.2.01.1007291448450.15281@obet.zrqbmnf.qr> <alpine.DEB.2.00.1007291723040.32027@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1007291723040.32027@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Jan Engelhardt <jengelh@medozas.de>, netfilter@vger.kernel.org, "Dennis J." <dennisml@conversis.de>, pablo@netfilter.org

Jozsef Kadlecsik a =E9crit :
>=20
> I don't see why it looks soo complicated: of course, a ct entry is cr=
eated=20
> by conntrack whenever a new connection is detected. And of course the=
=20
> entry is destroyed if the packet, which triggered to create the new e=
ntry,
> is dropped by a rule. Why should the conntrack entry be kept, if the=20
> connection is not allowed by the rules?
>=20
> The new ct entries are kept in the unconfirmed list and only added to=
 the=20
> conntrack hash iff the entry will be confirmed, that is the entry-cre=
ating=20
> packet won't be dropped by a rule.

Thanks for this explanation. Just one more clarification, please : is
the conntrack entry destroyed also if the packet which triggered its
creation is dropped by something else than an iptables rule, such as
routing decision, TTL exceeded, conflict with an existing NAT mapping ?


