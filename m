From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: module order: tcp/conntrack vs. conntrack/tcp
Date: Mon, 2 Jul 2012 14:16:10 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1207021414160.9210@frira.zrqbmnf.qr>
References: <9bfb14742a7ec35d775699fc955f437b@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <9bfb14742a7ec35d775699fc955f437b@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: Wouter <wouter-netfilter@publica.duodecim.org>
Cc: netfilter@vger.kernel.org

On Monday 2012-07-02 14:02, Wouter wrote:

>I'm wondering about the practical difference between these seemingly
>equivalent rules (notice the module order):
>
>iptables -A INPUT -i eth0 -p tcp --dport 8140 -m state --state NEW -j
>ACCEPT
>iptables -A INPUT -i eth0 -p tcp -m state --state NEW -m tcp --dport 8=
140
>-j ACCEPT
>
>While I always use the form of rule 1 (filter first, then state NEW), =
I
>found some systems configured like rule 2 =E2=80=93 which appears to h=
ave the same
>end result =E2=80=93 and I wonder if rule 2 (state first, then filter)=
 has any side
>effects or causes more overhead.

The use of -m conntrack (state is obsolete) is cheaper than people=20
think, because the ct belonging to a packet is already long determined,=
=20
so looking at the state is quite simple.
