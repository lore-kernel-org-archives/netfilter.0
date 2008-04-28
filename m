From: noa levy <levynoa@yahoo.com>
Subject: Re: Dynamically adding rules - are connection tracking states maintained?
Date: Mon, 28 Apr 2008 15:27:34 -0700 (PDT)
Message-ID: <832773.11379.qm@web57302.mail.re1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@computergmbh.de>, Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

Thank you very much for your replies.=20
I still don't understand one thing though: Let's say I delete a rule th=
at allows SSH traffic. There are probably many entries in the conntrack=
 table for SSH sessions. Will these sessions continue to be allowed in,=
 even though I have just=A0deleted the rule that allowed SSH (and my de=
fault policy is DROP)?=A0


On Thursday 2008-04-24 21:24, Pascal Hambourg wrote:
> noa levy a =E9crit :
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

>> Are states linked=A0 to the rule that allowed the initial packet in =
[....] ?
>
> No.

(No,) but parameters attached to rules may get reset when loading a
new ruleset into the kernel. Now what constutitues an "attached" data
portion hm... xt_quota for example stores its quota counter with the
rule. xt_recent for example on the other hand stores its data in a
separate malloc'ed area that is safe.
--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at=A0 http://vger.kernel.org/majordomo-info.html



      _________________________________________________________________=
___________________
Be a better friend, newshound, and=20
know-it-all with Yahoo! Mobile.  Try it now.  http://mobile.yahoo.com/;=
_ylt=3DAhu06i62sR8HDtDypao8Wcj9tAcJ

