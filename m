From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: connlimit problem
Date: Fri, 9 Sep 2011 11:07:30 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1109091106490.21515@frira.zrqbmnf.qr>
References: <4E69C831.4050004@univ-nantes.fr> <CAA2qdGU31i6931dhi5xUqQoyjDQx7F9+c8Px3_PQNhrXbFzSJw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAA2qdGU31i6931dhi5xUqQoyjDQx7F9+c8Px3_PQNhrXbFzSJw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: Pandu Poluan <pandu@poluan.info>
Cc: jean-philippe.menil@univ-nantes.fr, netfilter@vger.kernel.org

On Friday 2011-09-09 10:55, Pandu Poluan wrote:

>2011/9/9 Jean-Philippe Menil <jean-philippe.menil@univ-nantes.fr>:
>> Hi,
>>
>> I try to limit the connection per ip with connlimit in addition to t=
he
>> socket match, with the following rule:
>> $IPTABLES -t mangle -A PREROUTING -s $LAN -p tcp --syn --dport http =
-m
>> socket -m connlimit --connlimit-above 0 -j DIVERT
>>
>> But as you can see, theses rules =C2=A0never match:
>>
>> =C2=A0 =C2=A00 =C2=A0 =C2=A0 0 DIVERT =C2=A0 =C2=A0 tcp =C2=A0-- =C2=
=A0* =C2=A0 =C2=A0 =C2=A0* =C2=A0 =C2=A0 =C2=A0 192.168.100.0/24 =C2=A0=
 =C2=A0 0.0.0.0/0
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcp dpt:80flags: 0x17/0x02 =
socket #conn src/32 > 1
>> =C2=A0 =C2=A09 =C2=A03030 DIVERT =C2=A0 =C2=A0 tcp =C2=A0-- =C2=A0* =
=C2=A0 =C2=A0 =C2=A0* =C2=A0 =C2=A0 =C2=A0 192.168.100.0/24 =C2=A0 =C2=A0=
 0.0.0.0/0
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcp dpt:80 socket
>> =C2=A0 =C2=A05 =C2=A0 216 TPROXY =C2=A0 =C2=A0 tcp =C2=A0-- =C2=A0* =
=C2=A0 =C2=A0 =C2=A0* =C2=A0 =C2=A0 =C2=A0 192.168.100.0/24 =C2=A0 =C2=A0=
 0.0.0.0/0
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcp dpt:80 TPROXY redirect =
0.0.0.0:50080 mark 0x1/0x1
>> =C2=A0 =C2=A00 =C2=A0 =C2=A0 0 DIVERT =C2=A0 =C2=A0 tcp =C2=A0-- =C2=
=A0* =C2=A0 =C2=A0 =C2=A0* =C2=A0 =C2=A0 =C2=A0 192.168.100.0/24 =C2=A0=
 =C2=A0 0.0.0.0/0
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcp dpt:3128flags: 0x17/0x0=
2 socket #conn src/32 > 1
>> =C2=A0 =C2=A06 =C2=A02491 DIVERT =C2=A0 =C2=A0 tcp =C2=A0-- =C2=A0* =
=C2=A0 =C2=A0 =C2=A0* =C2=A0 =C2=A0 =C2=A0 192.168.100.0/24 =C2=A0 =C2=A0=
 0.0.0.0/0
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcp dpt:3128 socket
>> =C2=A0 19 =C2=A0 800 TPROXY =C2=A0 =C2=A0 tcp =C2=A0-- =C2=A0* =C2=A0=
 =C2=A0 =C2=A0* =C2=A0 =C2=A0 =C2=A0 192.168.100.0/24 =C2=A0 =C2=A0 0.0=
=2E0.0/0
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcp dpt:3128 TPROXY redirec=
t 0.0.0.0:50080 mark 0x1/0x1
>>
>> Is this an expected behaviour, or a problem in my rules?
>>
>
>I think it's because the PREROUTING table has no concept of connection
>(conntrack has not started yet), so the number of connection(s) stays
>at zero.
>
>Of course, I might be wrong. Someone please CMIIW.

Indeed your assessment is false.
