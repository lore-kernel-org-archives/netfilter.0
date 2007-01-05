From: Ted Phelps <phelps@gnusto.com>
Subject: Re: GRE Packet in IPSec not Inbound?
Date: Fri, 05 Jan 2007 05:29:00 -0600
Message-ID: <26294.1167996540@laika.gnusto.com>
References: <00ea01c73096$671bc7d0$35535770$@com>
	<17305.1167984636@laika.gnusto.com>
	<00ed01c730a5$69b846d0$3d28d470$@com>
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: Your message of Fri, 05 Jan 2007 01:42:20 MST. 
	<00ed01c730a5$69b846d0$3d28d470$@com> 
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joshua Perry <josh@6bit.com>, netfilter@lists.netfilter.org

"Joshua Perry" writes:
> Huh?  I'm I reading the config wrong?  There are no ipsec packets that
> hit the vpn1_in chain only the actual data packets get to vpn1_in
> after ESP and GRE are stripped.  When the raw data packet makes its
> run through netfilter it never hits the rule that you mentioned,
> right?

Sorry, I typed vpn1 when I meant vlan4.


> I have it working, the caveat is that Shorewall by default adds that
> "-m policy --dir in --pol none" to the inbound rules and only the
> original ESP packet and the bare data packet match that rule and jump
> to their respective zone chains. When I remove that policy everything
> works great, I'm just wondering if the asymmetric handling of the
> policy is a netfilter bug, or if I should ask the Shorewall guys to
> look at changing that default policy.

I think you disable your firewall if you remove that policy, so I expect
that you'll want to keep it.

So the ESP packet comes in on vlan4, gets bounced to the vlan4_in chain
and from there either to the dynamic or the inet2fw chain depending on
whether or not its part of an established connection.  You haven't told
us what the dynamic chain looks like, but if it goes to the inet2fw
chain then it will match the 3rd rule (prot=esp) and be accepted.  Then
the ESP header is stripped of, revealing a GRE packet and the process
starts again...

The GRE packet comes in on the vlan4 interface, gets bounced to the
vlan4_in chain and from there to either dynamic or inet2fw, depending on
whether or not its part of an established connection.  If it's part of
an established connection then it will match the 5th rule (prot=47) and
be accepted, but without seeing what the dynamic chain looks like I
can't say if it you would be able to get it to that state in the first
place.

> [packet dumps stripped]


> You can see that the ESP got accepted because of the rule you mentioned, but
> the policy match filter keeps the GRE packets from getting ACCEPTED (they
> don't even make it into the inet2fw chain because of it).

I think you're misunderstanding the policy match rule.  This rule...

   37  6072 inet2fw    all  --  *      *       0.0.0.0/0
0.0.0.0/0           policy match dir in pol none

... says that packets which are inbound and don't match any existing
policy get bounced to the inet2fw chain.  It doesn't prevent packets
from going to that chain; it's the only thing that can send them there.

I suspect that the default policy for vlan4_in is to accept, in which
case the absence of this rule will disable your firewall.  I think it's
more likely that the missing packets are matching the previous rule:

   31  3512 dynamic    all  --  *      *       0.0.0.0/0
0.0.0.0/0           state INVALID,NEW

I would guess that the dynamic chain is the place where things are going
awry, but again you haven't told us what that looks like, so I'm just
guessing that it's dropping your GRE packets.


Hope that helps?

Cheers,
-Ted

