From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: iptables and virtual NIC
Date: Thu, 28 Jul 2011 17:21:27 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1107281720360.5350@frira.zrqbmnf.qr>
References: <65C6A498BB5BF245BD7195255041FA2E04C751C4A5@bn-scl-be03.Cudanet.local> <CAA2qdGVekbZP=x0oUspJY6-ewqvgGB7OLcbZ0Om7LMmVz1UBRg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAA2qdGVekbZP=x0oUspJY6-ewqvgGB7OLcbZ0Om7LMmVz1UBRg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: Pandu Poluan <pandu@poluan.info>
Cc: Kumar Swamy <kswamy@barracuda.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Thursday 2011-07-28 14:00, Pandu Poluan wrote:

>On Thu, Jul 28, 2011 at 17:05, Kumar Swamy <kswamy@barracuda.com> wrot=
e:
>> Hello folks,
>>
>> I am a newbie to iptables and experimenting some stuff.=C2=A0 So ple=
ase excuse me, if this has already been discussed.
>>
>> I have a linux gateway which has a physical interface (eth0 ) and mu=
ltiple virtual interfaces ( eth0:1, eth0:2), each has dynamic IP config=
ured.
>> I want to create an iptables rule for =C2=A0IP masquerading on eth0 =
, but packets going out on other interfaces should be left untouched. I=
s this possible?
>>
>> I tried
>> -A POSTROUTING -o eth0 -j MASQUERADE
>> But it seems packet going out on virtual NICs ( aliases) are also hi=
tting this rule.
>> Is there any way to solve this problem without using SNAT? Since I h=
ave IP address configured dynamically, there is no easy way to do SNAT.
>>
>
>How does the routing work? I.e., when does a packet exits through eth0
>or eth0:1 or eth0:2?

Routing only accepts eth0 because, again, eth0:1 as shown by braindead=20
programs is not an interface.
