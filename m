From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: Nat for two private subnets with subnet routing
Date: Wed, 21 Jul 2004 18:56:41 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1090450600.2112.3.camel@localhost>
References: <40FEE340.8090907@ctwa.com>
	 <200407212302.53814.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407212302.53814.Antony@Soft-Solutions.co.uk>
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
To: netfilter <netfilter@lists.netfilter.org>

On Wed, 2004-07-21 at 18:02, Antony Stone wrote:
> On Wednesday 21 July 2004 10:42 pm, Gerry Weaver wrote:
> 
> > Hello All,
> >
> > I'm having a bit of trouble setting up a linux router with two private
> > subnets. Each subnet can access the internet, but they cannot
> > communicate with each other. I've include my rules. Any and all advice
> > would be greatly appreciated.
> 
> I believe that this rule:
> 
> > iptables -t nat -A POSTROUTING -s 10.10.11.0/24 -j SNAT --to  $WAN_IP
> 
> would benefit from specifying that it only applies to packets leaving via 
> $WAN_IFACE, otherwise it is going to SNAT packets from LAN1 to LAN2 and apply 
> the source address of $WAN_IP, which is probably not what you want?
> 
> > iptables -t mangle -A PREROUTING -i $LAN_IFACE1 -s
> > $INTERNAL_ADDRESS_RANGE1 -j ACCEPT
> 
> Why are you bothering to specify ACCEPT rules in the mangle table?
> 
> > iptables -t mangle -A PREROUTING -i $WAN_IFACE -s
> > $INTERNAL_ADDRESS_RANGE1 -j DROP
> 
> I do not agree with DROPping packets in the mangle table.   DROP is a 
> filtering action, and belongs in the filter tables.
> 
> > iptables -A FORWARD -p all -s $INTERNAL_ADDRESS_RANGE1 -d
> > $INTERNAL_ADDRESS_RANGE1 -j ACCEPT
> >
> > iptables -A FORWARD -p ALL -s $INTERNAL_ADDRESS_RANGE2 -d
> > $INTERNAL_ADDRESS_RANGE2 -j ACCEPT
> 
> I do not understand the above two rules.   Are internal address range1 and 2 
> the subnets on LAN1 and LAN2?   If so, packets between same-subnet addresses 
> are not going to pass through your firewall.   If not, what are they?
> 
> I suggest you firstly identify whether you have a routing problem or a 
> firewalling problem.
> Disconnect the machine from the WAN link to the Internet, flush all rules in 
> all tables and apply default ACCEPT policies to all chains, then see if LAN1 
> can communicate with LAN2.
> If they can, start with a simple ruleset and build up gradually so that you 
> can find out which rule/s break the inter-LAN routing.
> If they cannot, then your problem is a routing problem, not netfilter, and I 
> suggest you check the routing table on the firewall.
> 
> If you want further help, please post the output of: "iptables -L -nvx; 
> iptables -L -t nat -nvx; iptables -L -t mangle -nvx; route -n".
> 
> Regards,
> 
> Antony.
Antony has given some excellent advice here and has identified your
problem as doing NAT on your internal traffic.  I learn quite a bit from
Antony but would contest one statement he makes.  After testing and
corroboration from other experienced members of this list, I do
recommend dropping malicious packets as soon as possible and that means
in the mangle table.  Other, more generic DROP rules I, of course, put
in the filter table but rules regarding bad tcp flags, spoofs, etc., I
put in mangle.  Take care, all - John
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net 


