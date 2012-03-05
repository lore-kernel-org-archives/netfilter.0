From: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: fail in the connmark load-balancing
Date: Mon, 05 Mar 2012 14:34:48 +0100
Message-ID: <4F54C0F8.2080700@freemail.hu>
References: <CAMTjHrw9SY99jV9iwVH2CaSX2s4s=m7wzSjYii_k_D8fmJrDzA@mail.gmail.com> <1329084658.18690.375.camel@andrew-desktop> <CAMTjHrx9EPdrBYPDSbo03wYxd8BGcqbwe3Ns3rxkK=wMOm8EUA@mail.gmail.com> <CAMTjHrxzWaCx6Vp9r-x1JXBkMcdFz7gLEKYrwq5CQgveDhmshg@mail.gmail.com> <1330167236.30413.175.camel@andrew-desktop> <CAMTjHryS-nWPExfpprHeQ2UmW5O0bEthL+34p3RSqgAfHtk=4A@mail.gmail.com> <4F4CB793.9080105@freemail.hu> <CAMTjHrwpNfbA-a6WUh1OV8G=-BHAX3ONHYtsBT3apM-f-pGsmg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAMTjHrwpNfbA-a6WUh1OV8G=-BHAX3ONHYtsBT3apM-f-pGsmg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Usu=E1rio_do_Sistema?= <maiconlp@ig.com.br>
Cc: Andrew Beverley <andy@andybev.com>, Mail List - Netfilter <netfilter@vger.kernel.org>

Hi,

Let me explain my post a bit :D

2012-03-02 22:24 keltez=E9ssel, Usu=E1rio do Sistema =EDrta:
> Hi,
>
> iptables -t mangle -N MARKS
> iptables -t mangle -A MARKS - RETURN -m mark ! --mark 0/3
If we have a mark (either 1 or 2 or 3) then we should just RETURN=20
because we already set the mark...
> iptables -t mangle -A MARKS -j MARK --set-mark 3/3 -m state --state
> ESTABLISED,RELATED
If the connection is already ESTABLISHED or it is RELATED to an another=
=20
connetion then just mark it as 3.
> iptables -t mangle -A MARKS -j MARK --set-mark 1/3 -m mark --mark 0/3
> -m mode statistic --mode nth --every 2
Every 2nd. connection should be marked as 2.
> iptables -t mangle -A MARKS -j MARK --set-mark 2/3 -m mark --mark 0/3
Every other connection is marked as 1.
> sorry, but I did understand the mark x/y as you wrote above. why did
> you use --set-mark 1 or --set-mark 2 ??
x is the mark, y is the mask...
0 -> not marked -> new or already establised but not marked (see mark 3=
)
1 -> new connection that should go out on interface 1.
2 -> new connection that should go out on interface 2.
3 -> any other but marked so we do not check again. (ESTABLISED, RELATE=
D)
> I think when it's use the mark x/y  y is an mask but I'dont know what
> is the match ?!?! with someone has a doc about that please post here.
man iptables (MARK target):

        --set-mark value[/mask]
               Zeroes out the bits given by mask and ORs value into the=
=20
packet mark. If mask is omitted, 0xFFFFFFFF is assumed.

> I haven't done test yet with your suggested Swifty. I'll tell you whe=
n I do.
>
> thanks

After reading my post I found out that my script can be fine tuned ... =
:D

In mangle/PREROUTING change these lines:
iptables -t mangle -A PREROUTING -j CONNMARK --restore-mark
iptables -t mangle -A PREROUTING -j MARKS

to this:
iptables -t mangle -A PREROUTING -j CONNMARK --restore-mark
iptables -t mangle -A PREROUTING -j MARK --set-mark 1/3 -m mark --mark=20
0/3 -i eth2
iptables -t mangle -A PREROUTING -j MARK --set-mark 2/3 -m mark --mark=20
0/3 -i eth0
iptables -t mangle -A PREROUTING -j MARKS

This modification ensures that any incoming connection (that either goe=
s=20
to the firewall or gets FORWARDED) should take the same interface as it=
=20
came from.

Swifty
