From: Magnus Solvang <magnus@solvang.net>
Subject: ping from 'wrong' ip-address
Date: Wed, 26 Feb 2003 15:13:51 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030226141351.GA23528@first.knowledge.no>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

A 1/8 subnet (32-64). Pinging had suddenly changed from using the correct
ip-address for the external interface to use the ip-address for the first
alias for this interface (eth1:0). I can't ping outside anymore.
The ip-address for eth1:0 was previously a machine on the network, that
now has been moved to a reserved ip-address on the LAN.

Could this be a ARP-cache-problem?

eth1      Link encap:Ethernet  HWaddr 00:50:DA:3F:BC:7C
          inet addr:xxx.xx.xx.49  Bcast:xxx.xx.xx.63  Mask:255.255.255.224
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:88183 errors:0 dropped:0 overruns:0 frame:0
          TX packets:107259 errors:0 dropped:0 overruns:0 carrier:0
          collisions:436 txqueuelen:100
          RX bytes:47743572 (45.5 Mb)  TX bytes:67780367 (64.6 Mb)
          Interrupt:10 Base address:0xe800


# ping www.vg.no -c 1 -I eth1
PING www.vg.no (193.69.165.20) from xxx.xx.xx.34 eth1: 56(84) bytes of data.
From 193.69.71.34 icmp_seq=1 Destination Port Unreachable
From 193.69.71.34 icmp_seq=1 Destination Port Unreachable
From 193.69.71.34 icmp_seq=1 Destination Port Unreachable
From 193.69.71.34 icmp_seq=1 Destination Port Unreachable
From 193.69.71.34 icmp_seq=1 Destination Port Unreachable
From 193.69.71.34 icmp_seq=1 Destination Port Unreachable
ping: sendmsg: Operation not permitted

--- www.vg.no ping statistics ---
1 packets transmitted, 0 received, +6 errors, 100% loss, time 96ms

iptables logs many lines like this:

Feb 26 15:07:59 firewall kernel: mangle OUTPUT:IN= OUT=eth1 SRC=xxx.xx.xx.34 DST=193.69.165.20 LEN=84 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=ICMP TYPE=8 CODE=0 ID=21021 SEQ=256
Feb 26 15:07:59 firewall kernel: DROP: IN= OUT=eth1 SRC=xxx.xx.xx.34 DST=193.69.165.20 LEN=84 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=ICMP TYPE=8 CODE=0 ID=21021 SEQ=256

Anyone familiar with this problem?

- M

