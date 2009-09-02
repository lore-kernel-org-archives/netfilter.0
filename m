From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Checking line status
Date: Wed, 02 Sep 2009 17:16:33 +0200
Message-ID: <4A9E8C51.9070108@plouf.fr.eu.org>
References: <4A93CC1C.3070100@infoservices.in> <58261217A1E14FCCB2F0CF27FA977252@squarepi.com> <4A93DDA0.6000900@trash.net> <591B070B9C3D465CA4CCE1B11024DBEA@squarepi.com> <1251895652.23708.37.camel@enterprise.ims-firmen.de> <0DB67FCC2A774AFCA834C6CD4BE5DB12@squarepi.com> <4A9E812E.2060601@plouf.fr.eu.org> <24462D0647E440E0A4E0ED3861DCB074@squarepi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <24462D0647E440E0A4E0ED3861DCB074@squarepi.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: John Lister <john.lister@kickstone.com>
Cc: netfilter@vger.kernel.org

John Lister a =E9crit :
>=20
> I'd shortened it without the filter part as you don't need to specify=
 the=20
> table :)

Only in the userland tools. In the kernel there is no default table.

>>> iptables -t mangle -A OUTPUT -m mark --mark 0 -m state --state
>>>     -j MARK --set-mark 111
>=20
>> Isn't something missing in that rule ?
> I'm guessing you mean the statistic bit?

And the state after --state too.
Do your MARK rules match some packets (counters increase) ?
