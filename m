From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: accept rule not working.
Date: Wed, 7 May 2008 17:58:39 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0805071758300.30395@fbirervta.pbzchgretzou.qr>
References: <200805071514.m47FEhxC008001@indigo.cs.bgu.ac.il> <4821CAD7.5060208@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4821CAD7.5060208@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: =?UTF-8?Q?G=C3=A1sp=C3=A1r_Lajos?= <swifty@freemail.hu>
Cc: "eial@cs.bgu.ac.il" <eial@cs.bgu.ac.il>, netfilter@vger.kernel.org


On Wednesday 2008-05-07 17:29, G=C3=A1sp=C3=A1r Lajos wrote:
>>  =20
> No typo... maybe... :D
>
> Please include the output of these commands:
>
> iptables -vnL
> iptables -t nat -vnL
> iptables -t mangle -vnL
> iptables -t raw -vnL
>
> Thanx...

or for simplicity just `iptables-save` ...
