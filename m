From: "mdpeters" <michael.peters@lazarusalliance.com>
Subject: transparent bridge troubles?
Date: Fri, 7 Jan 2005 13:53:48 -0500
Message-ID: <074001c4f4ea$388d1070$3e0010ac@esonet18>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I am trying to set up a transparent bridge between two interfaces. I =
believe that my bridge is working but all I can see going through the =
box is APR packets. I have been told by the folks on the bridge list =
that it is probably my IPTABLES but I am pretty green with it. This is =
what I know for sure:

Kernel Linux-2.6.5-1.358, Fedora Core 2.

#/sbin/lsmod
Module                  Size  Used by
ipt_state               5504  2
ip_conntrack           30348  1 ipt_state
ipv6                  214624  16
iptable_filter          6016  1
ip_tables              18048  2 ipt_state,iptable_filter
bridge                 32024  0
ip_queue               11672  0
autofs4                15488  0
sunrpc                110280  1
e1000                  73356  0
e100                   30852  0
mii                     7552  1 e100
sg                     32288  0
microcode              10400  0
dm_mod                 37536  0
button                  8472  0
battery                10892  0
asus_acpi              12440  0
ac                      7308  0
ext3                  108136  2
jbd                    50328  1 ext3
ata_piix                9348  3
libata                 33536  1 ata_piix,[permanent]
sd_mod                 20352  4
scsi_mod               97224  3 sg,libata,sd_mod

++++++++++++++++++++++++++++++++++++++++

This is my bridge setup:

/sbin/modprobe ip_queue
/sbin/ifconfig eth1 0.0.0.0
/sbin/ifconfig eth2 0.0.0.0
/usr/local/sbin/brctl addbr br0
/usr/local/sbin/brctl addif br0 eth1
/usr/local/sbin/brctl addif br0 eth2
/sbin/ifconfig br0 up
/usr/local/sbin/brctl stp br0 off
/sbin/ifconfig br0 0.0.0.0 -arp

++++++++++++++++++++++++++++++++++++++++

This is what my iptables setup looks like.

/usr/local/sbin/iptables -P FORWARD DROP
/usr/local/sbin/iptables -A FORWARD -p tcp --syn -m state --state NEW -j =
QUEUE
/usr/local/sbin/iptables -A FORWARD -p tcp -m state --state =
RELATED,ESTABLISHED -j QUEUE
/usr/local/sbin/iptables -A FORWARD -p udp -j QUEUE
/usr/local/sbin/iptables -A FORWARD -p icmp -j QUEUE

#/usr/local/sbin/iptables -L
Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain FORWARD (policy DROP)
target     prot opt source               destination
QUEUE      all  --  anywhere             anywhere
QUEUE      tcp  --  anywhere             anywhere            tcp
flags:SYN,RST,ACK/SYN state NEW
QUEUE      tcp  --  anywhere             anywhere            state
RELATED,ESTABLISHED
QUEUE      udp  --  anywhere             anywhere
QUEUE      icmp --  anywhere             anywhere

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

++++++++++++++++++++++++++++++++++++++++

# /sbin/ifconfig -a
eth0      Link encap:Ethernet  HWaddr 00:11:11:50:EE:D2
          inet addr:172.16.200.211  Bcast:172.16.255.255  =
Mask:255.255.0.0
          inet6 addr: fe80::211:11ff:fe50:eed2/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:77160 errors:5 dropped:0 overruns:0 frame:5
          TX packets:38287 errors:0 dropped:0 overruns:0 carrier:3
          collisions:2126 txqueuelen:1000
          RX bytes:7950909 (7.5 Mb)  TX bytes:14485654 (13.8 Mb)

eth1      Link encap:Ethernet  HWaddr 00:04:23:AD:ED:BA
          inet6 addr: fe80::204:23ff:fead:edba/64 Scope:Link
          UP BROADCAST MULTICAST  MTU:1500  Metric:1
          RX packets:413 errors:0 dropped:0 overruns:0 frame:0
          TX packets:673 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:31654 (30.9 Kb)  TX bytes:71099 (69.4 Kb)
          Base address:0xc800 Memory:ff8c0000-ff8e0000

eth2      Link encap:Ethernet  HWaddr 00:04:23:AD:ED:BB
          inet6 addr: fe80::204:23ff:fead:edbb/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:10067 errors:0 dropped:0 overruns:0 frame:0
          TX packets:190 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:741428 (724.0 Kb)  TX bytes:16514 (16.1 Kb)
          Base address:0xcc00 Memory:ff8e0000-ff900000

eth3      Link encap:Ethernet  HWaddr 00:04:23:AD:ED:D6
          inet6 addr: fe80::204:23ff:fead:edd6/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:5 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:0 (0.0 b)  TX bytes:398 (398.0 b)
          Base address:0xc000 Memory:ff780000-ff7a0000

eth4      Link encap:Ethernet  HWaddr 00:04:23:AD:ED:D7
          inet6 addr: fe80::204:23ff:fead:edd7/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:1429283 errors:1835 dropped:0 overruns:0 frame:1835
          TX packets:5 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:307722248 (293.4 Mb)  TX bytes:398 (398.0 b)
          Base address:0xc400 Memory:ff7a0000-ff7c0000

eth5      Link encap:Ethernet  HWaddr 00:04:23:AD:ED:A8
          inet6 addr: fe80::204:23ff:fead:eda8/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:164 errors:0 dropped:0 overruns:0 frame:0
          TX packets:5 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:11008 (10.7 Kb)  TX bytes:398 (398.0 b)
          Base address:0xb800 Memory:ff640000-ff660000

eth6      Link encap:Ethernet  HWaddr 00:04:23:AD:ED:A9
          inet6 addr: fe80::204:23ff:fead:eda9/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:9078 errors:0 dropped:0 overruns:0 frame:0
          TX packets:5 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:898198 (877.1 Kb)  TX bytes:398 (398.0 b)
          Base address:0xbc00 Memory:ff660000-ff680000

lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:107 errors:0 dropped:0 overruns:0 frame:0
          TX packets:107 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:14503 (14.1 Kb)  TX bytes:14503 (14.1 Kb)

br0      Link encap:Ethernet  HWaddr 00:04:23:AD:ED:BA
          inet6 addr: fe80::204:23ff:fead:edba/64 Scope:Link
          UP BROADCAST RUNNING NOARP MULTICAST  MTU:1500  Metric:1
          RX packets:9861 errors:0 dropped:0 overruns:0 frame:0
          TX packets:3 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:506916 (495.0 Kb)  TX bytes:210 (210.0 b)

sit0      Link encap:IPv6-in-IPv4
          NOARP  MTU:1480  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:0 (0.0 b)  TX bytes:0 (0.0 b)

++++++++++++++++++++++++++++++++++++++++

Am I missing something? I appreciate tremendously your help.

Best regards,

Michael
