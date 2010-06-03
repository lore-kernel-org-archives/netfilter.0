From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: inadequate NEW, INVALID state definitions
Date: Thu, 3 Jun 2010 09:55:10 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1006030949250.9308@obet.zrqbmnf.qr>
References: <loom.20100602T012732-376@post.gmane.org> <AANLkTikavmrze4l8YGeA3o9zbX9mV-lrSPXdBPNpIAoH@mail.gmail.com>  <alpine.LSU.2.01.1006022103590.32028@obet.zrqbmnf.qr> <AANLkTikHsAynHO6bSGritJw3a64DVrUG96th58PSfOl1@mail.gmail.com> 
 <AANLkTimjFGnLq1OAdOhLoN8tOnQvCoRXTZORlbNPf0gX@mail.gmail.com>  <alpine.DEB.2.00.1006022254390.14733@blackhole.kfki.hu> <AANLkTim1KksJ1xBRHc3Budeph7vOgjRn-V3cY3HHryhb@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTim1KksJ1xBRHc3Budeph7vOgjRn-V3cY3HHryhb@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Curby <curby@cur.by>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, Jeremiah Crockett <jrmhcrcktt@gmail.com>, netfilter@vger.kernel.org


On Thursday 2010-06-03 01:03, Curby wrote:
>On Wed, Jun 2, 2010 at 4:13 PM, Jozsef Kadlecsik
><kadlec@blackhole.kfki.hu> wrote:
>> need a deep TCP/IP knowledge from the readers. A rough description on how
>> a packet traverses conntrack and what state are associated to it could be
>> the following:
>
>Jozsef's reply goes far in giving us what we're looking for.  To
>answer my question as to when INVALID can get applied or re-applied,
>the answer is at almost any time.

Not at any time. In nf_conntrack_core.c, you have

	* l4proto->error(...)
	* resolve_normal_ct
	* l4proto->packet(...)

resolve_normal_ct would make nfct!=NULL, and a failure in l4packet
would make it NULL again. All of this happens within this one hook
(nf_conntrack_in), so Xtables does not see this intermediate result.
And after nf_conntrack_in is finished, skb->nfct should stay as-is
over the rest of the course through the tables traversal.

>For a ruleset writer, this applies to the question of how to order the
>following two rules:
>
>-A INPUT -m conntrack --ctstate INVALID -j DROP
>-A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
>
>With my new understanding, it seems that putting INVALID first is not
>useful: there is no need to "protect" EST/REL connections from INVALID
>packets by placing the INVALID rule first because anything INVALID
>would not match EST/REL anyway; they are mutually exclusive as Jan
>mentioned.  With the goal of creating a short path for a large
>majority of packets, EST/REL should be listed as close to the top as
>possible and therefore before the INVALID rule.

..As explained in The Perfect Ruleset ;-)
