From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: How to redirect the package from eth0 to eth2
Date: Tue, 11 Jan 2011 12:11:03 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1101111202140.15356@obet.zrqbmnf.qr>
References: <AANLkTik5YfQ4eNzbSVt5QfmaEQnBA=VJ1NbueKgq9nZj@mail.gmail.com> <20110110115615.GH25060@outback.rfc2324.org> <AANLkTiniEo+DvnWfZQDU3FBZ7iAoqTnqAYuE1QbR=Wt2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTiniEo+DvnWfZQDU3FBZ7iAoqTnqAYuE1QbR=Wt2@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: Roc Bai <buroc83@gmail.com>
Cc: netfilter@vger.kernel.org


On Tuesday 2011-01-11 04:22, Roc Bai wrote:
>>> Dear all:
>>> =C2=A0 =C2=A0 in my service, there are four net card. =C2=A0eth0, e=
th1, eth2, eth3. I
>>> want to forward the data in from eth0 to eth1, eth2, eth3 with
>>> different application protocol. Does some body send me some ideas o=
n
>>> it?
>>
>> If you want to re-route packages, that has to happen in pre-routing.
>> If you want to use DNAT for examples, just add a rule to the
>> PREROUTING chain in the nat table.
>
>I think the DNAT should change the package data, including the IP or
>higher level protocol header, isn't it?

That is the point of NAT. NAT is _not_ routing/forwarding (dammit).
And it's "packet", not "package".

>I think the best idea which can redirect the package is to add/change
>the route rule to do it. I have write some source codes which doesn't
>work.

That's redundant (and as you can see, error prone). Just use
the iproute utilities to define extra rules and routes, which
are known to work.

>ncf_get_entry() can generate a dst_entry whose dev point to the eth2
>net_device structure. But when i use tcpdum -i eth2. I cannot get the
>package from eth0. So it doesn't work.

I don't expect it to. You are using a global variable, which is not
SMP-safe without a lock.
You might find Paul McKenny's Parallel Programming Book helping.

>static struct dst_entry gdst;
>static int ncfflag =3D 0;
