From: "crv2" <crv2@tstd.pl>
Subject: 127.0.0.1 source flood and dhcpd DOS
Date: Sun, 22 Feb 2004 14:30:26 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002601c3f948$08ed3230$2d01a8c0@ad4gc1asnujhom>
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

hi,

Does someone else observe the problem with Blaster spoofed flood attack
affecting Dhcpd daemon?

The output from the Tcpdump -i eth1 -ne host 127.0.0.1 (eth1 - internal
interface):
18:18:48.933129 0:a:cd:1:b:39 0:10:15:34:23:34 0800 60: 127.0.0.1.80 >
10.0.143.221.1806: R 0:0(0) ack 357826561 win 0
18:18:48.943879 0:2:44:57:364 0:10:15:34:23:34 0800 60: 127.0.0.1.80 >
10.0.192.42.1689: R 0:0(0) ack 83165185 win 0
18:18:48.955866 0:a:cd:0:a7:7f 0:10:15:34:23:34 0800 60: 127.0.0.1.80 >
10.0.57.67.1197: R 0:0(0) ack 1552613377 win 0
18:18:48.956093 0:30:4f:20:e0:8b 0:10:15:34:23:34 0800 60: 127.0.0.1.80 >
10.0.56.108.1893: R 0:0(0) ack 952369153 win 0
18:18:48.956519 0:30:4f:26:c7:96 0:10:15:34:23:34 0800 60: 127.0.0.1.80 >
10.0.2.37.1812: R 0:0(0) ack 1434583041 win 0
18:18:48.956715 0:a:cd:1:b:39 0:10:15:34:23:34 0800 60: 127.0.0.1.80 >
10.0.209.93.1642: R 0:0(0) ack 992411649 win 0
18:18:48.963920 0:2:44:57:364 0:10:15:34:23:34 0800 60: 127.0.0.1.80 >
10.0.2.169.1524: R 0:0(0) ack 717750273 win 0

00:10:15:34:23:34 out server DHCPd mac address
flood is about 1200p/s and from 4 different MAC's

and another output (out client DHCP request with no response from out
server)
tcpdump -i eth1 -n udp port 67:

tcpdump: listening on eth1
18:38:34.071188 0.0.0.0.68 > 255.255.255.255.67:  xid:0x1e429414 secs:55030
file ""[|bootp]
18:38:35.702552 0.0.0.0.68 > 255.255.255.255.67:  xid:0x1c6f144e secs:56566
flags:0x8000 file ""[|bootp]
18:38:36.298190 0.0.0.0.68 > 255.255.255.255.67:  xid:0x4a34ea34 secs:57846
flags:0x8000 file ""[|bootp]
18:38:37.894439 0.0.0.0.68 > 255.255.255.255.67:  xid:0xa41add0d secs:57846
flags:0x8000 file ""[|bootp]
18:38:40.527775 0.0.0.0.68 > 255.255.255.255.67:  xid:0xb20b790e secs:59382
flags:0x8000 file ""[|bootp]

It seems that it is affecting only dhcpd daemon, on different version of
kernel and iptables.
iptables v1.2.9 and iptables v1.2.8
kernel 2.4.23 and 2.4.24
Internet Software Consortium DHCP Server V3.0pl2

And why iptables -I FORWARD -s 127.0.0.1 -i eth1 -j DROP and iptables -I
INPUT -s 127.0.0.1 -i eth1 -j DROP
does not blocking the traffic?

Only solution is: iptables -I PREROUTING -t mangle -s 127.0.0.1 -i eth1 -j
DROP
After that Dhcpd starts working normaly again (And we are not 100% surre of
that)

ifconfig lo down or ifconfig lo 192.168.1.1/32 does not work

Any idea?



