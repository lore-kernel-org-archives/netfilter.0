From: Pandu Poluan <pandu@poluan.info>
Subject: Re: connlimit problem
Date: Fri, 9 Sep 2011 15:55:55 +0700
Message-ID: <CAA2qdGU31i6931dhi5xUqQoyjDQx7F9+c8Px3_PQNhrXbFzSJw@mail.gmail.com>
References: <4E69C831.4050004@univ-nantes.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4E69C831.4050004@univ-nantes.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: jean-philippe.menil@univ-nantes.fr
Cc: netfilter@vger.kernel.org

2011/9/9 Jean-Philippe Menil <jean-philippe.menil@univ-nantes.fr>:
> Hi,
>
> I try to limit the connection per ip with connlimit in addition to th=
e
> socket match, with the following rule:
> $IPTABLES -t mangle -A PREROUTING -s $LAN -p tcp --syn --dport http -=
m
> socket -m connlimit --connlimit-above 0 -j DIVERT
>
> But as you can see, theses rules =C2=A0never match:
>
> =C2=A0 =C2=A00 =C2=A0 =C2=A0 0 DIVERT =C2=A0 =C2=A0 tcp =C2=A0-- =C2=A0=
* =C2=A0 =C2=A0 =C2=A0* =C2=A0 =C2=A0 =C2=A0 192.168.100.0/24 =C2=A0 =C2=
=A0 0.0.0.0/0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcp dpt:80flags: 0x17/0x02 s=
ocket #conn src/32 > 1
> =C2=A0 =C2=A09 =C2=A03030 DIVERT =C2=A0 =C2=A0 tcp =C2=A0-- =C2=A0* =C2=
=A0 =C2=A0 =C2=A0* =C2=A0 =C2=A0 =C2=A0 192.168.100.0/24 =C2=A0 =C2=A0 =
0.0.0.0/0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcp dpt:80 socket
> =C2=A0 =C2=A05 =C2=A0 216 TPROXY =C2=A0 =C2=A0 tcp =C2=A0-- =C2=A0* =C2=
=A0 =C2=A0 =C2=A0* =C2=A0 =C2=A0 =C2=A0 192.168.100.0/24 =C2=A0 =C2=A0 =
0.0.0.0/0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcp dpt:80 TPROXY redirect 0=
=2E0.0.0:50080 mark 0x1/0x1
> =C2=A0 =C2=A00 =C2=A0 =C2=A0 0 DIVERT =C2=A0 =C2=A0 tcp =C2=A0-- =C2=A0=
* =C2=A0 =C2=A0 =C2=A0* =C2=A0 =C2=A0 =C2=A0 192.168.100.0/24 =C2=A0 =C2=
=A0 0.0.0.0/0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcp dpt:3128flags: 0x17/0x02=
 socket #conn src/32 > 1
> =C2=A0 =C2=A06 =C2=A02491 DIVERT =C2=A0 =C2=A0 tcp =C2=A0-- =C2=A0* =C2=
=A0 =C2=A0 =C2=A0* =C2=A0 =C2=A0 =C2=A0 192.168.100.0/24 =C2=A0 =C2=A0 =
0.0.0.0/0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcp dpt:3128 socket
> =C2=A0 19 =C2=A0 800 TPROXY =C2=A0 =C2=A0 tcp =C2=A0-- =C2=A0* =C2=A0=
 =C2=A0 =C2=A0* =C2=A0 =C2=A0 =C2=A0 192.168.100.0/24 =C2=A0 =C2=A0 0.0=
=2E0.0/0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcp dpt:3128 TPROXY redirect=
 0.0.0.0:50080 mark 0x1/0x1
>
> Is this an expected behaviour, or a problem in my rules?
>

I think it's because the PREROUTING table has no concept of connection
(conntrack has not started yet), so the number of connection(s) stays
at zero.

Of course, I might be wrong. Someone please CMIIW.

Rgds,
--=20
=46dS Pandu E Poluan
~ IT Optimizer ~

=C2=A0=E2=80=A2 LOPSA Member #15248
=C2=A0=E2=80=A2 Blog : http://pepoluan.tumblr.com
=C2=A0=E2=80=A2 Linked-In : http://id.linkedin.com/in/pepoluan
