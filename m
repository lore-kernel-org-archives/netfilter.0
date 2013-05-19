From: julioarr@fisica.uh.cu
Subject: about a LOG rule
Date: Sun, 19 May 2013 08:11:36 -0400
Message-ID: <ab378212c155fe05c806847dc5435193.squirrel@mail.fisica.uh.cu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello

What does this mean?

May 18 12:14:55 firewall kernel: [97390.813579] INPUT_ALL_ACCEPT_lo-1
IN=lo OUT= MAC=00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=10.0.0.2
DST=10.0.0.2 LEN=107 TOS=0x00 PREC=0xC0 TTL=64 ID=62342 PROTO=ICMP TYPE=3
CODE=1 [SRC=10.0.0.2 DST=173.194.69.108 LEN=79 TOS=0x00 PREC=0x00 TTL=64
ID=61005 DF PROTO=TCP SPT=38040 DPT=587 WINDOW=133 RES=0x00 ACK PSH FIN
URGP=0 ]


173.194.69.108=smtp.gmail.com

I have these rules:

iptables -A INPUT -i lo ! -s 127.0.0.1 -j LOG --log-prefix
"INPUT_ALL_ACCEPT_lo-1 "
iptables -A INPUT -i lo -j ACCEPT

And openvpn client configured with the interface:

tap1      Link encap:Ethernet  HWaddr e6:c9:1e:fe:bf:1b
          inet addr:10.0.0.2  Bcast:10.0.0.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:224580 errors:0 dropped:0 overruns:0 frame:0
          TX packets:242150 errors:0 dropped:43492 overruns:0 carrier:0
          collisions:0 txqueuelen:100
          RX bytes:35320350 (33.6 MiB)  TX bytes:87466562 (83.4 MiB)

Thanks in advanced,
julio


