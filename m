From: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Synflood filtering and Conntrack
Date: Thu, 29 Jul 2010 19:14:15 +0200
Message-ID: <4C51B6E7.4010502@freemail.hu>
References: <4C4F5DCE.2060304@conversis.de> <4C4FBF16.50203@chello.at> <alpine.LSU.2.01.1007280756510.26636@obet.zrqbmnf.qr> <4C5161E2.8020407@chello.at> <alpine.LSU.2.01.1007291315440.2646@obet.zrqbmnf.qr> <4C516687.6060602@chello.at> <4C517559.2030702@plouf.fr.eu.org> <alpine.LSU.2.01.1007291448450.15281@obet.zrqbmnf.qr> <alpine.DEB.2.00.1007291723040.32027@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1007291723040.32027@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Jan Engelhardt <jengelh@medozas.de>, Pascal Hambourg <pascal.mail@plouf.fr.eu.org>, netfilter@vger.kernel.org, "Dennis J." <dennisml@conversis.de>, pablo@netfilter.org

2010-07-29 17:50 keltez=E9ssel, Jozsef Kadlecsik =EDrta:
> I don't see why it looks soo complicated: of course, a ct entry is=20
> created
> by conntrack whenever a new connection is detected. And of course the
> entry is destroyed if the packet, which triggered to create the new e=
ntry,
> is dropped by a rule. Why should the conntrack entry be kept, if the
> connection is not allowed by the rules?
>
>   =20
Correct me if I am wrong.

You can only destroy the entry (CONNECTION) if the PACKET which=20
"created" the entry is DROPped.
But you can NOT destroy the entry (just wait for timeout) if:
- the DROPped packet is not the first (SYN),
- there is no LOCAL reply,
- packets are FORWARDed.

I think that 99% of the conntrack entries are kept this way until timeo=
ut.

It it is true then there is no "standard" real help against a SYN flood=
=2E=20
(CHAOSTABLES?)


Swifty

