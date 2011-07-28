From: Pandu Poluan <pandu@poluan.info>
Subject: Re: iptables and virtual NIC
Date: Thu, 28 Jul 2011 19:00:32 +0700
Message-ID: <CAA2qdGVekbZP=x0oUspJY6-ewqvgGB7OLcbZ0Om7LMmVz1UBRg@mail.gmail.com>
References: <65C6A498BB5BF245BD7195255041FA2E04C751C4A5@bn-scl-be03.Cudanet.local>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <65C6A498BB5BF245BD7195255041FA2E04C751C4A5@bn-scl-be03.Cudanet.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Kumar Swamy <kswamy@barracuda.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Thu, Jul 28, 2011 at 17:05, Kumar Swamy <kswamy@barracuda.com> wrote=
:
> Hello folks,
>
> I am a newbie to iptables and experimenting some stuff.=C2=A0 So plea=
se excuse me, if this has already been discussed.
>
> I have a linux gateway which has a physical interface (eth0 ) and mul=
tiple virtual interfaces ( eth0:1, eth0:2), each has dynamic IP configu=
red.
> I want to create an iptables rule for =C2=A0IP masquerading on eth0 ,=
 but packets going out on other interfaces should be left untouched. Is=
 this possible?
>
> I tried
> -A POSTROUTING -o eth0 -j MASQUERADE
> But it seems packet going out on virtual NICs ( aliases) are also hit=
ting this rule.
> Is there any way to solve this problem without using SNAT? Since I ha=
ve IP address configured dynamically, there is no easy way to do SNAT.
>

How does the routing work? I.e., when does a packet exits through eth0
or eth0:1 or eth0:2?

Use the same routing criteria on the iptables rule.

Rgds,

--=20
Pandu E Poluan
~ IT Optimizer ~

=C2=A0=E2=80=A2 Blog : http://pepoluan.tumblr.com
=C2=A0=E2=80=A2 Linked-In : http://id.linkedin.com/in/pepoluan
