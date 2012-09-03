From: void <void.sp@gmail.com>
Subject: RST packet considered invalid instead of de-SNAT
Date: Mon, 3 Sep 2012 11:42:21 +0400
Message-ID: <CAObecT=nX7cat8JPyOJvN1_On6w7FLWDkctbFrzEsoB6D51ycQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=4Fwpt1j8aZePcB3D1vQ7tVKe/xDZKSo2DYkEdMNA84U=;
        b=HgHDtv1z7Oem9HHwbZaY2GBMvnU9cFoTdWm9xuNeV4+NMQKeS1aa87p8cWlfFnHBF3
         ZXb4sz1H/Wb0m8OZw2WolLkHVi+NXaY/h/bv/aW+xD//S4Al+esqyk70bUJtMx5DkteA
         78+XOb80MInSCRUz8vgJRC5rV6CtO8wSLFnY/XE3R+sqpGb585DFSvc1wiY6Eti7gEvZ
         nPgy/TI0pyrGpIyK2Zy6YzYrglPx/76REgZynx+T3BwHlOgv1QltCQrIW0mCwFADWbew
         hzIM5hTbmA1SsRY91b78lPh2vQ5CqMtf3aWnRosh3rRwdgvSR7kwAnSeEWSAZ2oePvbG
         NgRA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello, everyone.

I've got a strange case of conntrack sorting an RST packet as invalid
- details below. Hope you can help me as I've hit my limit in
netfilter and network debugging tools. Or maybe that behaviour is by
design and ok...

If i'm not mistaken, it is the case of half-duplex tcp session
closing, when FIN -> ACK closes only one side of the connection. The
web-server sends FIN, the client ACKs, and then keeps the connection.
Some time later web-server sends RST, but it considered invalid by
conntrack. Is that normal?

I'd be very grateful for any advice with that.

Network setup for example below:
workstation 192.168.7.30 <==> linux router (ISP_NET_IP) SNAT <==> ISP
NAT <==> public web-server 217.20.147.94
ISP_NET_IP is an internal IP (10.0.0.0/8) in the ISP's network.

My SNAT rule:
 pkts bytes target     prot opt in     out     source
destination
 542K   45M SNAT       all  --  *      eth1    0.0.0.0/0
0.0.0.0/0           to:ISP_NET_IP

Below is the log which contains captured packets from tcpdump on both
internal and external interfaces of my router, conntrack events and
firewall logs in chronological order.

===

15:57:57.711772 IP (tos 0x0, ttl  56, id 21168, offset 0, flags [DF],
proto: TCP (6), length: 40) 217.20.147.94.80 > ISP_NET_IP.1113: .,
cksum 0x5840 (correct), 1:1(0) ack 2 win 7504
15:57:57.711796 IP (tos 0x0, ttl  55, id 21168, offset 0, flags [DF],
proto: TCP (6), length: 40) 217.20.147.94.80 > 192.168.7.30.1113: .,
cksum 0x9260 (correct), 1:1(0) ack 2 win 7504

15:58:16.559951 IP (tos 0x0, ttl  56, id 21169, offset 0, flags [DF],
proto: TCP (6), length: 40) 217.20.147.94.80 > ISP_NET_IP.1113: F,
cksum 0x583f (correct), 1:1(0) ack 2 win 7504
15:58:16.559983 IP (tos 0x0, ttl  55, id 21169, offset 0, flags [DF],
proto: TCP (6), length: 40) 217.20.147.94.80 > 192.168.7.30.1113: F,
cksum 0x925f (correct), 1:1(0) ack 2 win 7504

Fri Aug 31 15:58:16 MSD 2012  [UPDATE] tcp      6 120 FIN_WAIT
src=192.168.7.30 dst=217.20.147.94 sport=1113 dport=80
src=217.20.147.94 dst=ISP_NET_IP sport=80 dport=1113 [ASSURED]
mark=10240

15:58:16.560156 IP (tos 0x0, ttl 128, id 45580, offset 0, flags [DF],
proto: TCP (6), length: 40) 192.168.7.30.1113 > 217.20.147.94.80: .,
cksum 0xb151 (correct), 2:2(0) ack 2 win 65117
15:58:16.560190 IP (tos 0x0, ttl 127, id 45580, offset 0, flags [DF],
proto: TCP (6), length: 40) ISP_NET_IP.1113 > 217.20.147.94.80: .,
cksum 0x7731 (correct), 2:2(0) ack 2 win 65117

Fri Aug 31 15:58:16 MSD 2012  [UPDATE] tcp      6 59 CLOSE_WAIT
src=192.168.7.30 dst=217.20.147.94 sport=1113 dport=80
src=217.20.147.94 dst=ISP_NET_IP sport=80 dport=1113 [ASSURED]
mark=10240

15:58:46.536688 IP (tos 0x0, ttl  56, id 0, offset 0, flags [DF],
proto: TCP (6), length: 40) 217.20.147.94.80 > ISP_NET_IP.1113: R,
cksum 0xa0d2 (correct), 3495152567:3495152567(0) win 0

Aug 31 15:58:46 efw-gate ulogd[3368]: nf_ct_tcp: invalid RST  IN= OUT=
MAC= SRC=217.20.147.94 DST=ISP_NET_IP LEN=40 TOS=00 PREC=0x00 TTL=56
ID=0 DF PROTO=TCP SPT=80 DPT=1113 SEQ=3495152567 ACK=0 WINDOW=0 RST
URGP=0 MARK=0

Aug 31 15:58:47 efw-gate ulogd[3368]: INPUT:DROP IN=eth1 OUT=
MAC=90:2b:34:13:ad:eb:00:21:a0:ce:05:d9:08:00 SRC=217.20.147.94
DST=ISP_NET_IP LEN=40 TOS=00 PREC=0x00 TTL=56 ID=0 DF PROTO=TCP SPT=80
DPT=1113 SEQ=3495152567 ACK=0 WINDOW=0 RST URGP=0 MARK=0

Fri Aug 31 15:59:16 MSD 2012 [DESTROY] tcp      6 src=192.168.7.30
dst=217.20.147.94 sport=1113 dport=80 packets=17 bytes=1718
src=217.20.147.94 dst=ISP_NET_IP sport=80 dport=1113 packets=25
bytes=1426 [ASSURED] mark=10240

15:59:21.343312 IP (tos 0x0, ttl 128, id 46751, offset 0, flags [DF],
proto: TCP (6), length: 40) 192.168.7.30.1113 > 217.20.147.94.80: F,
cksum 0xb150 (correct), 2:2(0) ack 2 win 65117

Aug 31 15:59:22 efw-gate ulogd[3368]: FORWARD:DROP IN=br0 OUT=eth1
MAC=90:e2:ba:16:b4:38:6c:62:6d:b1:68:c5:08:00 SRC=192.168.7.30
DST=217.20.147.94 LEN=40 TOS=00 PREC=0x00 TTL=127 ID=46751 DF
PROTO=TCP SPT=1113 DPT=80 SEQ=1793310802 ACK=3495152568 WINDOW=65117
ACK FIN URGP=0 MARK=0

15:59:23.334642 IP (tos 0x0, ttl 128, id 46808, offset 0, flags [DF],
proto: TCP (6), length: 40) 192.168.7.30.1113 > 217.20.147.94.80: F,
cksum 0xb150 (correct), 2:2(0) ack 2 win 65117

Aug 31 15:59:24 efw-gate ulogd[3368]: FORWARD:DROP IN=br0 OUT=eth1
MAC=90:e2:ba:16:b4:38:6c:62:6d:b1:68:c5:08:00 SRC=192.168.7.30
DST=217.20.147.94 LEN=40 TOS=00 PREC=0x00 TTL=127 ID=46808 DF
PROTO=TCP SPT=1113 DPT=80 SEQ=1793310802 ACK=3495152568 WINDOW=65117
ACK FIN URGP=0 MARK=0

15:59:27.358241 IP (tos 0x0, ttl 128, id 46861, offset 0, flags [DF],
proto: TCP (6), length: 40) 192.168.7.30.1113 > 217.20.147.94.80: F,
cksum 0xb150 (correct), 2:2(0) ack 2 win 65117

Aug 31 15:59:28 efw-gate ulogd[3368]: FORWARD:DROP IN=br0 OUT=eth1
MAC=90:e2:ba:16:b4:38:6c:62:6d:b1:68:c5:08:00 SRC=192.168.7.30
DST=217.20.147.94 LEN=40 TOS=00 PREC=0x00 TTL=127 ID=46861 DF
PROTO=TCP SPT=1113 DPT=80 SEQ=1793310802 ACK=3495152568 WINDOW=65117
ACK FIN URGP=0 MARK=0

15:59:35.404072 IP (tos 0x0, ttl 128, id 47033, offset 0, flags [DF],
proto: TCP (6), length: 40) 192.168.7.30.1113 > 217.20.147.94.80: F,
cksum 0xb150 (correct), 2:2(0) ack 2 win 65117

Aug 31 15:59:36 efw-gate ulogd[3368]: FORWARD:DROP IN=br0 OUT=eth1
MAC=90:e2:ba:16:b4:38:6c:62:6d:b1:68:c5:08:00 SRC=192.168.7.30
DST=217.20.147.94 LEN=40 TOS=00 PREC=0x00 TTL=127 ID=47033 DF
PROTO=TCP SPT=1113 DPT=80 SEQ=1793310802 ACK=3495152568 WINDOW=65117
ACK FIN URGP=0 MARK=0

15:59:51.397374 IP (tos 0x0, ttl 128, id 47381, offset 0, flags [DF],
proto: TCP (6), length: 40) 192.168.7.30.1113 > 217.20.147.94.80: F,
cksum 0xb150 (correct), 2:2(0) ack 2 win 65117

Aug 31 15:59:52 efw-gate ulogd[3368]: FORWARD:DROP IN=br0 OUT=eth1
MAC=90:e2:ba:16:b4:38:6c:62:6d:b1:68:c5:08:00 SRC=192.168.7.30
DST=217.20.147.94 LEN=40 TOS=00 PREC=0x00 TTL=127 ID=47381 DF
PROTO=TCP SPT=1113 DPT=80 SEQ=1793310802 ACK=3495152568 WINDOW=65117
ACK FIN URGP=0 MARK=0

16:00:23.383985 IP (tos 0x0, ttl 128, id 48061, offset 0, flags [DF],
proto: TCP (6), length: 40) 192.168.7.30.1113 > 217.20.147.94.80: F,
cksum 0xb150 (correct), 2:2(0) ack 2 win 65117

Aug 31 16:00:24 efw-gate ulogd[3368]: FORWARD:DROP IN=br0 OUT=eth1
MAC=90:e2:ba:16:b4:38:6c:62:6d:b1:68:c5:08:00 SRC=192.168.7.30
DST=217.20.147.94 LEN=40 TOS=00 PREC=0x00 TTL=127 ID=48061 DF
PROTO=TCP SPT=1113 DPT=80 SEQ=1793310802 ACK=3495152568 WINDOW=65117
ACK FIN URGP=0 MARK=0

===

  -- void
