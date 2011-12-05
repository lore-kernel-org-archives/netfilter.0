From: Leo Cavaille <chiron@via.ecp.fr>
Subject: Re: [iptables] Implement huge amount of iptables make system crash
Date: Mon, 5 Dec 2011 01:07:58 +0100
Message-ID: <20111205000758.GA25556@via.ecp.fr>
References: <20111204133420.GC12769@via.ecp.fr>
 <alpine.LNX.2.01.1112042207270.5627@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.01.1112042207270.5627@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

Le Sun, Dec 04, 2011 at 10:09:07PM +0100, Jan Engelhardt a =C3=A9crit :
> >2) These ~62k rules are not really significant for the load of my
> >firewall. But unfortunately, I had sometimes in my tests to manage s=
ome big=20
> >failures, where an iptables command (-Z, -A or -L) is stuck on the s=
ystem=20
> >and then one of my cores is used at 100% and the load increases, and=
 generally=20
> >I get this kernel alert :
> >http://pastebin.com/F1DL7ZZT
>=20
> Keep in mind that the ruleset is replaced for each HW thread and thus=
=20
> puts big requirements on memory available; as such though, I would ha=
ve=20
> expected an OOM message rather than a Unable To Handle Kernel Paging=20
> Request.

I had the chance to see a 'top' running when crashing and the memory (I
got plenty =3D16GB) was only used about 1/4.
But the CPUs are used at full capacity ! Do you know if it is SW or HW
issue ?

It could be a coincidence but my clock is running crazy. I have got som=
e
huge offsets recently and I am trying to solve this other issue right
now. (AFAIK there is no reason it could be link to the iptables kernel
paging request)=20

--=20
Leo Cavaille
