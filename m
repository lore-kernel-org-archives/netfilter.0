From: Duncan Grove <duncan.grove@dsto.defence.gov.au>
Subject: Problem with DNAT --to-destination of --icmp-type router-solicitation
 packets ?
Date: Fri, 28 Mar 2003 12:40:30 +1030
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E83AF16.2030406@dsto.defence.gov.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

I'm having getting iptables/netfilter to forward on icmp 
router-solicitation requests, and wonder if anyone could offer any 
suggestions. Here's the situation (in case I shouldn't be solving my 
problem this way!):

host1 -------> host2 --------> host3 ---------> rest of he world
client    ppp  gateway     eth     router

Hosts 1, 2 and 3 are all using addresses on the same subnet. Host1 is 
using host2 as it's default route, and host2 is configured to do IP 
forwarding. The pppd on the gateway machine has set proxyarp so that 
host3 can also see (via unicast) host1. Now, host1 is trying to discover 
the router host3 by sending out a icmp router-discovery request (for 
MobileIP; addressed to 255.255.255.255). This message gets sent down the 
ppp link to host2, which doesn't send the request further since it came 
from a point-to-point link. I want to use iptables to forward the 
request on from host2 to host3 (which will then unicast a reply back to 
host1 with a router-advertisement message).

Now, I managed to get iptables/netfilter to do this with icmp ping 
packets designed to look almost like router-discovery packets (i.e. with 
ping -t 1 -b 255.255.255.255) like this:

iptables -t mangle -A PREROUTING --protocol icmp -j TTL --ttl-inc 1
iptables -t nat -A PREROUTING --protocol icmp -j DNAT --to-destination 
ipaddr.of.host3

The first rule bumps the TTL by 1 to give the message the legs to make 
it to host3 from host1, while the second forwards the message on to 
host3. The result of this is that the broadcast ping packet (with 
initial TTL of 1) came into host2, got sent to host3 (you can see this 
tpcdump or ping -R) and returned to host1. Unfortunately, this doesn't 
seem to work with router solicitation messages. For some reason, only 
the first rule has any effect (i.e. its TTL does indeed get increased), 
but the DNAT redirection has no effect (no forwarded packets go out over 
the ethernet). Looking at the the iptables -t mangle -L -v and -t nat -L 
-v output confirms this: for --icmp-type router-solicitation packets the 
pkts column increases as packets are matched on the TTL target, but does 
not increase to indicate packets matched on the DNAT target.

Does anyone have any ideas as to what's happening? Is this a bug or am I 
missing something?

Thanks
Duncan



