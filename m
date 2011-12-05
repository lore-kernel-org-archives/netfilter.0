From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: [iptables] Implement huge amount of iptables make system crash
Date: Mon, 5 Dec 2011 02:11:11 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1112050206140.18896@frira.zrqbmnf.qr>
References: <20111204133420.GC12769@via.ecp.fr> <alpine.LNX.2.01.1112042207270.5627@frira.zrqbmnf.qr> <20111205000758.GA25556@via.ecp.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20111205000758.GA25556@via.ecp.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Leo Cavaille <chiron@via.ecp.fr>
Cc: netfilter@vger.kernel.org

On Monday 2011-12-05 01:07, Leo Cavaille wrote:

>Le Sun, Dec 04, 2011 at 10:09:07PM +0100, Jan Engelhardt a =C3=A9crit =
:
>> >2) These ~62k rules are not really significant for the load of my
>> >firewall. But unfortunately, I had sometimes in my tests to manage =
some big=20
>> >failures, where an iptables command (-Z, -A or -L) is stuck on the =
system=20
>> >and then one of my cores is used at 100% and the load increases, an=
d generally=20
>> >I get this kernel alert :
>> >http://pastebin.com/F1DL7ZZT
>>=20
>> Keep in mind that the ruleset is replaced for each HW thread and thu=
s=20
>> puts big requirements on memory available; as such though, I would h=
ave=20
>> expected an OOM message rather than a Unable To Handle Kernel Paging=
=20
>> Request.
>
>I had the chance to see a 'top' running when crashing and the memory (=
I
>got plenty =3D16GB) was only used about 1/4.

You won't see this in top, because the alloc-dealloc cycle is most=20
likely faster than top's interval.

http://www.spinics.net/lists/netfilter/msg51895.html


>But the CPUs are used at full capacity ! Do you know if it is SW or HW
>issue ?

A layer-8 issue. To traverse 62000 rules just for a single packet=20
requires time (which is why it's even more important to go the=20
logarithmic way).


>It could be a coincidence but my clock is running crazy. I have got so=
me
>huge offsets recently and I am trying to solve this other issue right
>now. (AFAIK there is no reason it could be link to the iptables kernel
>paging request)=20

Wouldn't know, but report it to linux-kernel@. I did not keep track of=20
timer issues (since I did not have any).
