From: "Mike Boden" <mpboden@surfcity.net>
Subject: confused about a specific log
Date: Sat, 11 Sep 2004 18:13:55 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <001e01c49865$c646e3f0$0d01a8c0@bedroom>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,

I'm a little confused with something I've noticed in my logs. Basically, =
I don't understand why the following is being logged:

Sep 11 00:25:53 boden kernel: IN=3Deth2 OUT=3Deth0 SRC=3D192.168.0.2 =
DST=3D66.77.124.62 LEN=3D64 TOS=3D0x00 PREC=3D0x00 TTL=3D127 ID=3D13002 =
DF PROTO=3DTCP SPT=3D81 DPT=3D8252 WINDOW=3D16160 RES=3D0x00 ACK =
URGP=3D0=20

To start, I have set up a DMZ with a web server running on port 81 with =
an IP of 192.168.0.2, and it seems to be working great. I can connect to =
the server from my LAN and from the internet and there doesn't seem to =
be any problems.

With regards to the above log, the noted destination IP is my work =
address. So when I'm at there, I can connect to my server on my DMZ and =
everything seems fine. I'm not getting any errors or anything. So that's =
why I'm confused. Why is the above ACK packet getting dropped when by =
all accounts everything seems to be working correctly. Furthermore, from =
what I can gather, I've set my FORWARD Policies correctly. So why is the =
above ACK getting dropped at all? Is this a problem that I need to worry =
about?

Shouldn't the following Forward rule cover the above packet:

6 8210 6044K ACCEPT tcp -- eth2 eth0 0.0.0.0/0 0.0.0.0/0 tcp spt:81 =
state ESTABLISHED=20

Here are my iptables rules:

Chain INPUT (policy DROP 0 packets, 0 bytes)
num pkts bytes target prot opt in out source destination=20
1 4 296 ACCEPT all -- lo * 0.0.0.0/0 0.0.0.0/0=20
2 0 0 DROPLOG all -- eth0 * 192.168.1.0/24 0.0.0.0/0=20
3 0 0 DROPLOG all -- eth0 * 192.168.0.0/24 0.0.0.0/0=20
4 0 0 DROPLOG all -- eth0 * 127.0.0.0/8 0.0.0.0/0=20
5 136 6478 ACCEPT tcp -- eth1 * 192.168.1.0/24 0.0.0.0/0=20
6 0 0 ACCEPT tcp -- eth2 * 192.168.0.0/24 0.0.0.0/0=20
7 0 0 ACCEPT icmp -- eth1 * 192.168.1.0/24 0.0.0.0/0=20
8 0 0 ACCEPT icmp -- eth2 * 192.168.0.0/24 0.0.0.0/0=20
9 9 412 ACCEPT tcp -- eth0 * 0.0.0.0/0 0.0.0.0/0 tcp dpt:21 state =
NEW,ESTABLISHED=20
10 14072 1436K ACCEPT tcp -- eth0 * 0.0.0.0/0 0.0.0.0/0 tcp dpt:80 state =
NEW,RELATED,ESTABLISHED=20
11 54 8922 ACCEPT all -- eth0 * 0.0.0.0/0 xxx.xxx.xxx.xxx state =
RELATED,ESTABLISHED=20
12 677 92464 ACCEPT udp -- eth1 * 0.0.0.0/0 0.0.0.0/0=20
13 515 35571 DROPLOG all -- * * 0.0.0.0/0 0.0.0.0/0=20

Chain FORWARD (policy DROP 0 packets, 0 bytes)
num pkts bytes target prot opt in out source destination=20
1 0 0 ACCEPT icmp -- eth2 eth1 192.168.0.0/24 192.168.1.0/24=20
2 0 0 ACCEPT icmp -- eth1 eth2 192.168.1.0/24 192.168.0.0/24=20
3 7690 2386K ACCEPT all -- eth0 eth1 0.0.0.0/0 0.0.0.0/0 state =
RELATED,ESTABLISHED=20
4 7357 424K ACCEPT all -- eth1 eth0 0.0.0.0/0 0.0.0.0/0=20
5 8260 948K ACCEPT tcp -- eth0 eth2 0.0.0.0/0 0.0.0.0/0 tcp dpt:81 state =
NEW,ESTABLISHED=20
6 8210 6044K ACCEPT tcp -- eth2 eth0 0.0.0.0/0 0.0.0.0/0 tcp spt:81 =
state ESTABLISHED=20
7 1899 166K ACCEPT tcp -- eth1 eth2 0.0.0.0/0 0.0.0.0/0 tcp dpt:81 state =
NEW,ESTABLISHED=20
8 1799 1328K ACCEPT tcp -- eth2 eth1 0.0.0.0/0 0.0.0.0/0 tcp spt:81 =
state ESTABLISHED=20
9 103 12036 ACCEPT tcp -- eth2 eth0 0.0.0.0/0 0.0.0.0/0 tcp dpt:80 state =
NEW,ESTABLISHED=20
10 95 72114 ACCEPT tcp -- eth0 eth2 0.0.0.0/0 0.0.0.0/0 tcp spt:80 state =
ESTABLISHED=20
11 0 0 ACCEPT tcp -- eth2 eth0 0.0.0.0/0 0.0.0.0/0 tcp dpt:21 state =
NEW,RELATED,ESTABLISHED=20
12 0 0 ACCEPT tcp -- eth0 eth2 0.0.0.0/0 0.0.0.0/0 tcp spt:21 state =
RELATED,ESTABLISHED=20
13 0 0 ACCEPT tcp -- eth0 eth2 0.0.0.0/0 0.0.0.0/0 tcp spt:443 state =
RELATED,ESTABLISHED=20
14 0 0 ACCEPT tcp -- eth2 eth0 0.0.0.0/0 0.0.0.0/0 tcp dpt:443 state =
NEW,RELATED,ESTABLISHED=20
15 9 553 ACCEPT udp -- eth2 eth0 0.0.0.0/0 0.0.0.0/0 state =
NEW,ESTABLISHED udp dpt:53=20
16 9 1317 ACCEPT udp -- eth0 eth2 0.0.0.0/0 0.0.0.0/0 state ESTABLISHED =
udp spt:53=20
17 1 76 ACCEPT udp -- eth2 eth0 0.0.0.0/0 0.0.0.0/0 udp dpt:123 state =
NEW,ESTABLISHED=20
18 1 76 ACCEPT udp -- eth0 eth2 0.0.0.0/0 0.0.0.0/0 udp spt:123 state =
ESTABLISHED=20
19 22 14992 DROPLOG all -- * * 0.0.0.0/0 0.0.0.0/0=20

Chain OUTPUT (policy DROP 0 packets, 0 bytes)
num pkts bytes target prot opt in out source destination=20
1 4 296 ACCEPT all -- * lo 0.0.0.0/0 0.0.0.0/0=20
2 0 0 ACCEPT icmp -- * eth1 0.0.0.0/0 192.168.1.0/24=20
3 0 0 ACCEPT icmp -- * eth2 0.0.0.0/0 192.168.0.0/24=20
4 0 0 DROPLOG all -- * eth0 0.0.0.0 192.168.1.0/24=20
5 0 0 DROPLOG all -- * eth0 0.0.0.0 192.168.0.0/24=20
6 0 0 DROPLOG all -- * eth0 0.0.0.0 127.0.0.0/8=20
7 149 15331 ACCEPT all -- * eth1 xxx.xxx.xxx.xxx 192.168.1.0/24=20
8 0 0 ACCEPT tcp -- * eth2 xxx.xxx.xxx.xxx 192.168.0.0/24 tcp spt:80=20
9 17763 16M ACCEPT all -- * eth0 xxx.xxx.xxx.xxx 0.0.0.0/0=20
10 0 0 ACCEPT tcp -- * eth2 192.168.0.1 192.168.0.2 tcp dpt:81=20
11 0 0 ACCEPT tcp -- * eth1 192.168.1.1 255.255.255.255 tcp spt:67 =
dpt:68=20
12 0 0 ACCEPT udp -- * eth1 192.168.1.1 255.255.255.255 udp spt:67 =
dpt:68=20
13 0 0 ACCEPT udp -- * eth1 192.168.1.1 192.168.1.0/24 udp spt:67 dpt:68 =

14 0 0 ACCEPT tcp -- * eth1 192.168.1.1 192.168.1.120 tcp dpt:9100=20
15 0 0 DROPLOG all -- * * !xxx.xxx.xxx.xxx 0.0.0.0/0=20

Chain DROPLOG (9 references)
num pkts bytes target prot opt in out source destination=20
1 537 50563 LOG all -- * * 0.0.0.0/0 0.0.0.0/0 LOG flags 0 level 6=20
2 537 50563 DROP all -- * * 0.0.0.0/0 0.0.0.0/0=20




Thanks a bunch.=20

Mike
