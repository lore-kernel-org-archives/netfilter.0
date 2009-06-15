From: Vincent Bernat <bernat@luffy.cx>
Subject: Re: workaround for no DROP in table nat ?
Date: Mon, 15 Jun 2009 19:24:10 +0200
Message-ID: <m33aa1v29x.fsf@neo.luffy.cx>
References: <20090615165904.GA29477@regulus.madore.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20090615165904.GA29477@regulus.madore.org> (David Madore's
	message of "Mon, 15 Jun 2009 18:59:04 +0200")
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: David Madore <david+ml@madore.org>
Cc: netfilter@vger.kernel.org

OoO Lors de la soir=C3=A9e naissante du lundi 15 juin 2009, vers 18:59,=
 David
Madore <david+ml@madore.org> disait=C2=A0:

> Recent versions of iptables have forbidden the use of DROP in the nat
> table.  I can't understand, however, how one is supposed to work
> around this limitation: is there a howto or some kind of documentatio=
n
> somewhere which explains how to deal with this change?

> Suppose my current rules look something like this:

> -t nat -A OUTPUT -p tcp -d somenetwork -m tcp --syn --dport 80 -j CON=
TROLLED
> -t nat -A CONTROLLED -m limit --limit 10/hour -j RETURN
> -t nat -A CONTROLLED -p tcp -m statistic --mode random --probability =
0.1 -j REDIRECT --to-ports 80
> -t nat -A CONTROLLED -j DROP

You can DROP in the mangle table instead.

-t mangle -A OUTPUT -p tcp -d ... -j CONTROLLED
-t mangle -j CONTROLLED -m limit --limit ... -j RETURN
-t mangle -j CONTROLLED -p tcp -m statistic --mode random --probability=
 0.9 -j DROP
-t mangle -j CONTROLLED -j MARK --set-mark 1
-t nat -A OUTPUT -m mark --mark 1 -j REDIRECT --to-ports 80

You can also  DROP in the raw table,  but I think you cannot  set a mar=
k
here.
--=20
BOFH excuse #381:
Robotic tape changer mistook operator's tie for a backup tape.
