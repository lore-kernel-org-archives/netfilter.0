From: George Garvey <tmwg-netfilter@inxservices.com>
Subject: Re: NAT not working on one of 3 firewalls
Date: Tue, 25 Jun 2002 03:44:01 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020625034401.F868@inxservices.com>
References: <20020624113121.B868@inxservices.com> <20020624204237.JDLG2755.mta05-svc.ntlworld.com@there> <20020624154635.D868@inxservices.com> <20020625040834.RLLZ4119.mta06-svc.ntlworld.com@there>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <20020625040834.RLLZ4119.mta06-svc.ntlworld.com@there>; from Antony@Soft-Solutions.co.uk on Tue, Jun 25, 2002 at 05:08:32AM +0100
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org, Antony@Soft-Solutions.co.uk

   I used the following rules, very early in the script:

$IPTABLES -t mangle -I PREROUTING -j LOG --log-prefix="PreMangle " --log-level debug
$IPTABLES -t nat -I PREROUTING -j LOG --log-prefix="PreNat " --log-level debug
$IPTABLES -t mangle -I FORWARD -j LOG --log-prefix="FwdMangle " --log-level debug
$IPTABLES -I FORWARD -j LOG --log-prefix="Forward " --log-level debug

Again, I used telnet to connect to sunsite's FTP port:

Jun 24 16:34:06 salesns kernel: PreMangle IN=eth1 OUT= MAC=ff:fe:24:4b:c6:13:00:20:6f:0f:5f:40:08:00 SRC=152.2.210.81 DST=66.123.115.210 LEN=44 TOS=0x00 PREC=0x00 TTL=52 ID=0 DF PROTO=TCP SPT=21 DPT=32811 WINDOW=5840 RES=0x00 ACK SYN URGP=0 
^^^^^^^^^^^^^^
Jun 24 16:34:31 salesns kernel: PreMangle IN=eth1 OUT= MAC=ff:ff:ff:ff:ff:ff:00:20:6f:0f:5f:40:08:00 SRC=66.123.115.209 DST=66.123.115.215 LEN=52 TOS=0x00 PREC=0x00 TTL=60 ID=33105 PROTO=UDP SPT=520 DPT=520 LEN=32 
Jun 24 16:34:31 salesns kernel: PreNat IN=eth1 OUT= MAC=ff:ff:ff:ff:ff:ff:00:20:6f:0f:5f:40:08:00 SRC=66.123.115.209 DST=66.123.115.215 LEN=52 TOS=0x00 PREC=0x00 TTL=60 ID=33105 PROTO=UDP SPT=520 DPT=520 LEN=32 
Jun 24 16:34:33 salesns kernel: PreMangle IN=eth1 OUT= MAC=01:00:5e:00:00:09:00:20:6f:0f:5f:40:08:00 SRC=66.123.115.209 DST=224.0.0.9 LEN=52 TOS=0x00 PREC=0x00 TTL=60 ID=33106 PROTO=UDP SPT=520 DPT=520 LEN=32 
Jun 24 16:34:33 salesns kernel: PreNat IN=eth1 OUT= MAC=01:00:5e:00:00:09:00:20:6f:0f:5f:40:08:00 SRC=66.123.115.209 DST=224.0.0.9 LEN=52 TOS=0x00 PREC=0x00 TTL=60 ID=33106 PROTO=UDP SPT=520 DPT=520 LEN=32 
Jun 24 16:34:34 salesns kernel: PreMangle IN=eth0 OUT= MAC=00:50:ba:37:d8:5e:00:50:ba:8f:e1:7e:08:00 SRC=192.168.2.4 DST=192.168.2.2 LEN=76 TOS=0x10 PREC=0x00 TTL=128 ID=0 DF PROTO=UDP SPT=123 DPT=123 LEN=56 
Jun 24 16:34:55 salesns kernel: PreMangle IN=eth1 OUT= MAC=ff:fe:24:4b:c6:13:00:20:6f:0f:5f:40:08:00 SRC=152.2.210.81 DST=66.123.115.210 LEN=44 TOS=0x00 PREC=0x00 TTL=52 ID=0 DF PROTO=TCP SPT=21 DPT=32811 WINDOW=5840 RES=0x00 ACK SYN URGP=0 
^^^^^^^^^^^^^^

The packets are coming in. They don't seem to be going through the forward
chain, but I don't see anything stopping them looking at the rules.

I took out the rule that accepts the packets the router mutters to
itself (which bother me, because I just don't know how the kernel
interprets them), and got:

Jun 25 03:13:57 salesns kernel: PreMangle IN=eth0 OUT= MAC=00:50:ba:37:d8:5e:00:50:ba:37:d8:3e:08:00 SRC=192.168.2.3 DST=152.2.210.81 LEN=60 TOS=0x10 PREC=0x00 TTL=128 ID=45095 DF PROTO=TCP SPT=32813 DPT=21 WINDOW=5840 RES=0x00 SYN URGP=0 
Jun 25 03:13:57 salesns kernel: PreNat IN=eth0 OUT= MAC=00:50:ba:37:d8:5e:00:50:ba:37:d8:3e:08:00 SRC=192.168.2.3 DST=152.2.210.81 LEN=60 TOS=0x10 PREC=0x00 TTL=128 ID=45095 DF PROTO=TCP SPT=32813 DPT=21 WINDOW=5840 RES=0x00 SYN URGP=0 
Jun 25 03:13:57 salesns kernel: FwdMangle IN=eth0 OUT=eth1 SRC=192.168.2.3 DST=152.2.210.81 LEN=60 TOS=0x10 PREC=0x00 TTL=127 ID=45095 DF PROTO=TCP SPT=32813 DPT=21 WINDOW=5840 RES=0x00 SYN URGP=0 
Jun 25 03:13:57 salesns kernel: Forward IN=eth0 OUT=eth1 SRC=192.168.2.3 DST=152.2.210.81 LEN=60 TOS=0x10 PREC=0x00 TTL=127 ID=45095 DF PROTO=TCP SPT=32813 DPT=21 WINDOW=5840 RES=0x00 SYN URGP=0 
^^^^^^^^^^^^^^^^^
Jun 25 03:13:57 salesns kernel: PreMangle IN=eth1 OUT= MAC=ff:fe:24:4b:c6:13:00:20:6f:0f:5f:40:08:00 SRC=63.193.79.19 DST=66.123.115.210 LEN=76 TOS=0x00 PREC=0x00 TTL=251 ID=0 DF PROTO=47 
Jun 25 03:13:57 salesns kernel: PreMangle IN=withvan OUT= MAC=45:00:00:4c:00:00:40:00:fb:2f:3a:61:3f:c1:4f:13:42:7b:73:d2:00:00:08:00:45:10:00:34:4d:91:40:00:7f:06:29:cc:c0:a8 SRC=192.168.1.3 DST=192.168.2.3 LEN=52 TOS=0x10 PREC=0x00 TTL=127 ID=19857 DF PROTO=TCP SPT=34265 DPT=22 WINDOW=45568 RES=0x00 ACK URGP=0 
Jun 25 03:13:57 salesns kernel: FwdMangle IN=withvan OUT=eth0 SRC=192.168.1.3 DST=192.168.2.3 LEN=52 TOS=0x10 PREC=0x00 TTL=126 ID=19857 DF PROTO=TCP SPT=34265 DPT=22 WINDOW=45568 RES=0x00 ACK URGP=0 
Jun 25 03:13:57 salesns kernel: Forward IN=withvan OUT=eth0 SRC=192.168.1.3 DST=192.168.2.3 LEN=52 TOS=0x10 PREC=0x00 TTL=126 ID=19857 DF PROTO=TCP SPT=34265 DPT=22 WINDOW=45568 RES=0x00 ACK URGP=0 
Jun 25 03:13:57 salesns kernel: PreMangle IN=eth0 OUT= MAC=00:50:ba:37:d8:5e:00:50:ba:37:d8:3e:08:00 SRC=192.168.2.3 DST=192.168.1.3 LEN=84 TOS=0x10 PREC=0x00 TTL=128 ID=49185 DF PROTO=TCP SPT=22 DPT=34265 WINDOW=5792 RES=0x00 ACK PSH URGP=0 
Jun 25 03:13:57 salesns kernel: FwdMangle IN=eth0 OUT=withvan SRC=192.168.2.3 DST=192.168.1.3 LEN=84 TOS=0x10 PREC=0x00 TTL=127 ID=49185 DF PROTO=TCP SPT=22 DPT=34265 WINDOW=5792 RES=0x00 ACK PSH URGP=0 
Jun 25 03:13:57 salesns kernel: Forward IN=eth0 OUT=withvan SRC=192.168.2.3 DST=192.168.1.3 LEN=84 TOS=0x10 PREC=0x00 TTL=127 ID=49185 DF PROTO=TCP SPT=22 DPT=34265 WINDOW=5792 RES=0x00 ACK PSH URGP=0 
Jun 25 03:13:57 salesns kernel: PreMangle IN=eth1 OUT= MAC=ff:fe:24:4b:c6:13:00:20:6f:0f:5f:40:08:00 SRC=152.2.210.81 DST=66.123.115.210 LEN=44 TOS=0x00 PREC=0x00 TTL=52 ID=0 DF PROTO=TCP SPT=21 DPT=32813 WINDOW=5840 RES=0x00 ACK SYN URGP=0 
^^^^^^^^^^^^^^^^^
Jun 25 03:13:57 salesns kernel: PreMangle IN=eth1 OUT= MAC=ff:fe:24:4b:c6:13:00:20:6f:0f:5f:40:08:00 SRC=63.193.79.19 DST=66.123.115.210 LEN=76 TOS=0x00 PREC=0x00 TTL=251 ID=0 DF PROTO=47 
Jun 25 03:13:57 salesns kernel: PreMangle IN=withvan OUT= MAC=45:00:00:4c:00:00:40:00:fb:2f:3a:61:3f:c1:4f:13:42:7b:73:d2:00:00:08:00:45:10:00:34:4d:92:40:00:7f:06:29:cb:c0:a8 SRC=192.168.1.3 DST=192.168.2.3 LEN=52 TOS=0x10 PREC=0x00 TTL=127 ID=19858 DF PROTO=TCP SPT=34265 DPT=22 WINDOW=45568 RES=0x00 ACK URGP=0 
Jun 25 03:13:57 salesns kernel: FwdMangle IN=withvan OUT=eth0 SRC=192.168.1.3 DST=192.168.2.3 LEN=52 TOS=0x10 PREC=0x00 TTL=126 ID=19858 DF PROTO=TCP SPT=34265 DPT=22 WINDOW=45568 RES=0x00 ACK URGP=0 
Jun 25 03:13:57 salesns kernel: Forward IN=withvan OUT=eth0 SRC=192.168.1.3 DST=192.168.2.3 LEN=52 TOS=0x10 PREC=0x00 TTL=126 ID=19858 DF PROTO=TCP SPT=34265 DPT=22 WINDOW=45568 RES=0x00 ACK URGP=0 
Jun 25 03:13:59 salesns kernel: PreMangle IN=eth1 OUT= MAC=ff:ff:ff:ff:ff:ff:00:20:6f:0f:5f:40:08:00 SRC=66.123.115.209 DST=66.123.115.215 LEN=52 TOS=0x00 PREC=0x00 TTL=60 ID=35746 PROTO=UDP SPT=520 DPT=520 LEN=32 
Jun 25 03:13:59 salesns kernel: PreNat IN=eth1 OUT= MAC=ff:ff:ff:ff:ff:ff:00:20:6f:0f:5f:40:08:00 SRC=66.123.115.209 DST=66.123.115.215 LEN=52 TOS=0x00 PREC=0x00 TTL=60 ID=35746 PROTO=UDP SPT=520 DPT=520 LEN=32 
Jun 25 03:13:59 salesns kernel: REJECT-INP: IN=eth1 OUT= MAC=ff:ff:ff:ff:ff:ff:00:20:6f:0f:5f:40:08:00 SRC=66.123.115.209 DST=66.123.115.215 LEN=52 TOS=0x00 PREC=0x00 TTL=60 ID=35746 PROTO=UDP SPT=520 DPT=520 LEN=32 
Jun 25 03:14:00 salesns kernel: PreMangle IN=eth0 OUT= MAC=00:50:ba:37:d8:5e:00:50:ba:37:d8:3e:08:00 SRC=192.168.2.3 DST=152.2.210.81 LEN=60 TOS=0x10 PREC=0x00 TTL=128 ID=45096 DF PROTO=TCP SPT=32813 DPT=21 WINDOW=5840 RES=0x00 SYN URGP=0 
Jun 25 03:14:00 salesns kernel: FwdMangle IN=eth0 OUT=eth1 SRC=192.168.2.3 DST=152.2.210.81 LEN=60 TOS=0x10 PREC=0x00 TTL=127 ID=45096 DF PROTO=TCP SPT=32813 DPT=21 WINDOW=5840 RES=0x00 SYN URGP=0 
Jun 25 03:14:00 salesns kernel: Forward IN=eth0 OUT=eth1 SRC=192.168.2.3 DST=152.2.210.81 LEN=60 TOS=0x10 PREC=0x00 TTL=127 ID=45096 DF PROTO=TCP SPT=32813 DPT=21 WINDOW=5840 RES=0x00 SYN URGP=0 
^^^^^^^^^^^
Jun 25 03:14:00 salesns kernel: PreMangle IN=eth1 OUT= MAC=ff:fe:24:4b:c6:13:00:20:6f:0f:5f:40:08:00 SRC=63.193.79.19 DST=66.123.115.210 LEN=108 TOS=0x00 PREC=0x00 TTL=251 ID=0 DF PROTO=47 
Jun 25 03:14:00 salesns kernel: PreMangle IN=withvan OUT= MAC=45:00:00:6c:00:00:40:00:fb:2f:3a:41:3f:c1:4f:13:42:7b:73:d2:00:00:08:00:45:10:00:54:4d:93:40:00:7f:06:29:aa:c0:a8 SRC=192.168.1.3 DST=192.168.2.3 LEN=84 TOS=0x10 PREC=0x00 TTL=127 ID=19859 DF PROTO=TCP SPT=34265 DPT=22 WINDOW=45568 RES=0x00 ACK PSH URGP=0 
Jun 25 03:14:00 salesns kernel: FwdMangle IN=withvan OUT=eth0 SRC=192.168.1.3 DST=192.168.2.3 LEN=84 TOS=0x10 PREC=0x00 TTL=126 ID=19859 DF PROTO=TCP SPT=34265 DPT=22 WINDOW=45568 RES=0x00 ACK PSH URGP=0 
Jun 25 03:14:00 salesns kernel: Forward IN=withvan OUT=eth0 SRC=192.168.1.3 DST=192.168.2.3 LEN=84 TOS=0x10 PREC=0x00 TTL=126 ID=19859 DF PROTO=TCP SPT=34265 DPT=22 WINDOW=45568 RES=0x00 ACK PSH URGP=0 
Jun 25 03:14:00 salesns kernel: PreMangle IN=eth0 OUT= MAC=00:50:ba:37:d8:5e:00:50:ba:37:d8:3e:08:00 SRC=192.168.2.3 DST=192.168.1.3 LEN=100 TOS=0x10 PREC=0x00 TTL=128 ID=49186 DF PROTO=TCP SPT=22 DPT=34265 WINDOW=5792 RES=0x00 ACK PSH URGP=0 
Jun 25 03:14:00 salesns kernel: FwdMangle IN=eth0 OUT=withvan SRC=192.168.2.3 DST=192.168.1.3 LEN=100 TOS=0x10 PREC=0x00 TTL=127 ID=49186 DF PROTO=TCP SPT=22 DPT=34265 WINDOW=5792 RES=0x00 ACK PSH URGP=0 
Jun 25 03:14:00 salesns kernel: Forward IN=eth0 OUT=withvan SRC=192.168.2.3 DST=192.168.1.3 LEN=100 TOS=0x10 PREC=0x00 TTL=127 ID=49186 DF PROTO=TCP SPT=22 DPT=34265 WINDOW=5792 RES=0x00 ACK PSH URGP=0 
Jun 25 03:14:00 salesns kernel: PreMangle IN=eth0 OUT= MAC=00:50:ba:37:d8:5e:00:50:ba:37:d8:3e:08:00 SRC=192.168.2.3 DST=192.168.1.3 LEN=84 TOS=0x10 PREC=0x00 TTL=128 ID=49187 DF PROTO=TCP SPT=22 DPT=34265 WINDOW=5792 RES=0x00 ACK PSH URGP=0 
Jun 25 03:14:00 salesns kernel: FwdMangle IN=eth0 OUT=withvan SRC=192.168.2.3 DST=192.168.1.3 LEN=84 TOS=0x10 PREC=0x00 TTL=127 ID=49187 DF PROTO=TCP SPT=22 DPT=34265 WINDOW=5792 RES=0x00 ACK PSH URGP=0 
Jun 25 03:14:00 salesns kernel: Forward IN=eth0 OUT=withvan SRC=192.168.2.3 DST=192.168.1.3 LEN=84 TOS=0x10 PREC=0x00 TTL=127 ID=49187 DF PROTO=TCP SPT=22 DPT=34265 WINDOW=5792 RES=0x00 ACK PSH URGP=0 
Jun 25 03:14:00 salesns kernel: PreMangle IN=eth1 OUT= MAC=ff:fe:24:4b:c6:13:00:20:6f:0f:5f:40:08:00 SRC=152.2.210.81 DST=66.123.115.210 LEN=44 TOS=0x00 PREC=0x00 TTL=52 ID=0 DF PROTO=TCP SPT=21 DPT=32813 WINDOW=5840 RES=0x00 ACK SYN URGP=0 
^^^^^^^^^^^^^^
Jun 25 03:14:00 salesns kernel: PreMangle IN=eth1 OUT= MAC=ff:fe:24:4b:c6:13:00:20:6f:0f:5f:40:08:00 SRC=63.193.79.19 DST=66.123.115.210 LEN=76 TOS=0x00 PREC=0x00 TTL=251 ID=0 DF PROTO=47 
Jun 25 03:14:00 salesns kernel: PreMangle IN=withvan OUT= MAC=45:00:00:4c:00:00:40:00:fb:2f:3a:61:3f:c1:4f:13:42:7b:73:d2:00:00:08:00:45:10:00:34:4d:94:40:00:7f:06:29:c9:c0:a8 SRC=192.168.1.3 DST=192.168.2.3 LEN=52 TOS=0x10 PREC=0x00 TTL=127 ID=19860 DF PROTO=TCP SPT=34265 DPT=22 WINDOW=45568 RES=0x00 ACK URGP=0 
Jun 25 03:14:00 salesns kernel: FwdMangle IN=withvan OUT=eth0 SRC=192.168.1.3 DST=192.168.2.3 LEN=52 TOS=0x10 PREC=0x00 TTL=126 ID=19860 DF PROTO=TCP SPT=34265 DPT=22 WINDOW=45568 RES=0x00 ACK URGP=0 
Jun 25 03:14:00 salesns kernel: Forward IN=withvan OUT=eth0 SRC=192.168.1.3 DST=192.168.2.3 LEN=52 TOS=0x10 PREC=0x00 TTL=126 ID=19860 DF PROTO=TCP SPT=34265 DPT=22 WINDOW=45568 RES=0x00 ACK URGP=0 
Jun 25 03:14:00 salesns kernel: PreMangle IN=eth1 OUT= MAC=ff:fe:24:4b:c6:13:00:20:6f:0f:5f:40:08:00 SRC=63.193.79.19 DST=66.123.115.210 LEN=76 TOS=0x00 PREC=0x00 TTL=251 ID=0 DF PROTO=47 
Jun 25 03:14:00 salesns kernel: PreMangle IN=withvan OUT= MAC=45:00:00:4c:00:00:40:00:fb:2f:3a:61:3f:c1:4f:13:42:7b:73:d2:00:00:08:00:45:10:00:34:4d:95:40:00:7f:06:29:c8:c0:a8 SRC=192.168.1.3 DST=192.168.2.3 LEN=52 TOS=0x10 PREC=0x00 TTL=127 ID=19861 DF PROTO=TCP SPT=34265 DPT=22 WINDOW=45568 RES=0x00 ACK URGP=0 
Jun 25 03:14:00 salesns kernel: FwdMangle IN=withvan OUT=eth0 SRC=192.168.1.3 DST=192.168.2.3 LEN=52 TOS=0x10 PREC=0x00 TTL=126 ID=19861 DF PROTO=TCP SPT=34265 DPT=22 WINDOW=45568 RES=0x00 ACK URGP=0 
Jun 25 03:14:00 salesns kernel: Forward IN=withvan OUT=eth0 SRC=192.168.1.3 DST=192.168.2.3 LEN=52 TOS=0x10 PREC=0x00 TTL=126 ID=19861 DF PROTO=TCP SPT=34265 DPT=22 WINDOW=45568 RES=0x00 ACK URGP=0 
Jun 25 03:14:01 salesns kernel: PreMangle IN=eth1 OUT= MAC=ff:fe:24:4b:c6:13:00:20:6f:0f:5f:40:08:00 SRC=63.193.79.19 DST=66.123.115.210 LEN=108 TOS=0x00 PREC=0x00 TTL=251 ID=0 DF PROTO=47 
Jun 25 03:14:01 salesns kernel: PreMangle IN=withvan OUT= MAC=45:00:00:6c:00:00:40:00:fb:2f:3a:41:3f:c1:4f:13:42:7b:73:d2:00:00:08:00:45:10:00:54:fc:7a:40:00:7f:06:7a:c3:c0:a8 SRC=192.168.1.3 DST=192.168.2.2 LEN=84 TOS=0x10 PREC=0x00 TTL=127 ID=64634 DF PROTO=TCP SPT=34819 DPT=22 WINDOW=14112 RES=0x00 ACK PSH URGP=0 
Jun 25 03:14:01 salesns kernel: PreMangle IN=eth1 OUT= MAC=ff:fe:24:4b:c6:13:00:20:6f:0f:5f:40:08:00 SRC=63.193.79.19 DST=66.123.115.210 LEN=108 TOS=0x00 PREC=0x00 TTL=251 ID=0 DF PROTO=47 
Jun 25 03:14:01 salesns kernel: PreMangle IN=withvan OUT= MAC=45:00:00:6c:00:00:40:00:fb:2f:3a:41:3f:c1:4f:13:42:7b:73:d2:00:00:08:00:45:10:00:54:fc:7b:40:00:7f:06:7a:c2:c0:a8 SRC=192.168.1.3 DST=192.168.2.2 LEN=84 TOS=0x10 PREC=0x00 TTL=127 ID=64635 DF PROTO=TCP SPT=34819 DPT=22 WINDOW=14112 RES=0x00 ACK PSH URGP=0 
Jun 25 03:14:01 salesns kernel: PreMangle IN=eth1 OUT= MAC=ff:fe:24:4b:c6:13:00:20:6f:0f:5f:40:08:00 SRC=63.193.79.19 DST=66.123.115.210 LEN=76 TOS=0x00 PREC=0x00 TTL=251 ID=0 DF PROTO=47 
Jun 25 03:14:01 salesns kernel: PreMangle IN=withvan OUT= MAC=45:00:00:4c:00:00:40:00:fb:2f:3a:61:3f:c1:4f:13:42:7b:73:d2:00:00:08:00:45:10:00:34:fc:7c:40:00:7f:06:7a:e1:c0:a8 SRC=192.168.1.3 DST=192.168.2.2 LEN=52 TOS=0x10 PREC=0x00 TTL=127 ID=64636 DF PROTO=TCP SPT=34819 DPT=22 WINDOW=14112 RES=0x00 ACK URGP=0 
Jun 25 03:14:01 salesns kernel: PreMangle IN=eth1 OUT= MAC=ff:fe:24:4b:c6:13:00:20:6f:0f:5f:40:08:00 SRC=63.193.79.19 DST=66.123.115.210 LEN=76 TOS=0x00 PREC=0x00 TTL=251 ID=0 DF PROTO=47 
Jun 25 03:14:01 salesns kernel: PreMangle IN=withvan OUT= MAC=45:00:00:4c:00:00:40:00:fb:2f:3a:61:3f:c1:4f:13:42:7b:73:d2:00:00:08:00:45:10:00:34:fc:7d:40:00:7f:06:7a:e0:c0:a8 SRC=192.168.1.3 DST=192.168.2.2 LEN=52 TOS=0x10 PREC=0x00 TTL=127 ID=64637 DF PROTO=TCP SPT=34819 DPT=22 WINDOW=14112 RES=0x00 ACK URGP=0 
Jun 25 03:14:01 salesns kernel: PreMangle IN=eth1 OUT= MAC=ff:fe:24:4b:c6:13:00:20:6f:0f:5f:40:08:00 SRC=152.2.210.81 DST=66.123.115.210 LEN=44 TOS=0x00 PREC=0x00 TTL=52 ID=0 DF PROTO=TCP SPT=21 DPT=32813 WINDOW=5840 RES=0x00 ACK SYN URGP=0 
^^^^^^^^^^^^^^^^^^

I built the disk drive for the computer I'm having trouble with by
copying if from another system that works, and modifying the setup
tables, and removing services that aren't used. On the original system:

Jun 25 03:25:32 ns kernel: PreMangle IN=eth2 OUT= MAC=00:10:5a:60:3f:7f:00:10:67:00:b5:58:08:00 SRC=152.2.210.81 DST=63.193.79.19 LEN=44 TOS=0x00 PREC=0x00 TTL=53 ID=0 DF PROTO=TCP SPT=21 DPT=34823 WINDOW=5840 RES=0x00 ACK SYN URGP=0 
Jun 25 03:25:32 ns kernel: FwdMangle IN=eth2 OUT=eth0 SRC=152.2.210.81 DST=192.168.1.3 LEN=44 TOS=0x00 PREC=0x00 TTL=52 ID=0 DF PROTO=TCP SPT=21 DPT=34823 WINDOW=5840 RES=0x00 ACK SYN URGP=0 
Jun 25 03:25:32 ns kernel: Forward IN=eth2 OUT=eth0 SRC=152.2.210.81 DST=192.168.1.3 LEN=44 TOS=0x00 PREC=0x00 TTL=52 ID=0 DF PROTO=TCP SPT=21 DPT=34823 WINDOW=5840 RES=0x00 ACK SYN URGP=0 

These have identical kernels, identical scripts, different NICs,
different names, different connections to the same ISP. The ns kernel
has a name in our DNS on the internet, the salesns kernel does not
(except at the ISP). The ns kernel is our primary name and mail server,
and the other end of the tunnel between ns and salesns. It also handles
most of the NAT for the 196.168.1 LAN.

My theories are stupid, because I don't completely understand what
netfilter is doing, but right now it looks like the packet never gets to
the forward chain, and I don't know what is stopping it. Am I wrong that
mangle is the first step of the forward chain? Is there a way to see
what conntrack is doing?

Is there a way I can find out what happens to that packet after it goes
through mangle PREROUTING?

