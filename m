From: Juan Manuel Tato <madness@adinet.com.uy>
Subject: whats wrong???
Date: Tue, 28 Jun 2005 13:40:15 -0300
Message-ID: <42C17D6F.70709@adinet.com.uy>
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

hi, i'm configuring a firewall, and i need some port forwarding
to ip 192.168.100.1 from my public ip.
but isn't working....
where come the output of the chains

fw-new:~# iptables -L -n
Chain INPUT (policy ACCEPT)
target     prot opt source               destination
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0
ACCEPT     all  --  192.168.100.1        0.0.0.0/0
ACCEPT     all  --  192.168.100.2        0.0.0.0/0
ACCEPT     all  --  192.168.100.3        0.0.0.0/0
ACCEPT     all  --  192.168.100.4        0.0.0.0/0
ACCEPT     all  --  192.168.100.5        0.0.0.0/0
ACCEPT     all  --  192.168.100.6        0.0.0.0/0
ACCEPT     all  --  192.168.100.7        0.0.0.0/0
ACCEPT     all  --  192.168.100.8        0.0.0.0/0
ACCEPT     all  --  192.168.100.9        0.0.0.0/0

badflags   tcp  --  0.0.0.0/0            0.0.0.0/0           tcp 
flags:0x3F/0x29
badflags   tcp  --  0.0.0.0/0            0.0.0.0/0           tcp 
flags:0x3F/0x3F
badflags   tcp  --  0.0.0.0/0            0.0.0.0/0           tcp 
flags:0x3F/0x37
badflags   tcp  --  0.0.0.0/0            0.0.0.0/0           tcp 
flags:0x3F/0x00
badflags   tcp  --  0.0.0.0/0            0.0.0.0/0           tcp 
flags:0x06/0x06
badflags   tcp  --  0.0.0.0/0            0.0.0.0/0           tcp 
flags:0x03/0x03
ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0           icmp type 0
ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0           icmp type 3
ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0           icmp type 11
ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0           icmp type 8 
limit: avg 1/sec burst 5
firewall   icmp --  0.0.0.0/0            0.0.0.0/0
ACCEPT     tcp  --  192.168.100.0/24     0.0.0.0/0           tcp dpt:22
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:80
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:80
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:25
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:25
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:110
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:110
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:143
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:143
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:53
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:53
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state 
RELATED,ESTABLISHED
silent     udp  --  0.0.0.0/0            0.0.0.0/0           udp spt:137 
dpt:137
dropwall   all  --  0.0.0.0/0            0.0.0.0/0

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination
DROP       all  --  0.0.0.0/0            0.0.0.0/0           state 
INVALID,NEW
ACCEPT     tcp  --  0.0.0.0/0            192.168.100.1       tcp dpt:80
ACCEPT     udp  --  0.0.0.0/0            192.168.100.1       udp dpt:80
ACCEPT     tcp  --  0.0.0.0/0            192.168.100.1       tcp dpt:25
ACCEPT     udp  --  0.0.0.0/0            192.168.100.1       udp dpt:25

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

Chain badflags (6 references)
target     prot opt source               destination
LOG        all  --  0.0.0.0/0            0.0.0.0/0           limit: avg 
15/min burst 5 LOG flags 0 level 4 prefix `Badflags:'
DROP       all  --  0.0.0.0/0            0.0.0.0/0

Chain dropwall (1 references)
target     prot opt source               destination
LOG        all  --  0.0.0.0/0            0.0.0.0/0           limit: avg 
15/min burst 5 LOG flags 0 level 4 prefix `Dropwall:'
DROP       all  --  0.0.0.0/0            0.0.0.0/0

Chain firewall (1 references)
target     prot opt source               destination
LOG        all  --  0.0.0.0/0            0.0.0.0/0           limit: avg 
15/min burst 5 LOG flags 0 level 4 prefix `Firewall:'
DROP       all  --  0.0.0.0/0            0.0.0.0/0

Chain silent (1 references)
target     prot opt source               destination
DROP       all  --  0.0.0.0/0            0.0.0.0/0

