From: MY <mikhail@hostex.no>
Subject: multiple subnets on the same physical interface
Date: Sat, 29 Jul 2006 03:02:04 +0200
Message-ID: <44CAB38C.3030305@hostex.no>
Reply-To: mikhail@hostex.no
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

Hello list,

I have a weird problem - my setup looks like this:
Internet -- FW eth0 / eth1 -- switch

On eth0 I have 14 IP addresses from ISP, and on eth1 I have few C class 
networks, which are also public IPs and should be accessible from the 
Internet as with usual router.
There are 7 subnets on eth1, and even if I install quad card with 4 
physical interfaces in that machine, there are no more slots to get more 
interfaces.
And there will be 2-3 more subnets in the future.

Thing is that ip routing works fine (this is a cluster with keepalived 
setup) when there is no iptables on it.
As soon as I enable stateful firewall with iptables with Any - Any - Any 
- Accept rule with INPUT/OUTPUT/FORWARD policies with DROP flag, 
communication goes to some subnets, and fails for others.
Seems like packets are leaving from 1 subnet I am on, and nothing comes 
in return, and I don't see any drops in logs either.

When I tested it, I manually stopped keepalived on first node (it has no 
iptables on it at this point), switched over to secondary node without 
iptables enabled, then enabled firewall on second box.
If I use stateless firewall - all is working fine.
However, as soon as I add following lines, I am starting to get problems 
to few boxes. What's weird is that not all of them are having problems, 
just a few - while all of them are standing on the same subnet (both 
problemfree and problematic machines). I am trying to narrow source of 
the problem, but so far I am out of ideas what can be wrong. Somehow it 
seems to be related to states in iptables.
We're running Linux Gentoo 2.6.17.4 kernel on both routers/firewalls, 
not using subinterfaces but rather iproute2 package.

Here are parameters we have:

$IPTABLES -A INPUT   -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A OUTPUT  -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

echo "Rule 0 (global)"
#
#
#
$IPTABLES -N RULE_0
$IPTABLES -A OUTPUT  -m state --state NEW  -j RULE_0
$IPTABLES -A INPUT  -m state --state NEW  -j RULE_0
$IPTABLES -A FORWARD  -m state --state NEW  -j RULE_0
$IPTABLES -A RULE_0  -j LOG  --log-level debug --log-prefix "RULE 0 -- 
ACCEPT " --log-tcp-sequence  --log-tcp-options  --log-ip-opti
ons
$IPTABLES -A RULE_0  -j ACCEPT
#
#
echo 1 > /proc/sys/net/ipv4/ip_forward
echo 0 > /proc/sys/net/ipv4/conf/all/accept_source_route
echo 0 > /proc/sys/net/ipv4/conf/all/accept_redirects
echo 0 > /proc/sys/net/ipv4/icmp_echo_ignore_all
echo 1 > /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses
echo 30 > /proc/sys/net/ipv4/tcp_fin_timeout
echo 1800 > /proc/sys/net/ipv4/tcp_keepalive_intvl
echo 0 > /proc/sys/net/ipv4/tcp_ecn
echo 1 > /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_be_liberal

If anyone have any ideas what might be wrong, I'd appreciate it.
Thanks.

M.

