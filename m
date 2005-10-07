From: Gregory G Carter <gcarter@aesgi.com>
Subject: Port Forwarding Questions
Date: Fri, 07 Oct 2005 10:52:32 -0500
Message-ID: <434699C0.5070508@aesgi.com>
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

Hello,  I have a number of questions:

A description of my setup:

3 port router, 2 ports are to seperate ISP's, one port is to an internal 
network.

I am using both connections as redundant connections for advertising 
services such as mail, web, etc.

Question 1:  If I port forward say 25 from 2 interfaces from the outside 
ISP's, to a single IP address, should that work?

Question 2: If I do port forwarding does that invalidate any ip route 
statements?  I am using ip route to insure traffic that comes in one 
interface, leaves the same way  comming in.

It seems to stop working when I add port forwarding.

Question 3: I am using Masquerade to rewrite the outgoing packets, 
should I be using SNAT instead and WHY?  The maill server currently 
shares the same subnet as my workstations so it seemed like the best 
thing to do is just MASQ everything.

If anyone has a better solution, I would be very much interested. Thanks.

Snapshot of my setup:

### Routing Policy

# 67=ISP one (eth0)
# 68=ISP two (eth1)
# 10=internal net (eth3)

ip route add 67.xx.xx.xx dev eth0 src 67.xx.xx.xx table 1
ip route add default via 67.xx.xx.xx table 1

ip route add 68.xx.xx.xx dev eth1 src 68.xx.xx.xx table 2
ip route add default via 68.xx.xx.xx table 2

ip route add 67.xx.xx.xx dev eth0 src 67.xx.xx.xx
ip route add 68.xx.xx.xx dev eth1 src 68.xx.xx.xx

ip route add 67.xx.xx.xx dev eth0 table 1
ip route add 127.0.0.0/8 dev lo table 1

ip route add 68.xx.xx.xx dev eth1 table 2
ip route add 127.0.0.0/8 dev lo table 2

ip route add default via 67.xx.xx.xx

ip rule add from 67.xx.xx.xx table 1
ip rule add from 68.xx.xx.xx table 2

ip route flush cache


#
# My Proposed Filter Policies
#
#
# Reset the IPTABLES kernel data sets
#
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT

# Reset Nat

iptables -t nat -P PREROUTING ACCEPT
iptables -t nat -P POSTROUTING ACCEPT
iptables -t nat -P OUTPUT ACCEPT

# Reset the mangle tables
iptables -t mangle -P PREROUTING ACCEPT
iptables -t mangle -P OUTPUT ACCEPT

# Reset the Rulesets in NETFILTER

iptables -F
iptables -t nat -F
iptables -t mangle -F

# Erase all the chains
iptables -X
iptables -t nat -X
iptables -t mangle -X

# Mail server
iptables -A PREROUTING -t nat -p tcp -d 67.xx.xx.xx --dport 25 -j DNAT 
--to 10.xx.xx.xx:25
iptables -A PREROUTING -t nat -p tcp -d 68.xx.xx.xx --dport 25 -j DNAT 
--to 10.xx.xx.xx:25

iptables -A FORWARD -i eth0 -o eth3 -p tcp --dport 25 -m state --state 
NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i eth1 -o eth3 -p tcp --dport 25 -m state --state 
NEW,ESTABLISHED,RELATED -j ACCEPT

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE


