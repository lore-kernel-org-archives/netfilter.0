From: "John A. Sullivan III" <jsullivan@opensourcedevelopmentcorp.com>
Subject: Re: wireless security
Date: Thu, 10 Jun 2004 10:55:00 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1086879263.2015.47.camel@localhost>
References: <0b5b01c44ee2$f2e7cef0$49caa8c0@caris.priv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <0b5b01c44ee2$f2e7cef0$49caa8c0@caris.priv>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Peter Marshall <peter.marshall@caris.com>
Cc: netfilter <netfilter@lists.netfilter.org>

On Thu, 2004-06-10 at 08:03, Peter Marshall wrote:
> Hi guys,
> 
> I am sure someone has been faced with this problem, and I was just wondering
> what the possible solutions are.  A city wide free wireless network has just
> expanded to cover the area encompassing our building.  The provider of this
> is also the provider of our Internet (via fiber).  It was decided that it
> would be advantageous for some of our employees to be able to use this
> wireless network when we bring in clients etc.  This of course opens a large
> possibility of problems concerning crap getting onto our network (especially
> if they are connected to wireless and plugged into the network).
> 
> We have made it a policy that a personal firewall be installed on all
> firewalls, and that at no time is a wireless card to be plugged into a
> laptop while connected to our LAN.  This of course does not do much for
> internal cards ....
> 
> Is there anyway at all that I can firewall this ?  Or is there a way o
> prevent the two networks from being active at the same time .. I am at a bit
> of a loss here.
<snip>
You're taking some good steps and I certainly don't envy your position. 
You are so exposed to very dangerous violations of policy.  That may be
one non-technical action you can take to minimize the risk -- get senior
management support and mount a good internal PR campaign about the real
and present danger of violating company policy - it  doesn't exist to
inconvenience them but to protect as can be seen by the these alarming
case studies . . . .

Your problem is not at all uncommon in the sense that, more and more, we
see the attacker as likely to come from the inside as the outside - not
just the 70% of hacks that are done by employees but, increasingly, the
work of trojans, phishing scams, unprotected wireless home connections
for telecommuters, etc.  Thus, we tell our clients to not build a
Maginot line or Great Wall but expect the perimeter to be compromised
and be ready for it.

We make three general recommendations.  Somewhat controversially they do
not include a NIDS (Network Intrusion Detection System - e.g., Snort). 
I certainly do not want to contradict Antony's response to your posting;
I always highly regard his advice as better than mine! However, we have
found NIDS to be an expensive cat and mouse game of finding ways around
NIDS followed by finding ways to discover the new ways around NIDS. 
Then there is the question of where to place them and then how to keep
them tuned.  It can work very well but it takes so much effort and
expertise to do it well that we recommend spending the time, energy and
money elsewhere.  We recommend:

1) Install some kind of HIDS (Host Intrustion Detection System) so that
at least you know if you have been compromised and can react.  For all
the accusations that IT is always reactive rather than proactive,
security is the one area where the reverse is true; all the effort goes
into the proactive effort of keeping bad guys out but little effort is
spent finding them if they have gotten past the perimeter defense.  Full
blown HIDS can be very taxing.  There is quite an interesting open
source one in the works at
(http://www.intersectalliance.com/projects/Snare/)
We usually recommend a simple integrity checker for normal security
needs.  The granddaddy is Tripwire (http://www.tripwire.com) but I have
been increasingly impressed with the fully open source and
multi-platform Osiris (http://osiris.shmoo.com).

2) Perform constant vulnerability assessments.  This can be provided as
a service such as through one of our sponsors, Nexus Management
(http://www.nexusmgmt.com) or one can simply use some of the automated
features of Nessus (http://www.nessus.org), a great open source tool,
combined with some means of software distribution.

3) Use Internet style security internally -- between offices and between
users and critical resources.  This way, if a user is compromised, the
attacker can only do what the user normally can do, e.g., access NetBIOS
for file sharing on Windows but not the RPC ports used for
administration, the database application on Linux but not telnet or ssh,
NCP on NetWare for file sharing but not RCONJ for Remote Console.  If
one uses extended user authentication with the firewall, e.g., X.509
certs, RADIUS, SecureID tokens, then they cannot increase their access
by spoofing addresses.  Add IPSec on the client to the mix and they
cannot even sniff information off the local segment (we have found in
light of tools like Ettercap (http://ettercap.sourceforge.net) that
switches offer no protection against packet sniffing).

Maintaining inter and intra office security can be very expensive and
difficult to maintain because of the rapid rate of change of the
security configuration.  Each time a server or new service on a server
or subnet is added, changes must be made to the firewalls.  This also
creates a huge exposure to human error (I shudder each time an admin has
to manually edit a complex, order dependent set of access control rules
compounded by NAT compounded by VPN!).  We have found that we can
minimize the human error and reduce the cost of managing this security
by over 90% with the ISCS project (http://iscs.sourceforge.net).  Yes,
for those who are regulars on the list, I am plugging it again - but we
have put our careers and personal finances on the line to make it a
reality because we believe so strongly in it in light of point three
above and, because we've done it before in the real world for a highly
distributed international organization, we know it works.  So please
pardon me if I'm constantly trolling for mind share and support.

You seem like an experienced fellow so, perhaps I am just telling you
what you already know.  I hope it helps at least somewhat - John
-- 
Open Source Development Corporation
Financially sustainable open source development
http://www.opensourcedevelopmentcorp.com


