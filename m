From: Paul Lambert <paul@digis.net>
Subject: mark causes high CPU/using tc in conjunction with NAT
Date: Sat, 22 May 2004 13:22:40 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40AFA880.60003@digis.net>
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

Using below configuration multiplied by 3000+ nodes to control bandwidth 
causes very high kernel cpu usage (99.5%) narrowed it down to the mangle 
table. Any ideas to do this more efficiently would be appreciated.

The mangle table entry (indicated by ***) is sucking all the cpu. I am 
running RH7.3 kernel  2.4.18-3 and iptables 1.2.5
This setup has worked well for more than 1000 devices but as the network 
has grown to 3000+ devices the CPU is not keeping up. I have thought to 
use IPMARK instead of MARK. Or, to possibly use CLASSIFY. Since this is 
hard to recreate in the lab I was looking for some experienced advice on 
the matter.

### root ###
tc qdisc add dev eth0 root handle 1: cbq bandwidth 100Mbit avpkt 1000 cell 8

tc qdisc add dev eth1 root handle 1: cbq bandwidth 100Mbit avpkt 1000 cell 8


### Classful qdisc upload/download rate for a group of IP address ###
tc class add dev eth0 parent 1:0 classid 1:11 cbq bandwidth 100Mbit rate 
100Mbit weight 54Kbit prio 8 allot 1514 cell 8 maxburst 20 av pkt 1000

tc qdisc add dev eth0 parent 1:11 tbf rate 2048Kbit buffer 10Kb/8 limit 
15Kb mtu 1500

tc class add dev eth1 parent 1:0 classid 1:11 cbq bandwidth 100Mbit rate 
100Mbit weight 54Kbit prio 8 allot 1514 cell 8 maxburst 20 av pkt 1000

tc qdisc add dev eth1 parent 1:11 tbf rate 2048Kbit buffer 10Kb/8 limit 
15Kb mtu 1500


### A single IP address and it's own upload/download rate ###
tc class add dev eth0 parent 1:11 classid 1:2115 cbq bandwidth 100Mbit 
rate 100Mbit weight 54Kbit prio 8 allot 1514 cell 8 maxburst 20 avpkt 1000

tc qdisc add dev eth0 parent 1:2115 tbf rate 2048Kbit buffer 10Kb/8 
limit 15Kb mtu 1500

*** eth0 is MASQUERADE'd so I mark the packet on eth1 ***
*** I have narrowed it down to this one entry sucking all the CPU ***
iptables -t mangle -A PREROUTING -s 10.10.6.20 -i eth1 -j MARK 
--set-mark 0x843

tc filter add dev eth0 parent 1:0 protocol ip prio 1 handle 2115 fw 
classid 1:2115

tc class add dev eth1 parent 1:11 classid 1:2115 cbq bandwidth 100Mbit 
rate 100Mbit weight 54Kbit prio 8 allot 1514 cell 8 maxburst 20 avpkt 1000

tc qdisc add dev eth1 parent 1:2115 tbf rate 2048Kbit buffer 10Kb/8 
limit 15Kb mtu 1500

tc filter add dev eth1 parent 1:0 protocol ip prio 1 u32 match ip dst 
10.10.6.20 flowid 1:2115





