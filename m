From: Erich Weiler <weiler@soe.ucsc.edu>
Subject: Re: IPTABLES port forwarding woes
Date: Fri, 30 May 2008 08:17:45 -0700
Message-ID: <48401A99.70408@soe.ucsc.edu>
References: <484008D8.3080601@soe.ucsc.edu> <4840124D.2000303@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4840124D.2000303@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

Hmmm..  Follow up question to this.  How would the outgoing connection=20
back to the internet find it's way back to the remote internet host, if=
=20
the source address was re-written to machine 1 when in came in to begin=
=20
with?  Wouldn't the original remote internet source address be lost in=20
all the translation?

Thanks for your insight by the way!

-erich

Pascal Hambourg wrote:
> Erich Weiler a =E9crit :
>>
>> Ah, I forgot to mention, machine 2 is on a private network that is n=
ot
>> routed in any way.  So, there is no default gateway for machine 2...
>> That's why I was thinking the source port would have to be re-writte=
n
>> internally such that machine 2 would know to send it back through
>> machine 1 and then on to the internet... ?
>=20
> Then indeed you need to SNAT the forwarded connection. Also make sure=
=20
> that machine 1 has IP forwarding enabled.
> --=20
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
