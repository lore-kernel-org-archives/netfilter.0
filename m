From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: Newbie: why is this packet being dropped/logged?
Date: Mon, 4 Aug 2003 15:31:01 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15C030@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Jean-Christian Imbeault <jc@mega-bucks.co.jp>, netfilter@lists.netfilter.org

it's being dropped because you have allowed TCP port 80 on =
219.118.175.0/24 ONLY.. looking at your logs it shows the IP as =
DST=3D203.179.86.66 which isn't to that network..

HOW BIG is your network???

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

Phone   : +61 2 9955 2644
HelpDesk: +61 2 9955 2698
=20

-----Original Message-----
From: Jean-Christian Imbeault [mailto:jc@mega-bucks.co.jp]
Sent: Monday, August 04, 2003 3:12 PM
To: netfilter@lists.netfilter.org
Subject: Newbie: why is this packet being dropped/logged?


I am relatively new to iptables. I have set up some basic rules for my=20
web server to allow only SSH and HTTP traffic (listed below). But I am=20
finding some log entries showing packets that were trying to connect to=20
port 80 getting logged (and dropped).

I can't understand why these packets were logged as I thought my rules=20
would let through any packet trying to connect to port 80.

# iptables -n -v -L
Chain INPUT (policy DROP 279 packets, 14864 bytes)
  pkts bytes target     prot opt in     out     source=20
destination
   238 47040 ACCEPT     all  --  lo     *       0.0.0.0/0=20
0.0.0.0/0
  366M   21G ACCEPT     all  --  *      *       0.0.0.0/0=20
0.0.0.0/0          state RELATED,ESTABLISHED
2199K  120M ACCEPT     tcp  --  eth0   *       0.0.0.0/0=20
203.179.86.66      state NEW,RELATED,ESTABLISHED tcp dpt:80
    38  1824 ACCEPT     tcp  --  eth0   *       219.118.175.0/24=20
203.179.86.66      state NEW,RELATED,ESTABLISHED tcp dpt:22
     0     0 DROP       udp  --  *      *       0.0.0.0/0=20
0.0.0.0/0          udp dpt:67
     0     0 REJECT     tcp  --  *      *       0.0.0.0/0=20
0.0.0.0/0          tcp dpt:113 reject-with tcp-reset
     0     0 REJECT     udp  --  *      *       0.0.0.0/0=20
0.0.0.0/0          udp dpt:137 reject-with icmp-port-unreachable
     0     0 REJECT     udp  --  *      *       0.0.0.0/0=20
0.0.0.0/0          udp dpt:138 reject-with icmp-port-unreachable
     0     0 REJECT     tcp  --  *      *       0.0.0.0/0=20
0.0.0.0/0          tcp dpt:138 reject-with icmp-port-unreachable
     0     0 REJECT     udp  --  *      *       0.0.0.0/0=20
0.0.0.0/0          udp dpt:139 reject-with icmp-port-unreachable
   279 14864 LOG        all  --  *      *       0.0.0.0/0=20
0.0.0.0/0          LOG flags 0 level 7 prefix `DROP:'

Here is one of those log entries:

kernel: DROP:IN=3Deth0 OUT=3D =
MAC=3D00:d0:b7:e1:13:e7:00:90:fe:1e:50:a6:08:00=20
SRC=3D66.69.93.167 DST=3D203.179.86.66 LEN=3D40 TOS=3D0x00 PREC=3D0x00 =
TTL=3D105=20
ID=3D8622 DF PROTO=3DTCP SPT=3D1439 DPT=3D80 WINDOW=3D64952 RES=3D0x00 =
ACK URGP=3D0

Can someone help me understand why this packet was dropped?

Thanks,

Jean-Christian Imbeault



