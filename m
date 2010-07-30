From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Synflood filtering and Conntrack
Date: Fri, 30 Jul 2010 12:32:28 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1007301106410.957@blackhole.kfki.hu>
References: <4C4F5DCE.2060304@conversis.de> <4C4FBF16.50203@chello.at> <alpine.LSU.2.01.1007280756510.26636@obet.zrqbmnf.qr> <4C5161E2.8020407@chello.at> <alpine.LSU.2.01.1007291315440.2646@obet.zrqbmnf.qr> <4C516687.6060602@chello.at> <4C517559.2030702@plouf.fr.eu.org>
 <alpine.LSU.2.01.1007291448450.15281@obet.zrqbmnf.qr> <alpine.DEB.2.00.1007291723040.32027@blackhole.kfki.hu> <4C520C9C.7090909@plouf.fr.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C520C9C.7090909@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: Jan Engelhardt <jengelh@medozas.de>, netfilter@vger.kernel.org, "Dennis J." <dennisml@conversis.de>, Pablo Neira Ayuso <pablo@netfilter.org>

On Fri, 30 Jul 2010, Pascal Hambourg wrote:

> Jozsef Kadlecsik a ?crit :
> > 
> > I don't see why it looks soo complicated: of course, a ct entry is created 
> > by conntrack whenever a new connection is detected. And of course the 
> > entry is destroyed if the packet, which triggered to create the new entry,
> > is dropped by a rule. Why should the conntrack entry be kept, if the 
> > connection is not allowed by the rules?
> > 
> > The new ct entries are kept in the unconfirmed list and only added to the 
> > conntrack hash iff the entry will be confirmed, that is the entry-creating 
> > packet won't be dropped by a rule.
> 
> Thanks for this explanation. Just one more clarification, please : is
> the conntrack entry destroyed also if the packet which triggered its
> creation is dropped by something else than an iptables rule, such as
> routing decision, TTL exceeded, conflict with an existing NAT mapping ?

Yes, if any other subsystem drop the packet, the conntrack entry is 
destroyed as well.

The first packet must pass through (forwarded or delivered to a local 
process), otherwise the ct entry is just created and then destroyed. 
Unfortunately, without a massive redesign of the whole system, we cannot 
get rid of this unfortunate create/destroy ct entry cycle.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
