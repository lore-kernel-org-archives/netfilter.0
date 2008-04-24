From: Alexei Ustyuzhaninov <alust@alust.homeunix.com>
Subject: Re: IPTables : How to force data coming from ethX being output by
 the same device
Date: Thu, 24 Apr 2008 10:38:01 +0600
Message-ID: <48100EA9.2050001@alust.homeunix.com>
References: <c4ecb9830804230703q3f3cc02doc03c34a293d6014c@mail.gmail.com> <480F49BE.60600@solutti.com.br> <alpine.LNX.1.10.0804231641310.13697@fbirervta.pbzchgretzou.qr> <480F4CD9.4020006@solutti.com.br> <alpine.LNX.1.10.0804231717190.13697@fbirervta.pbzchgretzou.qr> <480F57D8.1060704@solutti.com.br> <480F64E0.50209@208.195-224-87.telenet.ru> <480F727C.20608@solutti.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <480F727C.20608@solutti.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?UTF-8?B?TGVvbmFyZG8gUm9kcmlndWVzIE1hZ2FsaMOjZXM=?= <leolistas@solutti.com.br>
Cc: ML netfilter <netfilter@vger.kernel.org>

Leonardo Rodrigues Magalh=C3=A3es wrote:
>=20
>=20
> Alexei Ustyuzhaninov escreveu:
>>
>> I don't think any routing may be done without iptables. A simple=20
>> example: you have two internet connections and want to route all=20
>> outgoing smtp traffic (dst port=3D25) to one provider and the rest o=
f=20
>> the traffic - to the other provider. How can you do this without=20
>> marking packets with iptables?
>>
>=20
>    OK ..... but i have 2 internet connections and want some specific =
IPs=20
> (my servers, for example) to go out on link1 and all the other machin=
es=20
> reaches internet through link2, then it can be done without iptables,=
=20
> with plain source routing rules.

Yes, surely some routing cases (well, most of them in real life) maybe=20
done with old good route command without any additional tools. But some=
=20
special ones require iptables.

--=20
Alexei
