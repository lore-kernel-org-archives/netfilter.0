From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: nf_nat_sip & nf_conntrack_sip
Date: Mon, 29 Jun 2009 15:36:44 +0200
Message-ID: <4A48C36C.5060903@plouf.fr.eu.org>
References: <1982.192.168.1.3.1246005268.squirrel@webmail.decimal.pt>    <4A44C5B2.9030408@trash.net>    <2164.87.196.204.28.1246043247.squirrel@webmail.decimal.pt>    <1892.192.168.1.3.1246263728.squirrel@webmail.decimal.pt>    <4A48B3F4.8000705@trash.net>    <2152.192.168.1.3.1246280022.squirrel@webmail.decimal.pt>    <4A48B97C.1060803@trash.net> <2306.192.168.1.3.1246280527.squirrel@webmail.decimal.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <2306.192.168.1.3.1246280527.squirrel@webmail.decimal.pt>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Jorge Bastos a =E9crit :
>>> Explain something to me if possible, why is the SIP module need if
>>> everything works without it?
>>
>> Well, in that case you don't need it obviously :) In case you're usi=
ng
>> NAT, I guess you're also using STUN or something similar. This does =
not
>> really work reliable with netfilter, although it might appear that w=
ay
>> most of the time.
>=20
> Well, this is on the machine that is doing NAT for local LAN, no STUN=
 or
> so :P

STUN is used by the clients, not NATs.
