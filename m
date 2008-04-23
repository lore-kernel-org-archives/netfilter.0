From: Alexei Ustyuzhaninov <alust@208.195-224-87.telenet.ru>
Subject: Re: IPTables : How to force data coming from ethX being output by
 the same device
Date: Wed, 23 Apr 2008 22:33:36 +0600
Message-ID: <480F64E0.50209@208.195-224-87.telenet.ru>
References: <c4ecb9830804230703q3f3cc02doc03c34a293d6014c@mail.gmail.com> <480F49BE.60600@solutti.com.br> <alpine.LNX.1.10.0804231641310.13697@fbirervta.pbzchgretzou.qr> <480F4CD9.4020006@solutti.com.br> <alpine.LNX.1.10.0804231717190.13697@fbirervta.pbzchgretzou.qr> <480F57D8.1060704@solutti.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <480F57D8.1060704@solutti.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?UTF-8?B?TGVvbmFyZG8gUm9kcmlndWVzIE1hZ2FsaMOjZXM=?= <leolistas@solutti.com.br>
Cc: ML netfilter <netfilter@vger.kernel.org>

Leonardo Rodrigues Magalh=C3=A3es wrote:
>=20
>=20
> Jan Engelhardt escreveu:
>>
>> It is not completely not related. By changing things such as
>> nfmark, TOS field, source or destination address, routing can
>> be influenced, so I would not say it's totally unrelated :)
>>  =20
>=20
>    Changing all these parameters will do nothing if you dont have=20
> appropriate routing rules that uses them as routing criteria paramete=
rs.
>=20
>    Well .... yes, it's not completly unrelated, iptables really can=20
> 'help' routing decisions with those things.
>=20
>    iptables can be used to help routing decisions, but this is not th=
e=20
> only way of doing it. You can have your source routing rules and get=20
> advanced routing without iptables rules, it's not required, but yes c=
an=20
> be used sometimes. On pretty advanced routing situations, maybe iptab=
les=20
> 'helping' rules would be necessary, but advanced routing can be done=20
> without iptables.

I don't think any routing may be done without iptables. A simple=20
example: you have two internet connections and want to route all=20
outgoing smtp traffic (dst port=3D25) to one provider and the rest of t=
he=20
traffic - to the other provider. How can you do this without marking=20
packets with iptables?

--=20
Alexei
