From: Victor Safronov <vitek@vitek.tomsk.ru>
Subject: Re: iptables/ipset caused packet drops on interfaces
Date: Tue, 14 Jul 2009 16:15:49 +0700
Message-ID: <4A5C4CC5.1080107@vitek.tomsk.ru>
References: <1247562280.5215.97.camel@vects1.nivki.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1247562280.5215.97.camel@vects1.nivki.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1251"; format="flowed"
To: Vects <netfilter@vects.com>
Cc: netfilter@vger.kernel.org

Vects =EF=E8=F8=E5=F2:
> Hello there,
> I'm using iptables/ipsets on busy linux firewall, this firewall handl=
es
> 300-400 Mb/s during the working hours, time to time I see significant
> traffic drop and ksoftirqd/1 uses 100% cpu, in this situation I do
> stop/start iptables, after that network traffic and ksoftirqd returne=
d
> to be normal.
> First I thought this is a problem with network card driver, changing =
the
> driver didn't help, then I found that it depends from the number of
> ipsets in iptables.=20
>
> I'm using iptables 1.4.4 and ipset 3.0, I tested it on centos with
> original kernel and custom compiled 2.6.31, the same result.
>
> There's an output of ifconfig=20
>
> eth0      Link encap:Ethernet  HWaddr 00:19:BB:2D:98:D4 =20
>           inet addr:x.x.x.x  Bcast:x.x.x.x  Mask:255.255.255.248
>           inet6 addr: fe80::219:bbff:fe2d:98d4/64 Scope:Link
>           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>           RX packets:34773084524 errors:0 dropped:19709680 overruns:0=
 frame:0
>           TX packets:26672945752 errors:0 dropped:0 overruns:0 carrie=
r:0
>           collisions:0 txqueuelen:3000=20
>           RX bytes:34484441962468 (31.3 TiB)  TX bytes:7277712977419 =
(6.6 TiB)
>           Interrupt:185 Memory:f8000000-f8012800=20
>
>
> What else I can do in order to solve that problem? I'll appreciate an=
y
> input.
>
> Thanks, Serge.
>  =20
You can use oprofile to determine what exactly 'eats' your processor ti=
me.
This problem is well known for me.
