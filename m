From: Sudhakar Chandra <thaths@openscroll.org>
Subject: Routing between two firewalls
Date: Wed, 23 Jun 2004 14:49:57 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40D94B3D.8050308@openscroll.org>
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

I am having some trouble routing some packets between two dual-homed 
machines both running iptables.

I have a setup that I assume should be pretty common.  I have a LAN 
(192.168.100.0/24) which has two gateways / firewalls on it.  Both the 
gateways are dual-homed.

My setup is something like so:

LAN ---> (192.168.100.1) Gateway 1 (isp1.global.ip) --->
LAN ---> (192.168.100.2) Gateway 2 (isp2.global.ip) --->

Gateway 1 routes through ISP1 and Gateway 2 through ISP2.  Some machines 
in my LAN have .1 set as the gateway and some have .2 as the gateway.

I have my mail server connected to one of the global IPs that ISP2 has 
given me.  Or in other words, mail server is on the same subnet as the 
external interface of Gateway 2.

As things are today, packets originating on machines having Gateway 1 as 
their default gateway traverse out through ISP1, the global internet, 
back through ISP2 into my global ISP2 subnet.  This is a waste of 
bandwidth as well as slow.

I want to set up a rule on Gateway 1 such that all packets destined to 
my mail server (actually, my entire ISP2 subnet) should be sent to 
Gateway 2 for routing.

I tried adding a static route on Gateway 1 to route all packets destined 
to the mail server to Gateway 2 like so:

route add -host mail.server.ip gw 192.168.100.2

After I set this up, I am able to traceroute to mail server (packets 
flow through Gateway 2).  But when I try connecting to port 25, nothing 
happens.

1. What is the fastest and easiest way to do what I want?
2. Should I be doing DNAT?
3. Should I be doing something using iptables AND routing?

Your help would be much appreciated.

Thaths
-- 
   "Trying is the first step towards failure." -- Homer J. Simpson
Slacker Without Borders                        http://openscroll.org/
Key fingerprint = 8A 84 2E 67 10 9A 64 03  24 38 B6 AB 1B 6E 8C E4

