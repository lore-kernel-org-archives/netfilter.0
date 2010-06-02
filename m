From: Curby <curby@cur.by>
Subject: Re: inadequate NEW, INVALID state definitions
Date: Wed, 2 Jun 2010 17:03:20 -0600
Message-ID: <AANLkTim1KksJ1xBRHc3Budeph7vOgjRn-V3cY3HHryhb@mail.gmail.com>
References: <loom.20100602T012732-376@post.gmane.org> <AANLkTikavmrze4l8YGeA3o9zbX9mV-lrSPXdBPNpIAoH@mail.gmail.com> 
	<alpine.LSU.2.01.1006022103590.32028@obet.zrqbmnf.qr> <AANLkTikHsAynHO6bSGritJw3a64DVrUG96th58PSfOl1@mail.gmail.com> 
	<AANLkTimjFGnLq1OAdOhLoN8tOnQvCoRXTZORlbNPf0gX@mail.gmail.com> 
	<alpine.DEB.2.00.1006022254390.14733@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1006022254390.14733@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Jeremiah Crockett <jrmhcrcktt@gmail.com>, Jan Engelhardt <jengelh@medozas.de>, netfilter@vger.kernel.org

On Wed, Jun 2, 2010 at 4:13 PM, Jozsef Kadlecsik
<kadlec@blackhole.kfki.hu> wrote:
> need a deep TCP/IP knowledge from the readers. A rough description on how
> a packet traverses conntrack and what state are associated to it could be
> the following:

Jozsef's reply goes far in giving us what we're looking for.  To
answer my question as to when INVALID can get applied or re-applied,
the answer is at almost any time.  In other words, while there is a
default of INVALID, conntrack will check for invalid conditions as it
applies its normal logic in seeing if other states should be used
instead.

For a ruleset writer, this applies to the question of how to order the
following two rules:

-A INPUT -m conntrack --ctstate INVALID -j DROP
-A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

With my new understanding, it seems that putting INVALID first is not
useful: there is no need to "protect" EST/REL connections from INVALID
packets by placing the INVALID rule first because anything INVALID
would not match EST/REL anyway; they are mutually exclusive as Jan
mentioned.  With the goal of creating a short path for a large
majority of packets, EST/REL should be listed as close to the top as
possible and therefore before the INVALID rule.  In most cases, there
is negligible gain in removing a single rule from the path, but
there's nothing gained in terms of security from putting INVALID
first.

Thanks again for the insights!

--Mike
