From: Marek Zachara <marek.zachara@conexe.pl>
Subject: NAT/POSTROUTING rules doesn't match packets
Date: Sat, 1 Oct 2005 18:06:51 +0200
Message-ID: <200510011806.52191.marek.zachara@conexe.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

Hi,

I have been having problems with this for some time now. Some packets are not 
processed correctly by iptables. This applies only to POSTROUTING chain in 
NAT table. 

I have an internal network addressed 10.0.0.0/24
Initially, i wanted all packets that go out of my network to a remote port 
4569 to be SNAT-ed to address 1.2.3.4. But when i set up such rule for 
iptables:

$IPT -t nat -A POSTROUTING -p udp --destination-port 4569 -o eth1 -j SNAT 
--to-source 1.2.3.4

when i run tcpdump, i noticed on my external interface (eth1) the packets had 
source address of originating machine (10.0.0.7)

so i did some tests and found out that rules in POSTROUTING chain doesn't 
always work as expected. In the following experiment, i put exactly same 
rules in NAT/PREROUTING,NAT/POSTROUTING,MANGLE/PREROUTING and 
MANGLE/POSTROUTING:

$IPT -t mangle -A PREROUTING -p udp --destination-port 4569 -j LOG
$IPT -t mangle -A POSTROUTING -p udp --destination-port 4569 -j LOG
$IPT -t nat -A PREROUTING  -p udp -m udp --destination-port 4569 -j LOG
$IPT -t nat -A POSTROUTING  -p udp -m udp --destination-port 4569 -j LOG

apparently all the rules EXCEPT the one in the NAT/POSTROUTING chain seem to 
work. Below is the number of packets that matched these rules. As you can 
see, the lat chain has counter 0 and the other three were matched by 23 
packets. 

I really have no clue on what could be the reason for this, maybe its a bug in 
netfilter code? I will appreciate any help.

Marek

P.S. Iptables 1.3.3, kernel 2.6.15 (both compiled from sources)



irongate:~# iptables -t mangle -nvL
Chain PREROUTING (policy ACCEPT 1681K packets, 495M bytes)
 pkts bytes target     prot opt in     out     source               
destination
   23  1134 LOG        udp  --  *      *       0.0.0.0/0            0.0.0.0/0           
udp dpt:4569 LOG flags 0 level 4

Chain POSTROUTING (policy ACCEPT 1630K packets, 478M bytes)
 pkts bytes target     prot opt in     out     source               
destination
   23  1134 LOG        udp  --  *      *       0.0.0.0/0            0.0.0.0/0           
udp dpt:4569 LOG flags 0 level 4


irongate:~# iptables -t nat -nvL
Chain PREROUTING (policy ACCEPT 223K packets, 23M bytes)
 pkts bytes target     prot opt in     out     source               
destination
    0     0 LOG        udp  --  *      *       0.0.0.0/0            0.0.0.0/0           
udp dpt:4569 LOG flags 0 level 4

Chain POSTROUTING (policy ACCEPT 263 packets, 16175 bytes)
 pkts bytes target     prot opt in     out     source               
destination
    0     0 LOG        udp  --  *      *       0.0.0.0/0            0.0.0.0/0           
udp dpt:4569 LOG flags 0 level 4
  116  6546 SNAT       all  --  *      eth1    0.0.0.0/0            0.0.0.0/0           
to:192.168.100.3




