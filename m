From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: mangle vs. nat problem?
Date: Mon, 31 Aug 2009 12:44:04 +0200
Message-ID: <4A9BA974.1000100@plouf.fr.eu.org>
References: <5427726c0908301651y59ef1babv7bbbe625f915ca01@mail.gmail.com>	 <1251679563.6436.2.camel@jaspav.missionsit.net.missionsit.net>	 <5427726c0908301817s6e2e11fdnd958d0b3bd81c55@mail.gmail.com> <1251682388.6436.10.camel@jaspav.missionsit.net.missionsit.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1251682388.6436.10.camel@jaspav.missionsit.net.missionsit.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org
Cc: "John A. Sullivan III" <jsullivan@opensourcedevel.com>, Gothmolly <gothmolly@gmail.com>

Hello,

John A. Sullivan III a =E9crit :
>=20
> One thing I'm not sure about is how the mangle table marking is worki=
ng
> with conntrack and it is entirely my ignorance.  I think all the pack=
ets
> pass through mangle although I'm not sure.  If that is the case, then
> the first packet of the flow will be marked with mark 1, the nat tabl=
e
> will see it and send it to port 1514.  If the second packet is part o=
f
> the same flow, it will be marked with mark 2 but will never see the n=
at
> table; it will be automatically sent to port 1514.

You are correct, except on one detail : conntrack does not perform NAT
itself, and packets of an existing flow for which a NAT mapping already
exists enter the nat *table* which performs the NAT according to the
mapping. They just skip the nat *chains*.
