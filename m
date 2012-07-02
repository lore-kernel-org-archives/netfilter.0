From: Wouter <wouter-netfilter@publica.duodecim.org>
Subject: Re: module order: tcp/conntrack vs. conntrack/tcp
Date: Mon, 02 Jul 2012 08:49:28 -0400
Message-ID: <2c07aacd811d81e9b28165bd1123cad5@localhost>
References: <9bfb14742a7ec35d775699fc955f437b@localhost> <alpine.LNX.2.01.1207021414160.9210@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1207021414160.9210@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Jan Engelhardt <jengelh@inai.de>
Cc: netfilter@vger.kernel.org


On Mon, 2 Jul 2012 14:16:10 +0200 (CEST), Jan Engelhardt <jengelh@inai.=
de>=0D
wrote:=0D
> On Monday 2012-07-02 14:02, Wouter wrote:=0D
> =0D
>>I'm wondering about the practical difference between these seemingly=0D
>>equivalent rules (notice the module order):=0D
>>=0D
>>iptables -A INPUT -i eth0 -p tcp --dport 8140 -m state --state NEW -j=
=0D
>>ACCEPT=0D
>>iptables -A INPUT -i eth0 -p tcp -m state --state NEW -m tcp --dport=0D
8140=0D
>>-j ACCEPT=0D
>>=0D
>>While I always use the form of rule 1 (filter first, then state NEW),=
 I=0D
>>found some systems configured like rule 2 =E2=80=93 which appears to =
have the=0D
>>same=0D
>>end result =E2=80=93 and I wonder if rule 2 (state first, then filter=
) has any=0D
>>side=0D
>>effects or causes more overhead.=0D
> =0D
> The use of -m conntrack (state is obsolete) is cheaper than people =0D
> think, because the ct belonging to a packet is already long determine=
d, =0D
> so looking at the state is quite simple.=0D
=0D
So there are no negative side effects from conntrack --> tcp versus the=
=0D
more common tcp --> conntrack?=0D
=0D
Thanks for the speedy reply,=0D
=0D
  Wouter=0D

