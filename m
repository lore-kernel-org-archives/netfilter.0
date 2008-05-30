From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: IPTABLES port forwarding woes
Date: Fri, 30 May 2008 16:42:21 +0200
Message-ID: <4840124D.2000303@plouf.fr.eu.org>
References: <484008D8.3080601@soe.ucsc.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <484008D8.3080601@soe.ucsc.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Erich Weiler a =E9crit :
>=20
> Ah, I forgot to mention, machine 2 is on a private network that is no=
t
> routed in any way.  So, there is no default gateway for machine 2...
> That's why I was thinking the source port would have to be re-written
> internally such that machine 2 would know to send it back through
> machine 1 and then on to the internet... ?

Then indeed you need to SNAT the forwarded connection. Also make sure=20
that machine 1 has IP forwarding enabled.
