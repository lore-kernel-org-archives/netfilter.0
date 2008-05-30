From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: IPTABLES port forwarding woes
Date: Fri, 30 May 2008 21:11:32 +0200
Message-ID: <48405164.3000706@plouf.fr.eu.org>
References: <484008D8.3080601@soe.ucsc.edu> <4840124D.2000303@plouf.fr.eu.org> <48401A99.70408@soe.ucsc.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48401A99.70408@soe.ucsc.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Erich Weiler a =E9crit :
> Hmmm..  Follow up question to this.  How would the outgoing connectio=
n=20
> back to the internet find it's way back to the remote internet host, =
if=20
> the source address was re-written to machine 1 when in came in to beg=
in=20
> with?  Wouldn't the original remote internet source address be lost i=
n=20
> all the translation?

No, the connection tracking takes care of all this. The NAT operations=20
applied by iptables rules to the first packet creating the connection=20
are recorded and applied to subsequent packets in the same direction,=20
while the inverse operations are applied to reply packets in the=20
opposite direction.

> Thanks for your insight by the way!

You're welcome.
