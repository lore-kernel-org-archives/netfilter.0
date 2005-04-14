From: Nagy Zoltan <kirk@elte.hu>
Subject: can i alter the icmp redirects source address?
Date: Thu, 14 Apr 2005 23:32:09 +0159
Message-ID: <425EE16F.9040108@elte.hu>
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
To: netfilter@lists.netfilter.org

hi

i'm searching for a module which can alter the source ip in the icmp redirect messages, because we have 2 networks in our lan,
and i don't want the firewall to route those packets thru
i've an arp-proxy based fw, and it has no ip's in the the 2 subnets, where the clients sitting, it increases ttl, and sends arp request with 0.0.0.0 source address,
and the only thing i miss is that to modify the icmp-redirect packets to look like it's source address is our router, because icmp redirects is only accepted if it comes
from a first hop router...and 10.0.0.2 is'nt it ;)
i've thinked on taking up our router address to send the redirects as it should be, but in this case if the user ping our router...
he can only be sure that our firewall is up, and not our router...
i've putted some extra options in our dhcp server's option list so MS-XP's are able to route to the other subnet and communicate thru that way but this is
only a half solution it would be best if i can send the redirects with the router's ip and forget the what's the user want's to send thru it...i don let the packages
thru the wall..i'we just let the tcp syn's and 1 udp/sec to get routeing decision and generate the redirect message,
then drop away ( i know that rfc say's that the router have to only notify the user about the better route, but i don't to see
that traffic on that system...)
another idea was to change the clients router to 10.0.0.2 and add a route for them to 10.0.0.2, but i don't like this to much ;)


how can i send hose packet with the right source, or any other solution?

kirk

