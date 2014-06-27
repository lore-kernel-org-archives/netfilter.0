From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: eth - NAT - Bridge - veth
Date: Fri, 27 Jun 2014 21:18:37 +0200
Message-ID: <53ADC38D.5090805@plouf.fr.eu.org>
References: <CALPbv1_LnTW-F+xagDb6MU4pOgarNH6BousUbXkuzKNixXZHbA@mail.gmail.com>	<53AD4B1F.1000705@plouf.fr.eu.org>	<CALPbv1-ur2xyv9MUe4UWR1ZeGZwaqgA40-J-8+H_vC58ie20bw@mail.gmail.com>	<53ADAF27.5070505@plouf.fr.eu.org> <CALPbv18b4ZnynXOUW59tu1aq2=uMi54M4ZUMUhacijCN1VVcbg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CALPbv18b4ZnynXOUW59tu1aq2=uMi54M4ZUMUhacijCN1VVcbg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Vijay Viswanathan <vijay.vishy@gmail.com>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

Vijay Viswanathan a =E9crit :
> I did that but still not working. the telnet [telnet 10.4.38.182 2300=
]
> command is stuck for a long time
>=20
> # iptables -t nat --list

Please use iptables-save instead. The output is much easier to read.

> # route

Can you provide the output of the same commands run in the container ?
Can the container connect to or ping some external host ?
