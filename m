From: =?UTF-8?B?VmxhZG8gRHLFvsOtaw==?= <vlado@ttx.sk>
Subject: Re: SNAT and multiple ISP problem
Date: Mon, 27 Apr 2009 18:54:59 +0200
Message-ID: <49F5E363.8010005@ttx.sk>
References: <40e8da40904260645x601a22a4obb942a30e3428d31@mail.gmail.com> <1240817530.16720.7.camel@casper.meteor.dp.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1240817530.16720.7.camel@casper.meteor.dp.ua>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: 'netfilter' <netfilter@vger.kernel.org>

=D0=9F=D0=BE=D0=BA=D0=BE=D1=82=D0=B8=D0=BB=D0=B5=D0=BD=D0=BA=D0=BE =D0=9A=
=D0=BE=D1=81=D1=82=D0=B8=D0=BA  wrote / nap=C3=ADsal(a):
> =D0=92 =D0=92=D1=81=D0=BA, 26/04/2009 =D0=B2 17:45 +0400, Maxim Koshe=
lev =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Hi all,
>> I have a problem that I can't find working way to do some kind of lo=
ad
>> balance beetween two internet channels using SNAT. I've tried variou=
s
>> schemes to do this but in all of them kernel makes wrong routing.
>> For example if I try to add such rules in nat:
>>
>> iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to $ETH0IP
>> iptables -t nat -A POSTROUTING -o ppp0 -j SNAT --to $PPP0IP
>>
>> kernel will do SNAT only according default route in table main. It i=
s
>> ok. But if I try to change default routing selection (e.g. by adding
>> in 'mangle' table some marks and adding 'ip rules' with this marks)
>> kernel begins to route some packets nated to ppp0 into eth0 and
>> vice-versa! I can simple monitor this ugly behavior using tcpdump. I=
t
>> brings to lost packets and connections drops ( because one of IP's i=
s
>> 192.168... but second one is real )
>>
>> Is there any way to make right routing?
>=20
> One hint: when dialing with connctrack you should remember that seen
> connections get remembered, and when you play with routing some
> connections had already been natted to different address. So, when yo=
u
> dinamically change routing just to make sure do "conntrack -F conntra=
ck
> && conntrack -F expect".
>=20

More precisely you have to flush route cache also after such change (if
this is problem).
# ip route flush cache

Example of route cache.
# ip route show cache
192.43.172.30 from 62.200.200.10 via 62.200.200.1 dev eth1
    cache  mtu 1500 advmss 1460 metric10 64
10.1.1.53 from 66.152.85.206 dev eth0  src 62.200.200.10
    cache  mtu 1500 advmss 1460 metric10 64 iif eth1
67.63.48.89 from 62.200.200.10 via 62.200.200.1 dev eth1
    cache  ipid 0xbb81 mtu 1500 advmss 1460 metric10 64
193.100.100.2 from 192.100.100.50 dev eth2
    cache  mtu 1500 advmss 1460 metric10 64
local 10.1.1.2 from 10.1.1.53 dev lo  src 10.1.1.2
    cache <local,src-direct>  iif eth0

