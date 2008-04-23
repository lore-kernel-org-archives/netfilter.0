From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: IPTables : How to force data coming from ethX being output by
 the same device
Date: Wed, 23 Apr 2008 20:50:04 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804232048170.15791@fbirervta.pbzchgretzou.qr>
References: <c4ecb9830804230703q3f3cc02doc03c34a293d6014c@mail.gmail.com> <480F49BE.60600@solutti.com.br> <alpine.LNX.1.10.0804231641310.13697@fbirervta.pbzchgretzou.qr> <480F4CD9.4020006@solutti.com.br> <alpine.LNX.1.10.0804231717190.13697@fbirervta.pbzchgretzou.qr>
 <480F57D8.1060704@solutti.com.br> <480F64E0.50209@208.195-224-87.telenet.ru> <480F727C.20608@solutti.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <480F727C.20608@solutti.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: =?UTF-8?Q?Leonardo_Rodrigues_Magalh=C3=A3es?= <leolistas@solutti.com.br>
Cc: ML netfilter <netfilter@vger.kernel.org>


On Wednesday 2008-04-23 19:31, Leonardo Rodrigues Magalh=C3=A3es wrote:
> Alexei Ustyuzhaninov escreveu:
>>
>> I don't think any routing may be done without iptables. A simple exa=
mple: you
>> have two internet connections and want to route all outgoing smtp tr=
affic
>> (dst port=3D25) to one provider and the rest of the traffic - to the=
 other
>> provider. How can you do this without marking packets with iptables?
>>
>
>   OK ..... but i have 2 internet connections and want some specific I=
Ps (my
> servers, for example) to go out on link1 and all the other machines r=
eaches
> internet through link2, then it can be done without iptables, with pl=
ain source
> routing rules.

Yes, but I seem to remember you wanted all packets originating from
eth0 to go back into eth0; you did not mention specific IP addresses :-=
)
Either way, quite the same complexity class.
