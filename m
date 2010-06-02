From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: inadequate NEW, INVALID state definitions
Date: Wed, 2 Jun 2010 23:45:01 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1006022315510.12072@obet.zrqbmnf.qr>
References: <loom.20100602T012732-376@post.gmane.org> <AANLkTikavmrze4l8YGeA3o9zbX9mV-lrSPXdBPNpIAoH@mail.gmail.com>  <alpine.LSU.2.01.1006022103590.32028@obet.zrqbmnf.qr> <AANLkTikHsAynHO6bSGritJw3a64DVrUG96th58PSfOl1@mail.gmail.com>
 <AANLkTimjFGnLq1OAdOhLoN8tOnQvCoRXTZORlbNPf0gX@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTimjFGnLq1OAdOhLoN8tOnQvCoRXTZORlbNPf0gX@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Curby <curby@cur.by>
Cc: Jeremiah Crockett <jrmhcrcktt@gmail.com>, netfilter@vger.kernel.org


On Wednesday 2010-06-02 22:48, Curby wrote:
>
>This seems to get a bit murkier as some conditions that match INVALID,
>including invalid combinations of TCP flags, seem to be an "active
>match" instead of a "passive default."  In other words, if the state
>starts as INVALID, and conntrack determines that it should be state
>NEW, something somehow must be applied afterwards to force it back to
>INVALID due to it being a malformed packet.  How does that "something"
>fit in with this chain of events, and what does it check for?

The 'error' check function (bad length, flags, zz.)
runs before creating a ct entry.

>The first is determined in the context of the conntrack system, and
>takes into consideration conntrack's knowledge of the state of the
>network and the connections therein.  The second treats packets in a
>vacuum and evaluates parts of the packet against other parts to
>determine its consistency.

conntrack has no knowledge of the network layout, topology,
speed,  or any other condition, other than perhaps the recently-added
user-settable zone identifier.

>It's likely that my confusion stems from a still-incomplete knowledge
>of how packets traverse the different parts of netfilter and xtables.

Start by reading http://en.wikipedia.org/wiki/Netfilter and /iptables,
perhaps.
Their current version is clean and approved by me :p
