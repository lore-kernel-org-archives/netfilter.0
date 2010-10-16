From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Port forwarding problem
Date: Sat, 16 Oct 2010 15:37:54 +0200
Message-ID: <4CB9AAB2.8070803@plouf.fr.eu.org>
References: <4CB9A03C.7020700@uninorte.edu.co> <4CB9A4FE.1050905@plouf.fr.eu.org> <4CB9A669.7020008@uninorte.edu.co>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CB9A669.7020008@uninorte.edu.co>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Carlos Mtz-Troncoso a =E9crit :
> Thanks Pascal for your answer.
>=20
> I had that rule but I deleted, I just add again
>=20
> iptables -A FORWARD -p tcp -i eth0 -d 10.1.1.7 --dport 80 -j ACCEPT
>=20
> but it doesn't work.

Maybe because of the rule ordering ? Your script weirdly mixes -I and -=
A
commands, and has a "-I FORWARD -j DROP" rule which inserts a plain
"DROP everything" at the very beginning of the chain. As a result, any
rule created before or appended after this one has no effect.
