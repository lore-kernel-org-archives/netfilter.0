From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: Dynamically adding rules - are connection tracking states
 maintained?
Date: Fri, 25 Apr 2008 19:39:47 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804251937520.20150@fbirervta.pbzchgretzou.qr>
References: <989878.86998.qm@web57314.mail.re1.yahoo.com> <4810DE81.10302@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4810DE81.10302@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org


On Thursday 2008-04-24 21:24, Pascal Hambourg wrote:
> noa levy a =C3=A9crit :
>>=20
>> When I add a rule to (or delete a rule from) iptables,
>> while it is running, does that have any effect on the states in the
>> connection tracking table?
>
> No.
>
>> Will the table be flushed?
>
> No.

the conntrack table remains;
the fw rule table is atomically exchanged.

>> Are states linked  to the rule that allowed the initial packet in [.=
=2E.] ?
>
> No.

(No,) but parameters attached to rules may get reset when loading a
new ruleset into the kernel. Now what constutitues an "attached" data
portion hm... xt_quota for example stores its quota counter with the
rule. xt_recent for example on the other hand stores its data in a
separate malloc'ed area that is safe.
