From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: About using -i with MASQUERADE
Date: Fri, 29 Jan 2016 22:25:13 +0100
Message-ID: <56ABD8B9.8060104@plouf.fr.eu.org>
References: <CAGpfsQ2qF0htCZQ3SmKR15Gs0huWBy=Es3c_5hh4QsRQ_CM3oQ@mail.gmail.com> <56AB3AAC.9060907@atc.tcs.com> <56AB4C4A.7020709@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <56AB4C4A.7020709@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: mart.frauenlob@chello.at
Cc: Vigneswaran R <vignesh@atc.tcs.com>, Fabio Pedretti <fabio.pedretti@unibs.it>, netfilter@vger.kernel.org

Mart Frauenlob a =E9crit :
> On 29.01.2016 11:10, Vigneswaran R wrote:
> [...]
>> In the FORWARDING chain, you can mark the packets based on incoming
>> Interface. Then use the mark to MASQUERADE the packets at the
>> POSTROUTING chain. eg.,
>>
>> -t nat -A FORWARD -i eth3 -j MARK --set-mark 0xffff
>> -t nat -A POSTROUTING -m mark --mark 0xffff  -j MASQUERADE
>=20
> there is no FORWARD chain in the nat table.

Indeed.

> And marking in the nat table=20
> will only mark packets of conntrack state NEW.

It doesn't matter. Anyway, MASQUERADE is in the nat table too and only
processes packets in the NEW state.
