From: Franco Gasperino <franco@gasperino.org>
Subject: 3rd NIC & SNAT Question
Date: Thu, 1 May 2003 11:13:36 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200305011113.36865.franco@gasperino.org>
Reply-To: franco@gasperino.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org


Hello list,

  I'm having a bit of a problem with netfilter/iptables on debian linux. I 
have a system providing traditional NAT to a local office. We have also added 
a 3rd NIC to the system to provide colocation-style access using public, 
routable addressing.

  While the setup works, it appears the SNAT is modifying all packets going 
out the eth0 interface, regardless of the source. This is causing havoc with 
VPN clients that reside on colocation addressing on eth2. I show all the 
connections in the /proc/net/ip_conntrack file. How can I force the last SNAT 
rule below to only nat the 10.0.0.0/24 net and not touch the 100.100.101.0/24 
net?

Public External Net: 100.100.100.0/30
Public External Address: 100.100.100.2
Public External Interface: eth0

Local Private Net: 10.0.0.0/24
Local Private Address: 10.0.0.1
Local Private Interface: eth1

Local Public Net: 100.100.101.0/24
Local Public Address: 100.100.101.1
Local Public Interface: eth2

iptables -A INPUT -j ACCEPT
iptables -A OUTPUT -j ACCEPT
iptables -A FORWARD -j ACCEPT

iptables -t nat -A POSTROUTING -s 10.0.0.0/24 -j SNAT --to-source 
100.100.100.2


Thanks for your input.

-- 

Franco

