From: Mattes Opel <mattes.opel@web.de>
Subject: Case concerning iptables filtering traffic from the internet in a
 NATed scenario
Date: Tue, 14 Mar 2006 16:48:05 +0100
Message-ID: <4416E5B5.3060004@web.de>
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

Hello everybody,

I'm new to this list, so I'm hoping not to break with any rules.

I've got a case concerning iptables. Please excuse this long posting.

Before explaining the scenario, here are my questions:
1) How do restrict internetworking traffic, which is originated by 
/destinated to the internet to a machine. Please read on, because it's 
sounds simple but is something special for me.

The main problem is, that I can access the hosts only remote. A mistake 
would hurt very much.

The Scenario is as follows:

a) I've got a host running iptables, which offers different services to 
the local subnet. The subnet is private, so it's addressed by a stack of 
192.* IP-Numbers.

b) Machine a) needs internet access for e.g. retrieving updates.

c) For administration tasks the machine described by a) is accessible 
from the internet. The internet firewall does PAT/NAT or something 
similar, which means that a certain port on the external router 
interface is forwarded to a certain TCP-Port/IP-Address combination on 
the local subnet (192.*).

d) Only three hosts in the local subnet (192.*) should access the 
machine a). Access strategy for this hosts to the machine a) is all or 
nothing, which means that filtering occurs based on IP-addresses (not 
TCP-Ports) or possibly MAC-Addresses.

e) I need the strongest security but simplest configurable security, 
which can be setup by onboard-tools like iptables.

So where's the prob?

# set policies
iptables -P OUTPUT DROP
iptables -P INPUT DROP
iptables -P FORWARD DROP

# allow the local interface of machine a)
iptables -A INPUT -p All -s 192.168.1.20 -j ACCEPT
iptables -A OUTPUT -p All -d 192.168.1.20 -j ACCEPT

# restricting access to the three machines on local subnet
iptables -A INPUT -p All -s 192.168.1.10 -j ACCEPT
iptables -A INPUT -p All -s 192.168.1.11 -j ACCEPT
iptables -A INPUT -p All -s 192.168.1.12 -j ACCEPT

iptables -A OUTPUT -p All -d 192.168.1.10 -j ACCEPT
iptables -A OUTPUT -p All -d 192.168.1.11 -j ACCEPT
iptables -A OUTPUT -p All -d 192.168.1.12 -j ACCEPT

# access the internet-router
iptables -A INPUT -p All -s 192.168.1.1 -j ACCEPT
iptables -A OUTPUT -p All -d 192.168.1.1 -j ACCEPT

# Log the rest
iptables -A INPUT -p All -s 0.0.0.0/255.255.255.255 -j LOG
iptables -A output -p All -s 0.0.0.0/255.255.255.255 -j LOG

Here's the prob.

I can't access internet-hosts from machine a), because packets for this 
purpose are destinated to registered IP-Numbers. They are rejected by 
the output chain, because they doesn't contain the routers internal IP 
as destination. Access to the three hosts on local subnet works fine.

The question to answer for solving the problem:
How do I indentify a packets sourced by machine a) destinated to 
anywhere, which have to got through the router?

And the other way around:
How do I indentify packets destinated to machine a) sourced from 
anywhere, which have passed the router?

Further a possibility to filter those packets in a second stage by 
protocol or port would be fine?

AND don't forget the administrator's access:
How do I identify packets, which where forwarded by the router. See c) 
in the secanrio description.

Hope that somebody can help me. Thanks in advance.

Greetings from Hamburg,

Mattes

