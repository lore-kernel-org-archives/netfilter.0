From: "Manikandan" <mani@manikandan.org>
Subject: tcpdump shows lots of UDP traffic and ifconfig reports error on interface.
Date: Mon, 21 Jun 2004 11:58:49 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <GHEILNONPACCGBGKBEKKEEOFCGAA.mani@manikandan.org>
Reply-To: <manikandan@manikandan.org>
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
To: Netfilter <netfilter@lists.netfilter.org>

Hi friends,

        I am running RedHat linux 9 with iptables 1.2.7a. This box acts as a
gateway/firewall for my network. I am seeing lots of packets getting dropped
as well as ifconfig reports error.

[root@javagreen RPMS]# tail /var/log/messages/

Jun 21 11:50:50 javagreen kernel: IN=eth0 OUT=
MAC=00:09:6b:19:b4:24:00:0e:83:f6:19:9f:08:00 SRC=64.0.96.12
DST=202.138.202.218 LEN=84 TOS=0x00 PREC=0x00 TTL=45 ID=17638 PROTO=ICMP
TYPE=8 CODE=0 ID=20225 SEQ=61833
Jun 21 11:50:50 javagreen kernel: IN=eth0 OUT=
MAC=00:09:6b:19:b4:24:00:0e:83:f6:19:9f:08:00 SRC=64.0.96.12
DST=202.138.202.218 LEN=84 TOS=0x00 PREC=0x00 TTL=45 ID=17638 PROTO=ICMP
TYPE=8 CODE=0 ID=20225 SEQ=61833
Jun 21 11:50:50 javagreen kernel: IN=eth0 OUT=
MAC=00:09:6b:19:b4:24:00:0e:83:f6:19:9f:08:00 SRC=210.224.186.4
DST=202.138.202.218 LEN=84 TOS=0x00 PREC=0x00 TTL=42 ID=0 DF PROTO=ICMP
TYPE=8 CODE=0 ID=52234 SEQ=19095
Jun 21 11:50:50 javagreen kernel: IN=eth0 OUT=
MAC=00:09:6b:19:b4:24:00:0e:83:f6:19:9f:08:00 SRC=210.224.186.4
DST=202.138.202.218 LEN=84 TOS=0x00 PREC=0x00 TTL=42 ID=0 DF PROTO=ICMP
TYPE=8 CODE=0 ID=52234 SEQ=19095
Jun 21 11:50:54 javagreen named[3251]: client 10.35.57.153#1366: query:
www.usagreetings.com IN A
Jun 21 11:50:54 javagreen named[3251]: client 10.35.57.153#1366: query:
www.usagreetings.com IN A
Jun 21 11:51:00 javagreen kernel: IN=eth0 OUT=
MAC=00:09:6b:19:b4:24:00:0e:83:f6:19:9f:08:00 SRC=210.224.186.4
DST=202.138.202.218 LEN=84 TOS=0x00 PREC=0x00 TTL=42 ID=0 DF PROTO=ICMP
TYPE=8 CODE=0 ID=52234 SEQ=57756
Jun 21 11:51:00 javagreen kernel: IN=eth0 OUT=
MAC=00:09:6b:19:b4:24:00:0e:83:f6:19:9f:08:00 SRC=210.224.186.4
DST=202.138.202.218 LEN=84 TOS=0x00 PREC=0x00 TTL=42 ID=0 DF PROTO=ICMP
TYPE=8 CODE=0 ID=52234 SEQ=57756
Jun 21 11:51:00 javagreen kernel: IN=eth0 OUT=
MAC=00:09:6b:19:b4:24:00:0e:83:f6:19:9f:08:00 SRC=64.0.96.12
DST=202.138.202.218 LEN=84 TOS=0x00 PREC=0x00 TTL=45 ID=24066 PROTO=ICMP
TYPE=8 CODE=0 ID=20225 SEQ=33935
Jun 21 11:51:00 javagreen kernel: IN=eth0 OUT=
MAC=00:09:6b:19:b4:24:00:0e:83:f6:19:9f:08:00 SRC=64.0.96.12
DST=202.138.202.218 LEN=84 TOS=0x00 PREC=0x00 TTL=45 ID=24066 PROTO=ICMP
TYPE=8 CODE=0 ID=20225 SEQ=33935

[root@javagreen RPMS]# ifconfig -a
eth0      Link encap:Ethernet  HWaddr 00:09:6B:19:B4:24
          inet addr:202.138.202.218  Bcast:202.138.202.223
Mask:255.255.255.248
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:436956 errors:0 dropped:0 overruns:0 frame:0
          TX packets:347529 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:100
          RX bytes:293873940 (280.2 Mb)  TX bytes:41608963 (39.6 Mb)
          Interrupt:9 Base address:0x2000 Memory:c0100000-c0100038

eth1      Link encap:Ethernet  HWaddr 00:90:27:99:0E:3C
          inet addr:10.35.57.6  Bcast:10.35.57.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:475459 errors:3300 dropped:0 overruns:0 frame:3300
          TX packets:518784 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:100
          RX bytes:53916734 (51.4 Mb)  TX bytes:311614338 (297.1 Mb)
          Interrupt:11 Base address:0x2040 Memory:c0101000-c0101038

lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:4990 errors:0 dropped:0 overruns:0 frame:0
          TX packets:4990 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:415424 (405.6 Kb)  TX bytes:415424 (405.6 Kb)

Also, tcpdump shows lots of UDP traffic consistently in eth1 interface
between one of my LAN host to random internet IPs as shown,

[root@javagreen RPMS]# tcpdump -i eth1 host 10.35.57.21
tcpdump: listening on eth1
11:55:50.805682 10.35.57.21.1038 > 224.2.208.147.21732: udp 5499 (frag
44897:1480@0+)
11:55:50.805684 10.35.57.21 > 224.2.208.147: udp (frag 44897:1480@1480+)
11:55:50.806887 10.35.57.21 > 224.2.208.147: udp (frag 44897:1480@2960+)
11:55:50.806890 10.35.57.21 > 224.2.208.147: udp (frag 44897:1067@4440)
11:55:50.837221 10.35.57.21.1042 > 224.2.155.34.17866: udp 5499 (frag
44913:1480@0+)
11:55:50.837223 10.35.57.21 > 224.2.155.34: udp (frag 44913:1480@1480+)
11:55:50.837560 10.35.57.21 > 224.2.155.34: udp (frag 44913:1480@2960+)
11:55:50.837562 10.35.57.21 > 224.2.155.34: udp (frag 44913:1067@4440)
11:55:50.837564 10.35.57.21.1041 > 224.2.234.118.32168: udp 5499 (frag
44914:1480@0+)
11:55:50.838024 10.35.57.21 > 224.2.234.118: udp (frag 44914:1480@1480+)
11:55:50.838026 10.35.57.21 > 224.2.234.118: udp (frag 44914:1480@2960+)
11:55:50.838028 10.35.57.21 > 224.2.234.118: udp (frag 44914:1067@4440)
11:55:50.838030 10.35.57.21.1039 > 224.2.241.172.26116: udp 5499 (frag
44915:1480@0+)
11:55:50.838785 10.35.57.21 > 224.2.241.172: udp (frag 44915:1480@1480+)
11:55:50.838787 10.35.57.21 > 224.2.241.172: udp (frag 44915:1480@2960+)
11:55:50.838789 10.35.57.21 > 224.2.241.172: udp (frag 44915:1067@4440)



Any help friends,
I had already spent lots of time on this without any success.

Advance thanks.
--Manikandan.




