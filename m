From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: [OT?] iptables <-> shorewall equivalence and zones
Date: Sat, 19 Apr 2003 13:49:49 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0304191340000.28238-100000@dell>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: iptables mailing list <netfilter@lists.netfilter.org>


  perhaps more a shorewall firewall question than strictly iptables,
but i'll give this a shot.

  i was curious about using shorewall to set up my iptables rules
since it seemed to have a fairly direct equivalence to the basic
iptables rules, and wouldn't require a lot of translation.

  from what i see, the shorewall package is based on defining
what it calls "zones", and you get to set policies and rules
based on the traffic that's allowed between one zone and another.
so far, that maps to iptables nicely.

  however, it *appears* (and i stress "appears") that zones
are defined as being what lives beyond an interface, and you can't
get more detailed than that.

  in a single host case, there would be two zones -- out there
("net"), and "fw", the host itself (the host always being considered
the "fw" zone).  but this doesn't seem to be sufficient for what
i'm trying to do.

  currently, i have a single RH 9 box, on an in-house LAN.
the LAN connects thru a linksys hub to the outside world.
so, from my perspective, i'd like to think i have the following
zones:

  fw)	my RH 9 box itself
  lan)	the internal in-house LAN (192.168.1.x)
  hub)  the linksys hub itself
  net)  the internet out there in the big bad world

certainly, with straight iptables rules, i can define rules
to accept or reject traffic to and from these entities.  but i don't 
see how shorewall will let me define zones that aren't immediately
adjacent to this host (that is, that don't map directly to an
interface).

  if that's not possible, then i might as well stick with
straight iptables rules.

  thoughts?

rday


