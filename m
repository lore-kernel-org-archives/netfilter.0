From: "Artem V. Ryabov" <artem@osp.ru>
Subject: checking --syn and ESTABLISHED
Date: Thu, 2 Dec 2004 16:13:06 +0300
Message-ID: <1064974910.20041202161306@osp.ru>
Reply-To: "Artem V. Ryabov" <artem@osp.ru>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all,

I set my configure to check SYN flag and ESTABLISHED state.
As far as I see it work.
But there are many packets which pass to log,
with "tcp not syn" and "tcp not new" states.
What is it? it's attack or my wrong configuration? or wrong
configuration on other host?

My setup for incoming tcp from Inet:
==============
        # Accept established connections
        $IPTABLES -A mTCP -p tcp ! --syn -m state --state ESTABLISHED -j ACCEPT
        # Accept new, but related connections
        $IPTABLES -A mTCP -p tcp --syn -m state --state RELATED -j ACCEPT

        # Drop other not new connections. Such must not be
        $IPTABLES -A mTCP -p tcp ! --syn -m limit --limit 6/h --limit-burst 10 -j LOG --log-prefix "FW tcp not syn:"
        $IPTABLES -A mTCP -p tcp ! --syn -j DROP
        $IPTABLES -A mTCP -m state ! --state NEW -m limit --limit 6/h --limit-burst 10 -j LOG --log-prefix "FW tcp not new:"
        $IPTABLES -A mTCP -m state ! --state NEW -j DROP

        # Accept ssh-connections
        $IPTABLES -A mTCP -p tcp --dport ssh -j ACCEPT

        # Accept http-connections
        $IPTABLES -A mTCP -p tcp --dport http -j ACCEPT
        
        # Accept smtp-connections
        $IPTABLES -A mTCP -p tcp --dport smtp -j ACCEPT

        # Accept tcp-dns-connections
        $IPTABLES -A mTCP -p tcp --dport 53 -j ACCEPT

        # log and drop other:
        $IPTABLES -A mTCP -m limit --limit 6/h --limit-burst 10 -j LOG --log-prefix "FW tcp strange:"
        $IPTABLES -A mTCP -j DROP
==============
Counters for some hours:

Chain mTCP (1 references)
 pkts bytes target     prot opt in     out     source               destination

 708K   66M ACCEPT     tcp  --  any    any     anywhere             anywhere
        tcp flags:!SYN,RST,ACK/SYN state ESTABLISHED
    0     0 ACCEPT     tcp  --  any    any     anywhere             anywhere
        tcp flags:SYN,RST,ACK/SYN state RELATED
   31  1240 LOG        tcp  --  any    any     anywhere             anywhere
        tcp flags:!SYN,RST,ACK/SYN limit: avg 6/hour burst 10 LOG level warning
prefix `FW tcp not syn:'
 1788 92509 DROP       tcp  --  any    any     anywhere             anywhere
        tcp flags:!SYN,RST,ACK/SYN
   31  1428 LOG        all  --  any    any     anywhere             anywhere
        state INVALID,RELATED,ESTABLISHED,UNTRACKED limit: avg 6/hour burst 10 L
OG level warning prefix `FW tcp not new:'
 5467  255K DROP       all  --  any    any     anywhere             anywhere
        state INVALID,RELATED,ESTABLISHED,UNTRACKED
    3   148 ACCEPT     tcp  --  any    any     anywhere             anywhere
        tcp dpt:ssh
94917 4627K ACCEPT     tcp  --  any    any     anywhere             anywhere
        tcp dpt:http
   69  3424 ACCEPT     tcp  --  any    any     anywhere             anywhere
        tcp dpt:smtp
    0     0 ACCEPT     tcp  --  any    any     anywhere             anywhere
        tcp dpt:domain
   31  1648 LOG        all  --  any    any     anywhere             anywhere
        limit: avg 6/hour burst 10 LOG level warning prefix `FW tcp strange:'
  160  8304 DROP       all  --  any    any     anywhere             anywhere
================
syslog with this packets:

Dec  2 11:49:27 exec kernel: FW tcp not new:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:d0:63:f3:5c:06:08:00 SRC=195.50.1.120 DST=194.67.246.3 LEN=52 TOS=0x00 PREC=0x00 TTL=117 ID=492 DF PROTO=TCP SPT=4434 DPT=80 WINDOW=6144 RES=0x00 SYN URGP=0
Dec  2 11:49:27 exec kernel: FW tcp not new:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:d0:63:f3:5c:06:08:00 SRC=195.50.1.120 DST=194.67.246.3 LEN=52 TOS=0x00 PREC=0x00 TTL=117 ID=10476 DF PROTO=TCP SPT=4436 DPT=80 WINDOW=6144 RES=0x00 SYN URGP=0 
Dec  2 11:49:29 exec kernel: FW tcp not new:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:0e:0c:08:a5:31:08:00 SRC=194.67.246.5 DST=194.67.246.3 LEN=44 TOS=0x00 PREC=0x00 TTL=128 ID=18866 DF PROTO=TCP SPT=58660 DPT=80 WINDOW=5840 RES=0x00 SYN URGP=0 
Dec  2 11:49:30 exec kernel: FW tcp not new:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:d0:63:f3:5c:06:08:00 SRC=195.50.1.120 DST=194.67.246.3 LEN=52 TOS=0x00 PREC=0x00 TTL=117 ID=42223 DF PROTO=TCP SPT=4436 DPT=80 WINDOW=6144 RES=0x00 SYN URGP=0 
Dec  2 11:49:32 exec kernel: FW tcp not new:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:0e:0c:08:a5:31:08:00 SRC=194.67.246.5 DST=194.67.246.3 LEN=44 TOS=0x00 PREC=0x00 TTL=128 ID=13692 DF PROTO=TCP SPT=43373 DPT=80 WINDOW=5840 RES=0x00 SYN URGP=0 
Dec  2 11:49:35 exec kernel: FW tcp not new:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:0e:0c:08:a5:31:08:00 SRC=194.67.246.5 DST=194.67.246.3 LEN=44 TOS=0x00 PREC=0x00 TTL=128 ID=26899 DF PROTO=TCP SPT=43373 DPT=80 WINDOW=5840 RES=0x00 SYN URGP=0 
Dec  2 11:49:38 exec kernel: FW tcp not new:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:0e:0c:08:a5:31:08:00 SRC=194.67.246.5 DST=194.67.246.3 LEN=44 TOS=0x00 PREC=0x00 TTL=128 ID=25393 DF PROTO=TCP SPT=34712 DPT=80 WINDOW=5840 RES=0x00 SYN URGP=0 
Dec  2 11:49:41 exec kernel: FW tcp not new:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:0e:0c:08:a5:31:08:00 SRC=194.67.246.5 DST=194.67.246.3 LEN=44 TOS=0x00 PREC=0x00 TTL=128 ID=15459 DF PROTO=TCP SPT=43373 DPT=80 WINDOW=5840 RES=0x00 SYN URGP=0 
Dec  2 11:49:41 exec kernel: FW tcp not new:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:0e:0c:08:a5:31:08:00 SRC=194.67.246.5 DST=194.67.246.3 LEN=44 TOS=0x00 PREC=0x00 TTL=128 ID=7130 DF PROTO=TCP SPT=34712 DPT=80 WINDOW=5840 RES=0x00 SYN URGP=0 
Dec  2 11:49:42 exec kernel: FW tcp not new:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:0e:0c:08:a5:31:08:00 SRC=194.67.246.5 DST=194.67.246.3 LEN=44 TOS=0x00 PREC=0x00 TTL=128 ID=7515 DF PROTO=TCP SPT=43547 DPT=80 WINDOW=5840 RES=0x00 SYN URGP=0 
Dec  2 11:49:48 exec kernel: FW tcp not syn:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:d0:63:f3:5c:06:08:00 SRC=194.125.237.131 DST=194.67.246.4 LEN=40 TOS=0x00 PREC=0x00 TTL=122 ID=12355 DF PROTO=TCP SPT=4476 DPT=80 WINDOW=0 RES=0x00 RST URGP=0 
Dec  2 11:49:56 exec kernel: FW tcp not syn:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:d0:63:f3:5c:06:08:00 SRC=194.226.122.179 DST=194.67.246.3 LEN=40 TOS=0x00 PREC=0x00 TTL=53 ID=63592 DF PROTO=TCP SPT=35206 DPT=80 WINDOW=46720 RES=0x00 ACK FIN URGP=0 
Dec  2 11:50:14 exec kernel: FW tcp not syn:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:d0:63:f3:5c:06:08:00 SRC=195.230.131.210 DST=194.67.246.3 LEN=40 TOS=0x00 PREC=0x60 TTL=50 ID=56896 DF PROTO=TCP SPT=33426 DPT=80 WINDOW=24840 RES=0x00 ACK FIN URGP=0 
Dec  2 11:50:23 exec kernel: FW tcp not syn:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:d0:63:f3:5c:06:08:00 SRC=195.230.131.210 DST=194.67.246.3 LEN=40 TOS=0x00 PREC=0x60 TTL=50 ID=56897 DF PROTO=TCP SPT=33315 DPT=80 WINDOW=24840 RES=0x00 ACK FIN URGP=0 
Dec  2 11:50:27 exec kernel: FW tcp not syn:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:d0:63:f3:5c:06:08:00 SRC=195.230.131.210 DST=194.67.246.3 LEN=40 TOS=0x00 PREC=0x60 TTL=50 ID=56898 DF PROTO=TCP SPT=33315 DPT=80 WINDOW=24840 RES=0x00 ACK FIN URGP=0 
Dec  2 11:50:31 exec kernel: FW tcp not syn:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:d0:63:f3:5c:06:08:00 SRC=217.66.81.41 DST=194.67.246.3 LEN=40 TOS=0x00 PREC=0x00 TTL=118 ID=12423 PROTO=TCP SPT=18979 DPT=80 WINDOW=17216 RES=0x00 ACK FIN URGP=0 
Dec  2 11:50:31 exec kernel: FW tcp not syn:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:d0:63:f3:5c:06:08:00 SRC=217.66.81.41 DST=194.67.246.3 LEN=40 TOS=0x00 PREC=0x00 TTL=118 ID=12424 PROTO=TCP SPT=18976 DPT=80 WINDOW=17520 RES=0x00 ACK FIN URGP=0 
Dec  2 11:50:32 exec kernel: FW tcp not syn:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:d0:63:f3:5c:06:08:00 SRC=217.66.81.41 DST=194.67.246.3 LEN=40 TOS=0x00 PREC=0x00 TTL=118 ID=12444 PROTO=TCP SPT=18979 DPT=80 WINDOW=17216 RES=0x00 ACK FIN URGP=0 
Dec  2 11:50:33 exec kernel: FW tcp not syn:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:d0:63:f3:5c:06:08:00 SRC=217.66.81.41 DST=194.67.246.3 LEN=40 TOS=0x00 PREC=0x00 TTL=118 ID=12461 PROTO=TCP SPT=18976 DPT=80 WINDOW=17520 RES=0x00 ACK FIN URGP=0 
Dec  2 11:50:35 exec kernel: FW tcp not syn:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:d0:63:f3:5c:06:08:00 SRC=194.226.122.179 DST=194.67.246.3 LEN=40 TOS=0x00 PREC=0x00 TTL=53 ID=47919 DF PROTO=TCP SPT=35366 DPT=80 WINDOW=26280 RES=0x00 ACK FIN URGP=0 
Dec  2 11:59:42 exec kernel: FW tcp not new:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:0e:0c:08:a5:31:08:00 SRC=194.67.246.5 DST=194.67.246.3 LEN=44 TOS=0x00 PREC=0x00 TTL=128 ID=63846 DF PROTO=TCP SPT=52517 DPT=80 WINDOW=5840 RES=0x00 SYN URGP=0 
Dec  2 11:59:51 exec kernel: FW tcp not syn:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:d0:63:f3:5c:06:08:00 SRC=195.16.51.50 DST=194.67.246.3 LEN=40 TOS=0x00 PREC=0x00 TTL=122 ID=58316 PROTO=TCP SPT=29479 DPT=80 WINDOW=17216 RES=0x00 ACK FIN URGP=0 
Dec  2 12:09:29 exec kernel: FW tcp not new:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:d0:63:f3:5c:06:08:00 SRC=212.90.173.170 DST=194.67.246.4 LEN=60 TOS=0x00 PREC=0x60 TTL=50 ID=48316 DF PROTO=TCP SPT=37676 DPT=80 WINDOW=5840 RES=0x00 SYN URGP=0 
Dec  2 12:10:03 exec kernel: FW tcp not syn:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:d0:63:f3:5c:06:08:00 SRC=213.42.2.11 DST=194.67.246.3 LEN=40 TOS=0x00 PREC=0x60 TTL=45 ID=14319 PROTO=TCP SPT=8631 DPT=80 WINDOW=65535 RES=0x00 ACK FIN URGP=0 
Dec  2 12:19:30 exec kernel: FW tcp not new:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:d0:63:f3:5c:06:08:00 SRC=82.209.240.194 DST=194.67.246.3 LEN=48 TOS=0x00 PREC=0x00 TTL=117 ID=5401 DF PROTO=TCP SPT=3353 DPT=80 WINDOW=8760 RES=0x00 SYN URGP=0 
Dec  2 12:20:46 exec kernel: FW tcp not syn:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:d0:63:f3:5c:06:08:00 SRC=194.44.150.170 DST=194.67.246.3 LEN=40 TOS=0x00 PREC=0x60 TTL=109 ID=60914 PROTO=TCP SPT=34682 DPT=80 WINDOW=17520 RES=0x00 ACK FIN URGP=0 
Dec  2 12:29:30 exec kernel: FW tcp not new:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:0e:0c:08:a5:31:08:00 SRC=194.67.246.5 DST=194.67.246.3 LEN=44 TOS=0x00 PREC=0x00 TTL=128 ID=41485 DF PROTO=TCP SPT=46720 DPT=80 WINDOW=5840 RES=0x00 SYN URGP=0 
Dec  2 12:29:55 exec kernel: FW tcp not syn:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:d0:63:f3:5c:06:08:00 SRC=194.44.150.170 DST=194.67.246.3 LEN=40 TOS=0x00 PREC=0x60 TTL=109 ID=17264 PROTO=TCP SPT=35127 DPT=80 WINDOW=0 RES=0x00 ACK RST URGP=0 
Dec  2 12:39:27 exec kernel: FW tcp not new:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:0e:0c:08:a5:31:08:00 SRC=194.67.246.5 DST=194.67.246.3 LEN=44 TOS=0x00 PREC=0x00 TTL=128 ID=33608 DF PROTO=TCP SPT=57287 DPT=80 WINDOW=5840 RES=0x00 SYN URGP=0 
Dec  2 12:40:45 exec kernel: FW tcp not syn:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:d0:63:f3:5c:06:08:00 SRC=194.44.150.170 DST=194.67.246.3 LEN=40 TOS=0x00 PREC=0x60 TTL=109 ID=57500 PROTO=TCP SPT=35256 DPT=80 WINDOW=17520 RES=0x00 ACK FIN URGP=0 
Dec  2 12:49:28 exec kernel: FW tcp not new:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:0e:0c:08:a5:31:08:00 SRC=194.67.246.5 DST=194.67.246.3 LEN=44 TOS=0x00 PREC=0x00 TTL=128 ID=46334 DF PROTO=TCP SPT=38688 DPT=80 WINDOW=5840 RES=0x00 SYN URGP=0 
Dec  2 12:49:52 exec kernel: FW tcp not syn:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:d0:63:f3:5c:06:08:00 SRC=80.232.188.130 DST=194.67.246.3 LEN=40 TOS=0x00 PREC=0x60 TTL=111 ID=41174 PROTO=TCP SPT=48570 DPT=80 WINDOW=17216 RES=0x00 ACK FIN URGP=0 
Dec  2 12:59:29 exec kernel: FW tcp not new:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:d0:63:f3:5c:06:08:00 SRC=82.204.230.213 DST=194.67.246.3 LEN=48 TOS=0x00 PREC=0x00 TTL=120 ID=367 DF PROTO=TCP SPT=3033 DPT=80 WINDOW=8760 RES=0x00 SYN URGP=0 
Dec  2 13:01:12 exec kernel: FW tcp not syn:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:d0:63:f3:5c:06:08:00 SRC=217.9.144.233 DST=194.67.246.3 LEN=40 TOS=0x00 PREC=0x60 TTL=39 ID=32605 DF PROTO=TCP SPT=1065 DPT=80 WINDOW=24820 RES=0x00 ACK FIN URGP=0 
Dec  2 13:09:29 exec kernel: FW tcp not new:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:0e:0c:08:a5:31:08:00 SRC=194.67.246.5 DST=194.67.246.3 LEN=44 TOS=0x00 PREC=0x00 TTL=128 ID=17554 DF PROTO=TCP SPT=39985 DPT=80 WINDOW=5840 RES=0x00 SYN URGP=0 
Dec  2 13:09:51 exec kernel: FW tcp not syn:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:d0:63:f3:5c:06:08:00 SRC=194.186.135.118 DST=194.67.246.3 LEN=40 TOS=0x00 PREC=0x60 TTL=116 ID=25132 DF PROTO=TCP SPT=62621 DPT=80 WINDOW=8592 RES=0x00 ACK FIN URGP=0 
Dec  2 13:19:30 exec kernel: FW tcp not new:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:0e:0c:08:a5:31:08:00 SRC=194.67.246.5 DST=194.67.246.3 LEN=44 TOS=0x00 PREC=0x00 TTL=128 ID=7420 DF PROTO=TCP SPT=49872 DPT=80 WINDOW=5840 RES=0x00 SYN URGP=0 
Dec  2 13:20:20 exec kernel: FW tcp not syn:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:d0:63:f3:5c:06:08:00 SRC=195.5.56.83 DST=194.67.246.3 LEN=40 TOS=0x00 PREC=0x60 TTL=114 ID=33803 DF PROTO=TCP SPT=63775 DPT=80 WINDOW=0 RES=0x00 RST URGP=0 
Dec  2 13:29:31 exec kernel: FW tcp not new:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:d0:63:f3:5c:06:08:00 SRC=213.228.80.129 DST=194.67.246.3 LEN=48 TOS=0x00 PREC=0x60 TTL=102 ID=52480 DF PROTO=TCP SPT=1046 DPT=80 WINDOW=65535 RES=0x00 SYN URGP=0 
Dec  2 13:29:50 exec kernel: FW tcp not syn:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:d0:63:f3:5c:06:08:00 SRC=212.26.238.138 DST=194.67.246.3 LEN=40 TOS=0x00 PREC=0x00 TTL=122 ID=9383 PROTO=TCP SPT=3444 DPT=80 WINDOW=0 RES=0x00 RST URGP=0 
Dec  2 13:39:31 exec kernel: FW tcp not new:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:d0:63:f3:5c:06:08:00 SRC=213.228.80.129 DST=194.67.246.3 LEN=48 TOS=0x00 PREC=0x60 TTL=102 ID=1545 DF PROTO=TCP SPT=1131 DPT=80 WINDOW=65535 RES=0x00 SYN URGP=0 
Dec  2 13:40:18 exec kernel: FW tcp not syn:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:d0:63:f3:5c:06:08:00 SRC=213.228.80.129 DST=194.67.246.3 LEN=40 TOS=0x00 PREC=0x60 TTL=102 ID=37641 DF PROTO=TCP SPT=1122 DPT=80 WINDOW=65041 RES=0x00 ACK URGP=0 
Dec  2 13:49:28 exec kernel: FW tcp not new:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:0e:0c:08:a5:31:08:00 SRC=194.67.246.5 DST=194.67.246.3 LEN=44 TOS=0x00 PREC=0x00 TTL=128 ID=20300 DF PROTO=TCP SPT=34898 DPT=80 WINDOW=5840 RES=0x00 SYN URGP=0 
Dec  2 13:50:13 exec kernel: FW tcp not syn:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:d0:63:f3:5c:06:08:00 SRC=212.1.64.30 DST=194.67.246.4 LEN=40 TOS=0x00 PREC=0x60 TTL=50 ID=12672 PROTO=TCP SPT=54331 DPT=80 WINDOW=0 RES=0x00 RST URGP=0 
Dec  2 13:59:29 exec kernel: FW tcp not new:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:0e:0c:08:a5:31:08:00 SRC=194.67.246.5 DST=194.67.246.3 LEN=44 TOS=0x00 PREC=0x00 TTL=128 ID=26901 DF PROTO=TCP SPT=51211 DPT=80 WINDOW=5840 RES=0x00 SYN URGP=0 
Dec  2 13:59:54 exec kernel: FW tcp not syn:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:d0:63:f3:5c:06:08:00 SRC=217.10.46.11 DST=194.67.246.3 LEN=40 TOS=0x00 PREC=0x00 TTL=120 ID=8273 PROTO=TCP SPT=1431 DPT=80 WINDOW=17216 RES=0x00 ACK FIN URGP=0 
Dec  2 14:09:31 exec kernel: FW tcp not new:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:0e:0c:08:a5:31:08:00 SRC=194.67.246.5 DST=194.67.246.3 LEN=44 TOS=0x00 PREC=0x00 TTL=128 ID=8400 DF PROTO=TCP SPT=38566 DPT=80 WINDOW=5840 RES=0x00 SYN URGP=0 
Dec  2 14:09:50 exec kernel: FW tcp not syn:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:d0:63:f3:5c:06:08:00 SRC=194.67.66.99 DST=194.67.246.3 LEN=40 TOS=0x00 PREC=0x00 TTL=123 ID=29902 DF PROTO=TCP SPT=62962 DPT=80 WINDOW=0 RES=0x00 RST URGP=0 
Dec  2 14:19:28 exec kernel: FW tcp not new:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:d0:63:f3:5c:06:08:00 SRC=195.128.131.145 DST=194.67.246.3 LEN=44 TOS=0x00 PREC=0x60 TTL=57 ID=28861 DF PROTO=TCP SPT=1299 DPT=80 WINDOW=57344 RES=0x00 SYN URGP=0 
Dec  2 14:19:49 exec kernel: FW tcp not syn:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:d0:63:f3:5c:06:08:00 SRC=193.124.215.227 DST=194.67.246.3 LEN=40 TOS=0x00 PREC=0x00 TTL=54 ID=8818 DF PROTO=TCP SPT=34965 DPT=80 WINDOW=6432 RES=0x00 ACK FIN URGP=0 
Dec  2 14:29:33 exec kernel: FW tcp not new:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:d0:63:f3:5c:06:08:00 SRC=217.28.209.197 DST=194.67.246.4 LEN=48 TOS=0x00 PREC=0x00 TTL=123 ID=39220 PROTO=TCP SPT=48306 DPT=80 WINDOW=8760 RES=0x00 SYN URGP=0 
Dec  2 14:30:01 exec kernel: FW tcp not syn:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:d0:63:f3:5c:06:08:00 SRC=193.124.215.227 DST=194.67.246.3 LEN=40 TOS=0x00 PREC=0x00 TTL=54 ID=56999 DF PROTO=TCP SPT=40218 DPT=80 WINDOW=6432 RES=0x00 ACK FIN URGP=0 
Dec  2 14:39:28 exec kernel: FW tcp not new:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:0e:0c:08:a5:31:08:00 SRC=194.67.246.5 DST=194.67.246.3 LEN=44 TOS=0x00 PREC=0x00 TTL=128 ID=32575 DF PROTO=TCP SPT=49099 DPT=80 WINDOW=5840 RES=0x00 SYN URGP=0 
Dec  2 14:39:48 exec kernel: FW tcp not syn:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:d0:63:f3:5c:06:08:00 SRC=195.94.231.204 DST=194.67.246.3 LEN=40 TOS=0x00 PREC=0x00 TTL=120 ID=8058 PROTO=TCP SPT=10067 DPT=80 WINDOW=65231 RES=0x00 ACK FIN URGP=0 
Dec  2 14:49:28 exec kernel: FW tcp not new:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:0e:0c:08:a5:31:08:00 SRC=194.67.246.5 DST=194.67.246.3 LEN=44 TOS=0x00 PREC=0x00 TTL=128 ID=47296 DF PROTO=TCP SPT=58747 DPT=80 WINDOW=5840 RES=0x00 SYN URGP=0 
Dec  2 14:50:35 exec kernel: FW tcp not syn:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:d0:63:f3:5c:06:08:00 SRC=212.57.172.50 DST=194.67.246.4 LEN=40 TOS=0x00 PREC=0x60 TTL=110 ID=5407 PROTO=TCP SPT=3344 DPT=80 WINDOW=0 RES=0x00 RST URGP=0 
Dec  2 14:59:27 exec kernel: FW tcp not new:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:0e:0c:08:a5:31:08:00 SRC=194.67.246.5 DST=194.67.246.3 LEN=44 TOS=0x00 PREC=0x00 TTL=128 ID=59940 DF PROTO=TCP SPT=45488 DPT=80 WINDOW=5840 RES=0x00 SYN URGP=0 
Dec  2 14:59:52 exec kernel: FW tcp not syn:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:d0:63:f3:5c:06:08:00 SRC=213.247.155.194 DST=194.67.246.3 LEN=40 TOS=0x00 PREC=0x00 TTL=58 ID=26426 DF PROTO=TCP SPT=4423 DPT=80 WINDOW=58400 RES=0x00 ACK FIN URGP=0 
Dec  2 15:09:27 exec kernel: FW tcp not new:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:0e:0c:08:a5:31:08:00 SRC=194.67.246.5 DST=194.67.246.3 LEN=44 TOS=0x00 PREC=0x00 TTL=128 ID=21742 DF PROTO=TCP SPT=60457 DPT=80 WINDOW=5840 RES=0x00 SYN URGP=0 
Dec  2 15:09:52 exec kernel: FW tcp not syn:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:d0:63:f3:5c:06:08:00 SRC=194.237.142.10 DST=194.67.246.3 LEN=40 TOS=0x00 PREC=0x60 TTL=52 ID=15687 PROTO=TCP SPT=11310 DPT=80 WINDOW=65535 RES=0x00 ACK FIN URGP=0 
Dec  2 15:19:33 exec kernel: FW tcp not new:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:d0:63:f3:5c:06:08:00 SRC=195.161.152.70 DST=194.67.246.3 LEN=48 TOS=0x00 PREC=0x60 TTL=105 ID=30360 DF PROTO=TCP SPT=49162 DPT=80 WINDOW=16384 RES=0x00 SYN URGP=0 
Dec  2 15:19:51 exec kernel: FW tcp not syn:IN=eth0 OUT= MAC=00:d0:b7:b8:9e:d8:00:d0:63:f3:5c:06:08:00 SRC=83.102.153.81 DST=194.67.246.4 LEN=40 TOS=0x00 PREC=0x00 TTL=123 ID=18329 PROTO=TCP SPT=44910 DPT=80 WINDOW=17520 RES=0x00 ACK FIN URGP=0 



-- 
Artem


