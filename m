From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: DROP vs. REJECT...
Date: Fri, 22 Apr 2005 10:02:20 -0500
Message-ID: <426911FC.7060807@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: iptables <netfilter@lists.netfilter.org>

Ok, I think I've answered a few questions on this list so now I'm going to submit one.

In the past there have been on going conversations / threads having to do with DROPing traffic vs REJECTing traffic in a filter.  I am wanting to rehashs such a conversation with a couple of points in mind:

 - DROPing traffic will keep the attacker from receiving a RST or similar packet from your system.  However this is the expected behavior in a situation where a system *IS* available on the net *AND* has been configured to hide thus announcing that it is there by the lack of the ICMP Host Unreachable messages.  Some people feel the need to DROP traffic any way so they do not become an unwitting / unwilling participant in a reflected DDoS on someone else.  There are many politics in organizations around such decisions.

 - REJECTing traffic with ICMP Host Unreachable will send back the responce that would be exptected if someone tried to initiate a connection with a host that was not there.  One drawback to doing this is it is possible to become an unwitting / unwilling participant in a reflected DDoS on someone else. (Note the politics from above.)  However I have a problem with this scenario, that being the source of the ICMP Host Unreachable *IS* the system that you are trying to state is unreachable.  For example, I have a system at the office configured at the moment to REJECT --reject-with icmp-host-unreachable and when I try to traceroute to it I get an response in traceroutes output *FROM* the box in question stating !H which to me means no route to host.  IMHO this is yet anohter, but different, statement that the host that you are trying to hide *IS* available on the net *AND* has been configu
 red to hide thus announcing that it is there by the response coming from the system that 
you are trying to hide.  This REJECTing should be run on the upstream firewall if you have the capability to do so.  If the ICMP error message did come from an upstream router / firewall it would be perfictly valid to have a !H no route to host message from a router that does serve the subnet thus effectively hiding the system in a way that I'm not aware of to look around.

 - Also, if a host is listening on the net and offering services, for example SMTP, SSH, DNS, HTTP, is it entirely appropriate to reject with an ICMP Host Unreachable / !H No Route to Host as this is a lie b/c the same client that you are rejecting could be connected to valid services and thus know that the host is there and consequently knowing that the host has had some fairly stringent firewalling to make it appear as if only specific services are available?  I know that if you are offering services on some ports but not others it is virtually impossible to make it appear as if you are not there so most of this would only apply to systems that are pure NAT gateways for internal LAN clients.  But it's still food for thought.

These are just some thoughts on this issue.  I'd like to get this mail lists opinion to see what they thin as well as possible pros and cons to both situations.



Grant. . . .

