From: "calvin" <calvinproject@ihug.com.au>
Subject: silly question, how to block all outgoing traffic?
Date: Thu, 5 Jun 2003 18:27:32 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001e01c32b3c$4f98c530$010aa8c0@toowoomba>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Dear all,

Sorry about my silly question here but I just can't figure out why it
doesn;t work.

I have a net with 4 pcs connect with each other. 2 gateways and 2 clients.

I try to setup some very simple rule on one of the gateway machines and
somehow i can;t get it works. My network setup is like that.

C1 (137.112.220.166)
 |
 |   (137.112.220.165 = eth0)
G1
 ||  (192.168.10.2 = eth1)
 ||
 ||  (192.168.10.1 = eth1)
G2
  |  (137.111.220.150 = eth0)
  |
C2 (137.111.220.156)

at the moment i jsut try to BLOCK all the outgoing traffic from C1 to
leaving G1's eth1. I add rules in G1 iptables ,however I can;t get it work.
i jsut try with ping, I try with few different rules, it still allow the
outgoing traffic fmor C1.

I try like:
at G1 iptables:
case1:    iptables -A output -j DROP

case2:   iptables -A output -s 137.112.220.165 -j DROP

case3:   iptables -A input -i 137.112.220.165 -s 137.112.220.165 -j DROP

case4: iptables -A output -s ! 137.112.220.165 -j ACCEPT

Maybe iget confuse about the chain. May I ask, when we add the rules to
iptables of a gateway machine, like G1 here, the rules are applied to eth0
or eth1?
when rules add to OUTPUT, that is refer to "output form eth0 to internat
network" or "output  from eth1 to public network"?

Thanks very much for your advice


