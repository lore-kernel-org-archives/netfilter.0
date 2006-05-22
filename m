From: tom@tomdeb.org
Subject: tunnel, bridge and iptables on linux 2.6
Date: Mon, 22 May 2006 09:49:37 +0100
Message-ID: <20060522084937.GA16002@snoopy>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

We ve got an IPSEC / GRE tunnel on one of our perimeter firewall and
it eventuallly worked fine after quite a lot of trial and error.

The tunnel (tunnel0) is on top of a bridge (br0). which groups internal and external
interfaces eth0 and eth1.

When trying to adapt the firewall to the new tunnel, I noticed some
inconsistencies in the packet sequencing. When I ping through the VPN,
here is how iptables sees the traffic:

| IN=br0 OUT=br0 PHYSIN=eth0 PHYSOUT=eth1 SRC=10.35.8.46 DST=10.10.30.251 LEN=84 TOS=0x00 PREC=0x00 TTL=61 ID=1 DF PROTO=ICMP TYPE=8 CODE=0 ID=61218 SEQ=1
| IN=br0 OUT=tunnel0 PHYSIN=eth1 SRC=10.10.30.251 DST=10.35.8.46 LEN=84 TOS=0x00 PREC=0x00 TTL=62 ID=26665 PROTO=ICMP TYPE=0 CODE=0 ID=61218 SEQ=1
 
This echo request is sent through br0 whereas the echo reply is received
through tunnel0.

tcpdump sees traffic on both virtual interfaces:
 
on tunnel0:
| listening on tunnel0, link-type LINUX_SLL (Linux cooked), capture size 96 bytes
| 14:20:30.077337 IP 10.10.30.251 > 10.35.8.46: icmp 64: echo request seq 0
| 14:20:30.092054 IP 10.35.8.46 > 10.10.30.251: icmp 64: echo reply seq 0
| 14:20:31.081619 IP 10.10.30.251 > 10.35.8.46: icmp 64: echo request seq 1
| 14:20:31.102690 IP 10.35.8.46 > 10.10.30.251: icmp 64: echo reply seq 1
| 14:20:32.085657 IP 10.10.30.251 > 10.35.8.46: icmp 64: echo request seq 2
| 14:20:32.303333 IP 10.35.8.46 > 10.10.30.251: icmp 64: echo reply seq 2
| 14:20:33.089717 IP 10.10.30.251 > 10.35.8.46: icmp 64: echo request seq 3
| 14:20:33.104178 IP 10.35.8.46 > 10.10.30.251: icmp 64: echo reply seq 3
| 14:20:34.095934 IP 10.10.30.251 > 10.35.8.46: icmp 64: echo request seq 4
| 14:20:34.110300 IP 10.35.8.46 > 10.10.30.251: icmp 64: echo reply seq 4
| 14:20:35.097811 IP 10.10.30.251 > 10.35.8.46: icmp 64: echo request seq 5
| 14:20:35.112194 IP 10.35.8.46 > 10.10.30.251: icmp 64: echo reply seq 5
 
on br0 :
| listening on br0, link-type EN10MB (Ethernet), capture size 96 bytes
| 14:20:46.331785 IP 10.10.30.251 > 10.35.8.46: icmp 64: echo request seq 0
| 14:20:46.346100 IP 10.35.8.46 > 10.10.30.251: icmp 64: echo reply seq 0
| 14:20:47.341446 IP 10.10.30.251 > 10.35.8.46: icmp 64: echo request seq 1
| 14:20:47.355848 IP 10.35.8.46 > 10.10.30.251: icmp 64: echo reply seq 1
| 14:20:48.342419 IP 10.10.30.251 > 10.35.8.46: icmp 64: echo request seq 2
| 14:20:48.357181 IP 10.35.8.46 > 10.10.30.251: icmp 64: echo reply seq 2
| 14:20:49.346497 IP 10.10.30.251 > 10.35.8.46: icmp 64: echo request seq 3
| 14:20:49.361480 IP 10.35.8.46 > 10.10.30.251: icmp 64: echo reply seq 3

This is entirely reproducible and it prevents me from configuring my
firewall accordingly. For eample, I can't drop INVALID packets as the
replies are not considered as part of any tracked connections for
iptables.

Any help or idea would be greatly appreciated.

Tom
tom@tomdeb.org

PS: I am using Openswan 2.4.4 on linux 2.6.9-34.EL from CentOS 4.3

