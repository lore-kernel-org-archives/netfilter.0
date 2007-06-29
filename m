From: thiago@powers.com.br
Subject: link redudancy, not load-balancing
Date: Fri, 29 Jun 2007 13:45:55 -0300
Message-ID: <OF6EB5F11D.33F06DA2-ON83257309.004CA1AE-83257309.005BD989@powers.com.br>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


Whats up list,

I'll try to make my question clean and clear, but unfortunatelly not too
short. The scenario is:

2 internet providers connected to one linux router/firewall box (provider1,
which is my default route, and provider2)
1 local network connected to the same box, with services running on
different servers/internal ip addresses (localnet)

I need to hit services running on servers of this internal network, having
the option of doing this using one internet connection or another, or both
at the same time.

If the connection comes in through 'provider1', there's no mangle
treatment, the packet that comes in also goes out through the default
route.

If the connection comes in through 'provider2', directed to a service that
runs on the router itself, using iproute2 + iptables/mangle I make it work;
- I set a mark on both INPUT and OUTPUT mangle tables, marking the packet
from/to its IP address,
- and insert a routing rule to match the packet mark and redirect it to a
'secondary' routing table, which has provider2' gateway as default route,
sending the established connection back through the correct path..

But lets say I want to hit, for example, the telnet service (tcp/23)  that
is running on a server that is behing this nat.

Again, I want to be able to use this telnet service from the internet,
throught provider1 and provider2 at the same time (its not link load
balance; its a redundant path). The rules for 'provider1' are simple, as
provider1 is my default route; my problem is how to match the traffic to
use the secondary routing table when the internal server replies. Giving
some names:

firewall/router box:
provider1 / eth1 / internet address 1.2.3.4
provider2 / eth2 / internet address 2.3.4.5
localnet / eth3 / local address 10.0.0.1
-
internal server:
server1 / local address 10.0.0.2
--
provider1 rules (as usual):

# established return
iptables -A FORWARD -i eth1 -m state --state ESTABLISHED,RELATED -j ACCEPT
# routing, forwarding
iptables -t nat -A PREROUTING -i eth1 -p tcp -d 1.2.3.4 --dport 23 -j DNAT
--to 10.0.0.2
iptables -A FORWARD -i eth1 -p tcp -d 10.0.0.2 --dport 23 -m state --state
NEW -j ACCEPT
# source nat
iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to-source 1.2.3.4

And now: how do I mangle, this same scenario, to work with provider2 ? I
understand that the FORWARD, PREROUTING and POSTROUTING rules are needed
for provider2 as well.. but how do I arrange the mangle table to match
server1's reply, and send it out using the secondary routing table, only if
the connection came in through provider2 ?

Thanks for you time !


--
Thiago



