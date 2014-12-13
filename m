From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: iptables DNAT algorithm -- another way?
Date: Sat, 13 Dec 2014 10:21:04 +0100
Message-ID: <548C0500.8030408@plouf.fr.eu.org>
References: <548B8069.4020802@brandeis.edu> <201412121950.59768.neal.p.murphy@alum.wpi.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201412121950.59768.neal.p.murphy@alum.wpi.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: neal.p.murphy@alum.wpi.edu
Cc: netfilter@vger.kernel.org

Hello,

Neal Murphy a =E9crit :
> On Friday, December 12, 2014 06:55:21 PM John Miller wrote:
>>
>> My solution thus far has been to use DNAT to trick our scanning prog=
ram
>> into thinking it's using local addresses.
>>
>> iptables -t nat -A OUTPUT -d 172.16.x.y -j DNAT \
>>      --to-destination 129.64.x.y
>=20
> This might point you in the right direction:
>=20
> iptables -t nat -A PREROUTING -s 172.16.0.0/16 \
>   -j DNAT --to-destination 129.64.0.0-129.64.255.255
>=20
> But I don't know if it provides predictable 1:1 mapping.

It doesn't. You want to use NETMAP instead of DNAT.

> Traditionally, DNAT must be done in the nat table in PREROUTING (chan=
ge the=20
> destination address before any routing decisions are made).

That's for incoming packets. For locally-generated outgoing packets, yo=
u
want to use the OUTPUT chain.
