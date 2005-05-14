From: Jonathan Wheeler <griffous@griffous.net>
Subject: Combined Internal/External DNAT question
Date: Sat, 14 May 2005 17:51:47 +1200
Message-ID: <428591F3.8090400@griffous.net>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi Guys,

I have a number of internal servers sitting behind my iptables firewall
running various services (smtp/http/dns etc).
My public IP address sits on my DSL router's WAN interface, which nats
the specified ports for my public services to the firewall's interface &
IP which is attached to the router via crossover cable.

Iptables has about 15 entries all along the lines of

iptables -t nat -A PREROUTING -d 10.0.0.1 -i eth1 -p tcp --dport
<tcpservice> -j DNAT --to <relevant.internal. server>:<tcpservice>
And this works nicely.

However I have the classic situation of internal clients using the DNS
entries for these servers which points them to my external IP. The
firewall forwards the traffic out the dsl interface to the internet as
it has no knowledge of my public IP. It doesn't work, the DSL router
can't NAT to and from the LAN interface.

The following documentation is close to what I want, but doesn't quite work.
http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO-10.html

The reason it doesn't work is that my firewall doesn't actually have the
external IP.

What I need is rule along the lines of:
iptables -t nat -I PREROUTING -d <publicIP> -s <internal-lan> -j DNAT
--to 10.0.0.1.
I would then have traffic from the internal lan, going the same
destination IP that my public natting rules are already built for. Which
should then redirect internal clients to my internal servers using these
same natting rules.

It appears however that once iptables had done it's initial DNAT of a
session as per the rule above, it doesn't reevalute the PREROUTING chain.

Which means that clients try to connect to the firewall itself rather
then being DNATed again.

HELP, I need some kind of a double DNAT?

I know there are solutions to this problem like dual dns, but getting
this would be MUCH quicker to setup/manage/scale, and I wouldn't have to
play DNS games.

I could also create a whole second set of rules DNATing internal traffic
destined for my public IP, to go to the correct server, but then I'd
have 2 chains of traffic to maintain. Is there no way I can do this all
with one set of rules, on the one firewall?

Thanks,
Jonathan.

