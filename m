From: Eric Leblond <eric@inl.fr>
Subject: Re: Incoming packet in wrong chain
Date: Mon, 09 Feb 2009 08:19:29 +0100
Message-ID: <498FD901.40205@inl.fr>
References: <20090208171752.32010@gmx.net> <498F4E63.8050603@inl.fr> <20090208224430.207240@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20090208224430.207240@gmx.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Tim Ritberg <tim_rit@gmx.de>
Cc: netfilter@vger.kernel.org

Hi,

Tim Ritberg a =E9crit :
>> For Netfilter connection tracking, a NEW TCP connection does not hav=
e to
>> start with a SYN packet. If
>> /proc/sys/net/netfilter/nf_conntrack_tcp_loose is set to 1 (default)=
,
>> Netfilter will try to pick up connection. By this mean, it is possib=
le
>> to recover a connection (in some fail-over case for example), but it
>> introduces this looking-weird-at-first behaviour.
>>
>> BR,
>> - --
>> Eric Leblond <eleblond@inl.fr>
>=20
> because of that netfilter put it in INPUT-Chain?
> and I wonder why it occurs randomly.

These packets are often due to ghost connections:
 - packet from a connection "closed" in the middle due to link failure
 - packet from connection open by the people having the IP before you
 - ...

> Should I switch  to nf_conntrack_tcp_loose 0?

You can, there should be no problem with that.

BR,
--=20
Eric Leblond <eric@inl.fr>
INL: http://www.inl.fr/
NuFW: http://www.nufw.org/
