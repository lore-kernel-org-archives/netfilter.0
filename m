From: richard hauswald <staenker@rhcs.de>
Subject: dhcp server is working but there are no rules allowing it using a
 drop policy
Date: Tue, 08 Mar 2005 12:40:46 +0100
Message-ID: <422D8F3E.9000806@rhcs.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hi all,
my problem is a verry strange one, so i think i did a configuration 
failure. But i can't find him.
i made a listung of my iptables rules using the -L parameter and finaly 
a tcpdump wich should show you, that dhcp is working - well i couldnt 
post hte windowsxp bubble wich says that i got a wunderfull wlan 
connection...

-------------------------------------

Antifreeze:~# date;iptables -L;date;iptables -t nat -L;date;iptables -t mangle -L;date;tcpdump -i eth0 udp
Mon Mar  7 14:50:57 CET 2005
Chain INPUT (policy DROP)
target     prot opt source               destination
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:64385 state NEW,ESTABLISHED

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy DROP)
target     prot opt source               destination
ACCEPT     tcp  --  anywhere             anywhere            tcp spt:64385 state ESTABLISHED
Mon Mar  7 14:50:57 CET 2005
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
Mon Mar  7 14:50:57 CET 2005
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination

Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
Mon Mar  7 14:50:57 CET 2005
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on eth0, link-type EN10MB (Ethernet), capture size 96 bytes
14:51:10.965603 IP 0.0.0.0.bootpc > 255.255.255.255.bootps: BOOTP/DHCP, Request from 00:0f:cb:ad:75:a8, length: 300
14:51:10.966600 IP Antifreeze.lan.bootps > 192.168.0.19.bootpc: BOOTP/DHCP, Reply, length: 300
14:51:10.975221 IP 0.0.0.0.bootpc > 255.255.255.255.bootps: BOOTP/DHCP, Request from 00:0f:cb:ad:75:a8, length: 322
14:51:10.978049 IP Antifreeze.lan.bootps > 192.168.0.19.bootpc: BOOTP/DHCP, Reply, length: 300

4 packets captured
4 packets received by filter
0 packets dropped by kernel
------------------------------------------------


Ok, i would be verry happy if anyone could help me blocking the dhcp server that i can trust iptables again. 
regards
richard hauswald



