From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Best way to kill a live TCP connection?
Date: Tue, 11 Jan 2011 18:39:57 +0100
Message-ID: <4D2C95ED.70805@plouf.fr.eu.org>
References: <4D2C4E92.6040902@tana.it> <alpine.LNX.2.01.1101111537180.8612@obet.zrqbmnf.qr> <4D2C8374.70408@tana.it>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D2C8374.70408@tana.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

Alessandro Vesely a =E9crit :
> On 11/Jan/11 15:41, Jan Engelhardt wrote:
>> On Tuesday 2011-01-11 13:35, Alessandro Vesely wrote:
>>=20
>>> In particular, if it is possible/convenient to design an RST inject=
or
>>> and how to attach it to iptables?
>>=20
>> If you use a ruleset that emits RST for NEW connections that are pic=
ked=20
>> up rather than SYN-new,
>>
>> -m conntrack --ctstate NEW -p tcp ! --syn --dport 22 -j REJECT=20
>> --reject-with tcp-reset
>>=20
>> .. makes it possible to RST-kill connections using `conntrack -D`.
>=20
> That's the most elegant method I've seen thus far.  Thanks a lot!

However this sends only one RST to one side of the connection, leaving
the connection half-open - until the other side sends a packet and gets
a RST too. IMO it would be more elegant to send RSTs to boths sides of
the connection.
