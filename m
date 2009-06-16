From: Amos Jeffries <squid3@treenet.co.nz>
Subject: Re: workaround for no DROP in table nat =?UTF-8?Q?=3F?=
Date: Tue, 16 Jun 2009 16:29:08 +1200
Message-ID: <778caabff9c5013ee945219bcae424c6@mail.treenet.co.nz>
References: <20090615165904.GA29477@regulus.madore.org> <m33aa1v29x.fsf@neo.luffy.cx>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <m33aa1v29x.fsf@neo.luffy.cx>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Vincent Bernat <bernat@luffy.cx>
Cc: David Madore <david+ml@madore.org>, netfilter@vger.kernel.org

On Mon, 15 Jun 2009 19:24:10 +0200, Vincent Bernat <bernat@luffy.cx> wr=
ote:
> OoO Lors de la soir=C3=A9e naissante du lundi 15 juin 2009, vers 18:5=
9, David
> Madore <david+ml@madore.org> disait :
>=20
>> Recent versions of iptables have forbidden the use of DROP in the na=
t
>> table.  I can't understand, however, how one is supposed to work
>> around this limitation: is there a howto or some kind of documentati=
on
>> somewhere which explains how to deal with this change?
>=20
>> Suppose my current rules look something like this:
>=20
>> -t nat -A OUTPUT -p tcp -d somenetwork -m tcp --syn --dport 80 -j
>> CONTROLLED
>> -t nat -A CONTROLLED -m limit --limit 10/hour -j RETURN
>> -t nat -A CONTROLLED -p tcp -m statistic --mode random --probability=
 0.1
>> -j REDIRECT --to-ports 80
>> -t nat -A CONTROLLED -j DROP
>=20
> You can DROP in the mangle table instead.
>=20
> -t mangle -A OUTPUT -p tcp -d ... -j CONTROLLED
> -t mangle -j CONTROLLED -m limit --limit ... -j RETURN
> -t mangle -j CONTROLLED -p tcp -m statistic --mode random --probabili=
ty
0.9
> -j DROP
> -t mangle -j CONTROLLED -j MARK --set-mark 1
> -t nat -A OUTPUT -m mark --mark 1 -j REDIRECT --to-ports 80
>=20
> You can also  DROP in the raw table,  but I think you cannot  set a m=
ark
> here.

Would this not begin to drop n% packets instead of n% connections? due =
to
the nat table only receiving NEW packets and mangle receiving all.

I think you may also need to add state NEW to the rule somehow.

AYJ
