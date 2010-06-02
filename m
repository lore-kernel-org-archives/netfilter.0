From: Curby <curby@cur.by>
Subject: Re: inadequate NEW, INVALID state definitions
Date: Wed, 2 Jun 2010 14:48:14 -0600
Message-ID: <AANLkTimjFGnLq1OAdOhLoN8tOnQvCoRXTZORlbNPf0gX@mail.gmail.com>
References: <loom.20100602T012732-376@post.gmane.org> <AANLkTikavmrze4l8YGeA3o9zbX9mV-lrSPXdBPNpIAoH@mail.gmail.com> 
	<alpine.LSU.2.01.1006022103590.32028@obet.zrqbmnf.qr> <AANLkTikHsAynHO6bSGritJw3a64DVrUG96th58PSfOl1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTikHsAynHO6bSGritJw3a64DVrUG96th58PSfOl1@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jeremiah Crockett <jrmhcrcktt@gmail.com>
Cc: Jan Engelhardt <jengelh@medozas.de>, netfilter@vger.kernel.org

On Wed, Jun 2, 2010 at 2:35 PM, Jeremiah Crockett <jrmhcrcktt@gmail.com=
> wrote:
> On Wed, Jun 2, 2010 at 1:27 PM, Jan Engelhardt <jengelh@medozas.de> w=
rote:
>> . The five
>> --ctstates {NEW, ESTABLISHED, RELATED, INVALID, UNTRACKED} _are
>> mutually exclusive_ to another.
>
> Are they all inclusive, i.e., is it possible for a packet not to matc=
h any
> of these states?=A0 Or do packets "fall-through" into UNTRACKED if no=
thing
> else matches?

I believe that the default is INVALID, not UNTRACKED.  From my limited
understanding, UNTRACKED is used for traffic that was sent to the
NOTRACK target.

On Wed, Jun 2, 2010 at 1:27 PM, Jan Engelhardt <jengelh@medozas.de> wro=
te:
> Packets basically start without any associated connection, that is,
> will be matched by -m conntrack --ctstate INVALID.

Thanks Jan.  So two important points that I gleaned from your post are
(1) the states are mutually exclusive and (2) all packets start with a
default of INVALID.

This seems to get a bit murkier as some conditions that match INVALID,
including invalid combinations of TCP flags, seem to be an "active
match" instead of a "passive default."  In other words, if the state
starts as INVALID, and conntrack determines that it should be state
NEW, something somehow must be applied afterwards to force it back to
INVALID due to it being a malformed packet.  How does that "something"
fit in with this chain of events, and what does it check for?
Alternately, do the checks for placing a packet into the other states
check for malformed packets, in which case no second check for
malformed packets needs to be done because anything that moves from
INVALID is already known to be well-formed?

I think part of the confusion stems from this: Based on my reading of
the admittedly suboptimal documentation, there are two ways that
packets can be marked INVALID:

The packet is not part of any connection marked NEW, RELATED,
ESTABLISHED, or UNTRACKED.
The packet is malformed or otherwise problematic.

The first is determined in the context of the conntrack system, and
takes into consideration conntrack's knowledge of the state of the
network and the connections therein.  The second treats packets in a
vacuum and evaluates parts of the packet against other parts to
determine its consistency.

It's likely that my confusion stems from a still-incomplete knowledge
of how packets traverse the different parts of netfilter and xtables.

Thanks again, everyone!

--Mike
