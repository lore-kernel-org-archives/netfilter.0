From: Nils Ohlmeier <lists@ohlmeier.de>
Subject: Try to NAT a RTP stream
Date: Sun, 27 Apr 2003 08:24:31 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304270824.31892.lists@ohlmeier.de>
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

Hello,

i try to NAT RTP streams with my own application (i do not use iptables to 
insert the rules -> should i go to netfilter-devel?).

Scenario:
192.168.0.114 <-----> 192.168.0.2
                      Netfilter NAT
                     217.224.223.167 <--------------> 195.37.77.110

The result is that packets go from private to public but not vice versa. And 
the ruleset looks like this (empty chains omitted, ruleset is only for 
debuging, masquerade rule is for keeping my existing connections):

Chain FORWARD (policy ACCEPT 237 packets, 47356 bytes)
 pkts bytes target     prot opt in     out     source               
destination
    0     0 ACCEPT     udp  --  *      *       195.37.77.110        
192.168.0.114      udp spts:18554:18555 dpts:8766:8767
  399 79648 ACCEPT     udp  --  *      *       192.168.0.114        
195.37.77.110      udp spts:8766:8767 dpts:18554:18555

Chain PREROUTING (policy ACCEPT 3481 packets, 552K bytes)
 pkts bytes target     prot opt in     out     source               
destination
    0     0 DNAT       udp  --  *      *       195.37.77.110        
217.224.223.167    udp spts:18554:18555 dpts:32790:32791 
to:192.168.0.114:8766-8767

Chain POSTROUTING (policy ACCEPT 660 packets, 52480 bytes)
 pkts bytes target     prot opt in     out     source               
destination
    0     0 SNAT       udp  --  *      *       192.168.0.114        
195.37.77.110      udp spts:8766:8767 dpts:18554:18555 
to:217.224.223.167:32790-32791
    9  1835 MASQUERADE  all  --  *      *       192.168.0.0/23       0.0.0.0/0

What i do not understand is why the packets from internal hit the rule in 
FORWARD but do not hit the same rule in POSTROUTING.
The second strange thing is that packets come in on the external interface 
(observed with ngrep) but to not hit the PREROUTING rule.
I fear i missed something obvious :-(

Any help/ideas appreciated.

Greetings
  Nils Ohlmeier

