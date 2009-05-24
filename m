From: Tore Anderson <tore.anderson@redpill-linpro.com>
Subject: Re: How do we arp for NAT?  Secondary IPs, proxy arp? something else?
Date: Sun, 24 May 2009 23:55:29 +0200
Message-ID: <4A19C251.3090504@redpill-linpro.com>
References: <4A19235F.4070306@opendreams.net> <4A192D38.90008@redpill-linpro.com> <4A19B5F1.4080000@opendreams.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A19B5F1.4080000@opendreams.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jesse Molina <jesse@opendreams.net>
Cc: netfilter@vger.kernel.org

* Jesse Molina

> That's a pretty good suggestion, but it's more of a workaround than
> something that actually addresses the issue at hand.  I'm looking for a
> solution on the GNU/Linux host, not in the world around it.

Why is that?  Isn't making things work the most important thing to you?

Accurately setting up the routing tables (on all involved devices) isn't
a workaround, it's the most logical solution.  I'm sorry that you have
an uncooperative provider - that's the problem that requires a
"workaround", in my opinion.

> To restate my question:  What alternative ways are there to make the
> GNU/Linux system reply to ARP requests for an IP, without that IP being
> an actual interface on the host, or that interface must not be used by
> local services *in any way*, for the reasons of using it via SNAT/DNAT?

I'm not sure you can make Linux respond to ARP solicitations without
having a local IP address.  Perhaps you use arptables to mangle the
addresses used for NAT to/from the firewall's local address (in both the
inbound and the outbound directions) - no guarantees it will work
though, I never tried it.

You can also simply add the addresses to a local interface on the
firewall, so that ARP requests will be answered.  Preventing access to
local services running on the firewall through those addresses is easy,
just add rules to iptables' INPUT chain that discard any traffic
destined for them.

> Here is an example where the solution you suggested would not work:  I
> have a Qwest ADSL line with a /29 network.  That's what we have, and
> it's not going to change.  Qwest will not issue you a /30 for the
> point-to-point between the ADSL router device and your GNU/Linux
> firewall.

If you have admin access to the Qwest router, you could still use my
initial suggestion by adding static routes to the NAT-ed addresses using
the primary address of your firewall as the next-hop.  The more specific
routes will take precedence over the link-local /29, and things will
work just fine.  It feels a bit more like a hack this way, though.

Another option is to add static entries in the ARP table of the ADSL
router for the addresses used for NAT, that way you don't have to
persuade the firewall to reply to ARP for non-local adresses.

BR,
-- 
Tore Anderson
Redpill Linpro AS - http://www.redpill-linpro.com/
