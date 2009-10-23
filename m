From: Carl Michal <michal@physics.ubc.ca>
Subject: Re: ssh connections stalling
Date: Fri, 23 Oct 2009 15:22:01 -0700 (PDT)
Message-ID: <alpine.LNX.2.00.0910231452220.18617@spider.phas.ubc.ca>
References: <alpine.LNX.2.00.0910221138180.21365@spider.phas.ubc.ca> <4AE163B6.9040706@chello.at> <alpine.LNX.2.00.0910230951060.13472@spider.phas.ubc.ca> <alpine.DEB.2.00.0910232003430.8539@blackhole.kfki.hu> <alpine.LNX.2.00.0910231253290.18617@spider.phas.ubc.ca>
 <alpine.DEB.2.00.0910232341100.9251@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.0910232341100.9251@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

> Log the INVALID packets. Also, it'd be good if you could capture them by
> tcpdump (please use the -Sv options at least).
>

just discovered that if ip_conntrack_tcp_be_liberal is set to 1, my 
problem also goes away.

Here's the whole connection (with be_liberal=0):

in syslog (with tcp sequence numbers logged):

Oct 23 15:00:30 spider IN=eth0 OUT= MAC=00:1c:c0:72:48:e9:00:11:bb:09:36:80:08:00 SRC=128.189.212.241 DST=142.103.235.177 LEN=64 TOS=0x10 PREC=0x00 TTL=63 ID=35028 DF PROTO=TCP SPT=46294 DPT=22 SEQ=3104782063 ACK=4116444452 WINDOW=538 RES=0x00 ACK URGP=0
Oct 23 15:00:32 spider IN=eth0 OUT= MAC=00:1c:c0:72:48:e9:00:11:bb:09:36:80:08:00 SRC=128.189.212.241 DST=142.103.235.177 LEN=64 TOS=0x10 PREC=0x00 TTL=63 ID=35039 DF PROTO=TCP SPT=46294 DPT=22 SEQ=3104784591 ACK=4116460924 WINDOW=997 RES=0x00 ACK URGP=0
Oct 23 15:00:32 spider IN=eth0 OUT= MAC=00:1c:c0:72:48:e9:00:11:bb:09:36:80:08:00 SRC=128.189.212.241 DST=142.103.235.177 LEN=64 TOS=0x10 PREC=0x00 TTL=63 ID=35040 DF PROTO=TCP SPT=46294 DPT=22 SEQ=3104784591 ACK=4116462292 WINDOW=976 RES=0x00 ACK URGP=0
Oct 23 15:00:32 spider IN=eth0 OUT= MAC=00:1c:c0:72:48:e9:00:11:bb:09:36:80:08:00 SRC=128.189.212.241 DST=142.103.235.177 LEN=64 TOS=0x10 PREC=0x00 TTL=63 ID=35057 DF PROTO=TCP SPT=46294 DPT=22 SEQ=3104784719 ACK=4116486980 WINDOW=1002 RES=0x00 ACK URGP=0
Oct 23 15:00:32 spider IN=eth0 OUT= MAC=00:1c:c0:72:48:e9:00:11:bb:09:36:80:08:00 SRC=128.189.212.241 DST=142.103.235.177 LEN=64 TOS=0x10 PREC=0x00 TTL=63 ID=35058 DF PROTO=TCP SPT=46294 DPT=22 SEQ=3104784719 ACK=4116486980 WINDOW=1002 RES=0x00 ACK URGP=0
Oct 23 15:00:32 spider IN=eth0 OUT= MAC=00:1c:c0:72:48:e9:00:11:bb:09:36:80:08:00 SRC=128.189.212.241 DST=142.103.235.177 LEN=64 TOS=0x10 PREC=0x00 TTL=63 ID=35059 DF PROTO=TCP SPT=46294 DPT=22 SEQ=3104784719 ACK=4116486980 WINDOW=1002 RES=0x00 ACK URGP=0
Oct 23 15:00:32 spider IN=eth0 OUT= MAC=00:1c:c0:72:48:e9:00:11:bb:09:36:80:08:00 SRC=128.189.212.241 DST=142.103.235.177 LEN=64 TOS=0x10 PREC=0x00 TTL=63 ID=35060 DF PROTO=TCP SPT=46294 DPT=22 SEQ=3104784719 ACK=4116486980 WINDOW=1002 RES=0x00 ACK URGP=0  and with tcpdump -Sv I see:

and tcpdump -Sv shows
tcpdump: listening on eth0, link-type EN10MB (Ethernet), capture size 68 bytes
15:00:26.839973 IP (tos 0x0, ttl 63, id 34989, offset 0, flags [DF], proto TCP (6), length 60) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: S 3104774279:3104774279(0) win 5840 <mss 1380,[|tcp]>
15:00:26.840009 IP (tos 0x0, ttl 64, id 0, offset 0, flags [DF], proto TCP (6), length 60) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: S 4116431886:4116431886(0) ack 3104774280 win 5792 <mss 1460,[|tcp]>15:00:26.841672 IP (tos 0x0, ttl 63, id 34990, offset 0, flags [DF], proto TCP (6), length 52) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116431887 win 92 <nop,nop,timestamp[|tcp]>
15:00:26.844884 IP (tos 0x0, ttl 64, id 60271, offset 0, flags [DF], proto TCP (6), length 73) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: P 4116431887:4116431908(21) ack 3104774280 win 46 <nop,nop,timestamp[|tcp]>
15:00:26.846414 IP (tos 0x0, ttl 63, id 34991, offset 0, flags [DF], proto TCP (6), length 52) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116431908 win 92 <nop,nop,timestamp[|tcp]>
15:00:26.846684 IP (tos 0x0, ttl 63, id 34992, offset 0, flags [DF], proto TCP (6), length 91) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: P 3104774280:3104774319(39) ack 4116431908 win 92 <nop,nop,timestamp[|tcp]>
15:00:26.846713 IP (tos 0x0, ttl 64, id 60272, offset 0, flags [DF], proto TCP (6), length 52) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: . ack 3104774319 win 46 <nop,nop,timestamp[|tcp]>
15:00:26.847090 IP (tos 0x0, ttl 64, id 60273, offset 0, flags [DF], proto TCP (6), length 836) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: P 4116431908:4116432692(784) ack 3104774319 win 46 <nop,nop,timestamp[|tcp]>
15:00:26.848785 IP (tos 0x0, ttl 63, id 34993, offset 0, flags [DF], proto TCP (6), length 844) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: P 3104774319:3104775111(792) ack 4116431908 win 92 <nop,nop,timestamp[|tcp]>
15:00:26.885134 IP (tos 0x0, ttl 64, id 60274, offset 0, flags [DF], proto TCP (6), length 52) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: . ack 3104775111 win 58 <nop,nop,timestamp[|tcp]>
15:00:26.886894 IP (tos 0x0, ttl 63, id 34994, offset 0, flags [DF], proto TCP (6), length 76) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: P 3104775111:3104775135(24) ack 4116432692 win 116 <nop,nop,timestamp[|tcp]>
15:00:26.886919 IP (tos 0x0, ttl 64, id 60275, offset 0, flags [DF], proto TCP (6), length 52) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: . ack 3104775135 win 58 <nop,nop,timestamp[|tcp]>
15:00:26.888195 IP (tos 0x0, ttl 64, id 60276, offset 0, flags [DF], proto TCP (6), length 204) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: P 4116432692:4116432844(152) ack 3104775135 win 58 <nop,nop,timestamp[|tcp]>
15:00:26.900535 IP (tos 0x0, ttl 63, id 34995, offset 0, flags [DF], proto TCP (6), length 196) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: P 3104775135:3104775279(144) ack 4116432844 win 141 <nop,nop,timestamp[|tcp]>
15:00:26.905993 IP (tos 0x0, ttl 64, id 60277, offset 0, flags [DF], proto TCP (6), length 772) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: P 4116432844:4116433564(720) ack 3104775279 win 70 <nop,nop,timestamp[|tcp]>
15:00:26.923093 IP (tos 0x0, ttl 63, id 34996, offset 0, flags [DF], proto TCP (6), length 68) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: P 3104775279:3104775295(16) ack 4116433564 win 165 <nop,nop,timestamp[|tcp]>
15:00:26.961125 IP (tos 0x0, ttl 64, id 60278, offset 0, flags [DF], proto TCP (6), length 52) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: . ack 3104775295 win 70 <nop,nop,timestamp[|tcp]>
15:00:26.962709 IP (tos 0x0, ttl 63, id 34997, offset 0, flags [DF], proto TCP (6), length 100) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: P 3104775295:3104775343(48) ack 4116433564 win 165 <nop,nop,timestamp[|tcp]>
15:00:26.962743 IP (tos 0x0, ttl 64, id 60279, offset 0, flags [DF], proto TCP (6), length 52) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: . ack 3104775343 win 70 <nop,nop,timestamp[|tcp]>
15:00:26.962794 IP (tos 0x0, ttl 64, id 60280, offset 0, flags [DF], proto TCP (6), length 100) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: P 4116433564:4116433612(48) ack 3104775343 win 70 <nop,nop,timestamp[|tcp]>
15:00:26.970068 IP (tos 0x0, ttl 63, id 34998, offset 0, flags [DF], proto TCP (6), length 116) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: P 3104775343:3104775407(64) ack 4116433612 win 165 <nop,nop,timestamp[|tcp]>
15:00:26.971797 IP (tos 0x0, ttl 64, id 60281, offset 0, flags [DF], proto TCP (6), length 116) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: P 4116433612:4116433676(64) ack 3104775407 win 70 <nop,nop,timestamp[|tcp]>
15:00:26.973716 IP (tos 0x0, ttl 63, id 34999, offset 0, flags [DF], proto TCP (6), length 148) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: P 3104775407:3104775503(96) ack 4116433676 win 165 <nop,nop,timestamp[|tcp]>
15:00:26.974232 IP (tos 0x0, ttl 64, id 60282, offset 0, flags [DF], proto TCP (6), length 116) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: P 4116433676:4116433740(64) ack 3104775503 win 70 <nop,nop,timestamp[|tcp]>
15:00:27.013591 IP (tos 0x0, ttl 63, id 35000, offset 0, flags [DF], proto TCP (6), length 52) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116433740 win 165 <nop,nop,timestamp[|tcp]>
15:00:29.198673 IP (tos 0x0, ttl 63, id 35001, offset 0, flags [DF], proto TCP (6), length 132) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: P 3104775503:3104775583(80) ack 4116433740 win 165 <nop,nop,timestamp[|tcp]>
15:00:29.199568 IP (tos 0x0, ttl 64, id 60283, offset 0, flags [DF], proto TCP (6), length 100) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: P 4116433740:4116433788(48) ack 3104775583 win 70 <nop,nop,timestamp[|tcp]>
15:00:29.201076 IP (tos 0x0, ttl 63, id 35002, offset 0, flags [DF], proto TCP (6), length 52) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116433788 win 165 <nop,nop,timestamp[|tcp]>
15:00:29.201303 IP (tos 0x0, ttl 63, id 35003, offset 0, flags [DF], proto TCP (6), length 132) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: P 3104775583:3104775663(80) ack 4116433788 win 165 <nop,nop,timestamp[|tcp]>
15:00:29.201406 IP (tos 0x0, ttl 64, id 60284, offset 0, flags [DF], proto TCP (6), length 84) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: P 4116433788:4116433820(32) ack 3104775663 win 70 <nop,nop,timestamp[|tcp]>
15:00:29.203421 IP (tos 0x0, ttl 63, id 35004, offset 0, flags [DF], proto TCP (6), length 180) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: P 3104775663:3104775791(128) ack 4116433820 win 165 <nop,nop,timestamp[|tcp]>
15:00:29.210426 IP (tos 0x0, ttl 64, id 60285, offset 0, flags [DF], proto TCP (6), length 100) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: P 4116433820:4116433868(48) ack 3104775791 win 83 <nop,nop,timestamp[|tcp]>
15:00:29.218506 IP (tos 0x0, ttl 63, id 35005, offset 0, flags [DF], proto TCP (6), length 164) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: P 3104775791:3104775903(112) ack 4116433868 win 165 <nop,nop,timestamp[|tcp]>
15:00:29.218631 IP (tos 0x10, ttl 63, id 35006, offset 0, flags [DF], proto TCP (6), length 180) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: P 3104775903:3104776031(128) ack 4116433868 win 165 <nop,nop,timestamp[|tcp]>
15:00:29.220304 IP (tos 0x0, ttl 64, id 60286, offset 0, flags [DF], proto TCP (6), length 52) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: . ack 3104776031 win 95 <nop,nop,timestamp[|tcp]>
15:00:29.222969 IP (tos 0x10, ttl 64, id 60287, offset 0, flags [DF], proto TCP (6), length 132) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: P 4116433868:4116433948(80) ack 3104776031 win 95 <nop,nop,timestamp[|tcp]>
15:00:29.247528 IP (tos 0x10, ttl 64, id 60288, offset 0, flags [DF], proto TCP (6), length 116) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: P 4116433948:4116434012(64) ack 3104776031 win 95 <nop,nop,timestamp[|tcp]>
15:00:29.249106 IP (tos 0x10, ttl 63, id 35007, offset 0, flags [DF], proto TCP (6), length 52) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116434012 win 165 <nop,nop,timestamp[|tcp]>
15:00:29.249937 IP (tos 0x10, ttl 63, id 35008, offset 0, flags [DF], proto TCP (6), length 196) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: P 3104776031:3104776175(144) ack 4116434012 win 165 <nop,nop,timestamp[|tcp]>
15:00:29.250044 IP (tos 0x10, ttl 64, id 60289, offset 0, flags [DF], proto TCP (6), length 180) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: P 4116434012:4116434140(128) ack 3104776175 win 108 <nop,nop,timestamp[|tcp]>
15:00:29.252007 IP (tos 0x10, ttl 63, id 35009, offset 0, flags [DF], proto TCP (6), length 196) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: P 3104776175:3104776319(144) ack 4116434140 win 190 <nop,nop,timestamp[|tcp]>
15:00:29.252097 IP (tos 0x10, ttl 64, id 60290, offset 0, flags [DF], proto TCP (6), length 196) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: P 4116434140:4116434284(144) ack 3104776319 win 120 <nop,nop,timestamp[|tcp]>
15:00:29.254095 IP (tos 0x10, ttl 63, id 35010, offset 0, flags [DF], proto TCP (6), length 196) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: P 3104776319:3104776463(144) ack 4116434284 win 214 <nop,nop,timestamp[|tcp]>
15:00:29.254177 IP (tos 0x10, ttl 64, id 60291, offset 0, flags [DF], proto TCP (6), length 164) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: P 4116434284:4116434396(112) ack 3104776463 win 132 <nop,nop,timestamp[|tcp]>
15:00:29.257360 IP (tos 0x10, ttl 63, id 35011, offset 0, flags [DF], proto TCP (6), length 1420) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . 3104776463:3104777831(1368) ack 4116434396 win 214 <nop,nop,timestamp[|tcp]>
15:00:29.258009 IP (tos 0x10, ttl 63, id 35012, offset 0, flags [DF], proto TCP (6), length 1420) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . 3104777831:3104779199(1368) ack 4116434396 win 214 <nop,nop,timestamp[|tcp]>
15:00:29.258015 IP (tos 0x10, ttl 64, id 60292, offset 0, flags [DF], proto TCP (6), length 52) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: . ack 3104779199 win 178 <nop,nop,timestamp[|tcp]>
15:00:29.258587 IP (tos 0x10, ttl 63, id 35013, offset 0, flags [DF], proto TCP (6), length 1420) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . 3104779199:3104780567(1368) ack 4116434396 win 214 <nop,nop,timestamp[|tcp]>
15:00:29.258910 IP (tos 0x10, ttl 63, id 35014, offset 0, flags [DF], proto TCP (6), length 988) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: P 3104780567:3104781503(936) ack 4116434396 win 214 <nop,nop,timestamp[|tcp]>
15:00:29.258918 IP (tos 0x10, ttl 64, id 60293, offset 0, flags [DF], proto TCP (6), length 52) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: . ack 3104781503 win 222 <nop,nop,timestamp[|tcp]>
15:00:29.259154 IP (tos 0x10, ttl 64, id 60294, offset 0, flags [DF], proto TCP (6), length 164) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: P 4116434396:4116434508(112) ack 3104781503 win 222 <nop,nop,timestamp[|tcp]>
15:00:29.260794 IP (tos 0x10, ttl 63, id 35015, offset 0, flags [DF], proto TCP (6), length 196) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: P 3104781503:3104781647(144) ack 4116434508 win 214 <nop,nop,timestamp[|tcp]>
15:00:29.260915 IP (tos 0x10, ttl 64, id 60295, offset 0, flags [DF], proto TCP (6), length 164) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: P 4116434508:4116434620(112) ack 3104781647 win 243 <nop,nop,timestamp[|tcp]>
15:00:29.277432 IP (tos 0x10, ttl 63, id 35016, offset 0, flags [DF], proto TCP (6), length 196) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: P 3104781647:3104781791(144) ack 4116434620 win 214 <nop,nop,timestamp[|tcp]>
15:00:29.277508 IP (tos 0x10, ttl 64, id 60296, offset 0, flags [DF], proto TCP (6), length 164) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: P 4116434620:4116434732(112) ack 3104781791 win 264 <nop,nop,timestamp[|tcp]>
15:00:29.316995 IP (tos 0x10, ttl 63, id 35017, offset 0, flags [DF], proto TCP (6), length 52) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116434732 win 214 <nop,nop,timestamp[|tcp]>
15:00:29.654660 IP (tos 0x10, ttl 63, id 35018, offset 0, flags [DF], proto TCP (6), length 196) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: P 3104781791:3104781935(144) ack 4116434732 win 214 <nop,nop,timestamp[|tcp]>
15:00:29.693153 IP (tos 0x10, ttl 64, id 60297, offset 0, flags [DF], proto TCP (6), length 52) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: . ack 3104781935 win 286 <nop,nop,timestamp[|tcp]>
15:00:29.702027 IP (tos 0x10, ttl 64, id 60298, offset 0, flags [DF], proto TCP (6), length 196) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: P 4116434732:4116434876(144) ack 3104781935 win 286 <nop,nop,timestamp[|tcp]>
15:00:29.703795 IP (tos 0x10, ttl 63, id 35019, offset 0, flags [DF], proto TCP (6), length 52) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116434876 win 239 <nop,nop,timestamp[|tcp]>
15:00:29.902835 IP (tos 0x10, ttl 63, id 35020, offset 0, flags [DF], proto TCP (6), length 180) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: P 3104781935:3104782063(128) ack 4116434876 win 239 <nop,nop,timestamp[|tcp]>
15:00:29.902863 IP (tos 0x10, ttl 64, id 60299, offset 0, flags [DF], proto TCP (6), length 52) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: . ack 3104782063 win 307 <nop,nop,timestamp[|tcp]>
15:00:30.314104 IP (tos 0x10, ttl 64, id 60300, offset 0, flags [DF], proto TCP (6), length 5524) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: . 4116434876:4116440348(5472) ack 3104782063 win 307 <nop,nop,timestamp[|tcp]>
15:00:30.321993 IP (tos 0x10, ttl 63, id 35021, offset 0, flags [DF], proto TCP (6), length 52) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116436244 win 281 <nop,nop,timestamp[|tcp]>
15:00:30.322087 IP (tos 0x10, ttl 63, id 35022, offset 0, flags [DF], proto TCP (6), length 52) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116437612 win 324 <nop,nop,timestamp[|tcp]>
15:00:30.322098 IP (tos 0x10, ttl 64, id 60304, offset 0, flags [DF], proto TCP (6), length 4156) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: . 4116440348:4116444452(4104) ack 3104782063 win 307 <nop,nop,timestamp[|tcp]>
15:00:30.323246 IP (tos 0x10, ttl 63, id 35023, offset 0, flags [DF], proto TCP (6), length 52) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116438980 win 367 <nop,nop,timestamp[|tcp]>
15:00:30.323255 IP (tos 0x10, ttl 64, id 60307, offset 0, flags [DF], proto TCP (6), length 1420) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: . 4116444452:4116445820(1368) ack 3104782063 win 307 <nop,nop,timestamp[|tcp]>
15:00:30.323259 IP (tos 0x10, ttl 64, id 60308, offset 0, flags [DF], proto TCP (6), length 196) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: P 4116445820:4116445964(144) ack 3104782063 win 307 <nop,nop,timestamp[|tcp]>
15:00:30.323368 IP (tos 0x10, ttl 63, id 35024, offset 0, flags [DF], proto TCP (6), length 52) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116440348 win 410 <nop,nop,timestamp[|tcp]>
15:00:30.324447 IP (tos 0x10, ttl 63, id 35025, offset 0, flags [DF], proto TCP (6), length 52) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116441716 win 452 <nop,nop,timestamp[|tcp]>
15:00:30.324562 IP (tos 0x10, ttl 63, id 35026, offset 0, flags [DF], proto TCP (6), length 52) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116443084 win 495 <nop,nop,timestamp[|tcp]>
15:00:30.325419 IP (tos 0x10, ttl 63, id 35027, offset 0, flags [DF], proto TCP (6), length 52) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116444452 win 538 <nop,nop,timestamp[|tcp]>
15:00:30.325530 IP (tos 0x10, ttl 63, id 35028, offset 0, flags [DF], proto TCP (6), length 64) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116444452 win 538 <nop,nop,timestamp[|tcp]>
15:00:30.326696 IP (tos 0x10, ttl 63, id 35029, offset 0, flags [DF], proto TCP (6), length 52) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116445964 win 581 <nop,nop,timestamp[|tcp]>
15:00:32.292880 IP (tos 0x10, ttl 63, id 35031, offset 0, flags [DF], proto TCP (6), length 236) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: P 3104783431:3104783615(184) ack 4116445964 win 581 <nop,nop,timestamp[|tcp]>
15:00:32.292905 IP (tos 0x10, ttl 64, id 60309, offset 0, flags [DF], proto TCP (6), length 64) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: . ack 3104782063 win 307 <nop,nop,timestamp[|tcp]>
15:00:32.292955 IP (tos 0x10, ttl 63, id 35030, offset 0, flags [DF], proto TCP (6), length 1420) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . 3104782063:3104783431(1368) ack 4116445964 win 581 <nop,nop,timestamp[|tcp]>
15:00:32.292965 IP (tos 0x10, ttl 64, id 60310, offset 0, flags [DF], proto TCP (6), length 52) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: . ack 3104783615 win 330 <nop,nop,timestamp[|tcp]>
15:00:32.293430 IP (tos 0x10, ttl 64, id 60311, offset 0, flags [DF], proto TCP (6), length 1332) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: P 4116445964:4116447244(1280) ack 3104783615 win 330 <nop,nop,timestamp[|tcp]>
15:00:32.295312 IP (tos 0x10, ttl 63, id 35032, offset 0, flags [DF], proto TCP (6), length 52) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116447244 win 623 <nop,nop,timestamp[|tcp]>
15:00:32.313336 IP (tos 0x10, ttl 63, id 35033, offset 0, flags [DF], proto TCP (6), length 1028) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: P 3104783615:3104784591(976) ack 4116447244 win 623 <nop,nop,timestamp[|tcp]>
15:00:32.314772 IP (tos 0x10, ttl 64, id 60312, offset 0, flags [DF], proto TCP (6), length 5524) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: . 4116447244:4116452716(5472) ack 3104784591 win 351 <nop,nop,timestamp[|tcp]>
15:00:32.317556 IP (tos 0x10, ttl 63, id 35034, offset 0, flags [DF], proto TCP (6), length 52) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116449980 win 709 <nop,nop,timestamp[|tcp]>
15:00:32.317572 IP (tos 0x10, ttl 64, id 60316, offset 0, flags [DF], proto TCP (6), length 4156) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: . 4116452716:4116456820(4104) ack 3104784591 win 351 <nop,nop,timestamp[|tcp]>
15:00:32.318845 IP (tos 0x10, ttl 63, id 35035, offset 0, flags [DF], proto TCP (6), length 52) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116452716 win 794 <nop,nop,timestamp[|tcp]>
15:00:32.318854 IP (tos 0x10, ttl 64, id 60319, offset 0, flags [DF], proto TCP (6), length 4156) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: . 4116456820:4116460924(4104) ack 3104784591 win 351 <nop,nop,timestamp[|tcp]>
15:00:32.320194 IP (tos 0x10, ttl 63, id 35036, offset 0, flags [DF], proto TCP (6), length 52) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116455452 win 880 <nop,nop,timestamp[|tcp]>
15:00:32.320215 IP (tos 0x10, ttl 64, id 60322, offset 0, flags [DF], proto TCP (6), length 2788) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: . 4116460924:4116463660(2736) ack 3104784591 win 351 <nop,nop,timestamp[|tcp]>
15:00:32.320220 IP (tos 0x10, ttl 64, id 60324, offset 0, flags [DF], proto TCP (6), length 116) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: P 4116463660:4116463724(64) ack 3104784591 win 351 <nop,nop,timestamp[|tcp]>
15:00:32.321353 IP (tos 0x10, ttl 63, id 35037, offset 0, flags [DF], proto TCP (6), length 52) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116458188 win 965 <nop,nop,timestamp[|tcp]>
15:00:32.321363 IP (tos 0x10, ttl 64, id 60325, offset 0, flags [DF], proto TCP (6), length 4156) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: . 4116463724:4116467828(4104) ack 3104784591 win 351 <nop,nop,timestamp[|tcp]>
15:00:32.322482 IP (tos 0x10, ttl 63, id 35038, offset 0, flags [DF], proto TCP (6), length 52) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116460924 win 997 <nop,nop,timestamp[|tcp]>
15:00:32.322488 IP (tos 0x10, ttl 64, id 60328, offset 0, flags [DF], proto TCP (6), length 4156) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: . 4116467828:4116471932(4104) ack 3104784591 win 351 <nop,nop,timestamp[|tcp]>
15:00:32.322598 IP (tos 0x10, ttl 63, id 35039, offset 0, flags [DF], proto TCP (6), length 64) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116460924 win 997 <nop,nop,timestamp[|tcp]>
15:00:32.323070 IP (tos 0x10, ttl 63, id 35040, offset 0, flags [DF], proto TCP (6), length 64) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116462292 win 976 <nop,nop,timestamp[|tcp]>
15:00:32.323785 IP (tos 0x10, ttl 63, id 35041, offset 0, flags [DF], proto TCP (6), length 52) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116463724 win 970 <nop,nop,timestamp[|tcp]>
15:00:32.323794 IP (tos 0x10, ttl 64, id 60331, offset 0, flags [DF], proto TCP (6), length 5524) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: . 4116471932:4116477404(5472) ack 3104784591 win 351 <nop,nop,timestamp[|tcp]>
15:00:32.324041 IP (tos 0x10, ttl 63, id 35042, offset 0, flags [DF], proto TCP (6), length 52) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116465092 win 997 <nop,nop,timestamp[|tcp]>
15:00:32.324064 IP (tos 0x10, ttl 64, id 60335, offset 0, flags [DF], proto TCP (6), length 2788) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: . 4116477404:4116480140(2736) ack 3104784591 win 351 <nop,nop,timestamp[|tcp]>
15:00:32.324568 IP (tos 0x10, ttl 63, id 35043, offset 0, flags [DF], proto TCP (6), length 52) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116466460 win 997 <nop,nop,timestamp[|tcp]>
15:00:32.325436 IP (tos 0x10, ttl 63, id 35044, offset 0, flags [DF], proto TCP (6), length 52) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116467828 win 997 <nop,nop,timestamp[|tcp]>
15:00:32.325716 IP (tos 0x10, ttl 63, id 35045, offset 0, flags [DF], proto TCP (6), length 52) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116469196 win 997 <nop,nop,timestamp[|tcp]>
15:00:32.325724 IP (tos 0x10, ttl 64, id 60337, offset 0, flags [DF], proto TCP (6), length 8260) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: . 4116480140:4116488348(8208) ack 3104784591 win 351 <nop,nop,timestamp[|tcp]>
15:00:32.326280 IP (tos 0x10, ttl 63, id 35046, offset 0, flags [DF], proto TCP (6), length 52) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116470564 win 997 <nop,nop,timestamp[|tcp]>
15:00:32.327006 IP (tos 0x10, ttl 63, id 35047, offset 0, flags [DF], proto TCP (6), length 52) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116471932 win 997 <nop,nop,timestamp[|tcp]>
15:00:32.327095 IP (tos 0x10, ttl 63, id 35048, offset 0, flags [DF], proto TCP (6), length 52) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116473300 win 997 <nop,nop,timestamp[|tcp]>
15:00:32.327103 IP (tos 0x10, ttl 64, id 60343, offset 0, flags [DF], proto TCP (6), length 8260) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: . 4116488348:4116496556(8208) ack 3104784591 win 351 <nop,nop,timestamp[|tcp]>
15:00:32.328115 IP (tos 0x10, ttl 63, id 35049, offset 0, flags [DF], proto TCP (6), length 52) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116474668 win 997 <nop,nop,timestamp[|tcp]>
15:00:32.328139 IP (tos 0x10, ttl 64, id 60349, offset 0, flags [DF], proto TCP (6), length 1420) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: . 4116496556:4116497924(1368) ack 3104784591 win 351 <nop,nop,timestamp[|tcp]>
15:00:32.328802 IP (tos 0x10, ttl 63, id 35050, offset 0, flags [DF], proto TCP (6), length 52) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116476036 win 997 <nop,nop,timestamp[|tcp]>
15:00:32.329167 IP (tos 0x10, ttl 63, id 35051, offset 0, flags [DF], proto TCP (6), length 52) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116477404 win 997 <nop,nop,timestamp[|tcp]>
15:00:32.329888 IP (tos 0x10, ttl 63, id 35052, offset 0, flags [DF], proto TCP (6), length 52) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116478772 win 997 <nop,nop,timestamp[|tcp]>
15:00:32.329992 IP (tos 0x10, ttl 63, id 35053, offset 0, flags [DF], proto TCP (6), length 52) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116480140 win 997 <nop,nop,timestamp[|tcp]>
15:00:32.331117 IP (tos 0x10, ttl 63, id 35054, offset 0, flags [DF], proto TCP (6), length 52) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116481508 win 997 <nop,nop,timestamp[|tcp]>
15:00:32.332802 IP (tos 0x10, ttl 63, id 35055, offset 0, flags [DF], proto TCP (6), length 52) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116485612 win 1002 <nop,nop,timestamp[|tcp]>
15:00:32.332811 IP (tos 0x10, ttl 64, id 60350, offset 0, flags [DF], proto TCP (6), length 10996) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: . 4116497924:4116508868(10944) ack 3104784591 win 351 <nop,nop,timestamp[|tcp]>
15:00:32.333954 IP (tos 0x10, ttl 63, id 35056, offset 0, flags [DF], proto TCP (6), length 180) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: P 3104784591:3104784719(128) ack 4116486980 win 1002 <nop,nop,timestamp[|tcp]>
15:00:32.334700 IP (tos 0x10, ttl 63, id 35057, offset 0, flags [DF], proto TCP (6), length 64) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116486980 win 1002 <nop,nop,timestamp[|tcp]>
15:00:32.335161 IP (tos 0x10, ttl 63, id 35058, offset 0, flags [DF], proto TCP (6), length 64) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116486980 win 1002 <nop,nop,timestamp[|tcp]>
15:00:32.335703 IP (tos 0x10, ttl 63, id 35059, offset 0, flags [DF], proto TCP (6), length 64) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116486980 win 1002 <nop,nop,timestamp[|tcp]>
15:00:32.336173 IP (tos 0x10, ttl 63, id 35060, offset 0, flags [DF], proto TCP (6), length 64) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116486980 win 1002 <nop,nop,timestamp[|tcp]>
15:00:32.336725 IP (tos 0x10, ttl 63, id 35061, offset 0, flags [DF], proto TCP (6), length 64) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116486980 win 1002 <nop,nop,timestamp[|tcp]>
15:00:32.337534 IP (tos 0x10, ttl 63, id 35062, offset 0, flags [DF], proto TCP (6), length 72) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116486980 win 1002 <nop,nop,timestamp[|tcp]>
15:00:32.338086 IP (tos 0x10, ttl 63, id 35063, offset 0, flags [DF], proto TCP (6), length 72) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116486980 win 1002 <nop,nop,timestamp[|tcp]>
15:00:32.338656 IP (tos 0x10, ttl 63, id 35064, offset 0, flags [DF], proto TCP (6), length 72) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116486980 win 1002 <nop,nop,timestamp[|tcp]>
15:00:32.338671 IP (tos 0x10, ttl 63, id 35065, offset 0, flags [DF], proto TCP (6), length 72) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116486980 win 1002 <nop,nop,timestamp[|tcp]>
15:00:32.340936 IP (tos 0x10, ttl 63, id 35066, offset 0, flags [DF], proto TCP (6), length 72) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116486980 win 1002 <nop,nop,timestamp[|tcp]>
15:00:32.340959 IP (tos 0x10, ttl 63, id 35067, offset 0, flags [DF], proto TCP (6), length 72) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116486980 win 1002 <nop,nop,timestamp[|tcp]>
15:00:32.373132 IP (tos 0x10, ttl 64, id 60358, offset 0, flags [DF], proto TCP (6), length 52) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: . ack 3104784719 win 372 <nop,nop,timestamp[|tcp]>
15:00:32.541132 IP (tos 0x10, ttl 64, id 60359, offset 0, flags [DF], proto TCP (6), length 1420) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: . 4116486980:4116488348(1368) ack 3104784719 win 372 <nop,nop,timestamp[|tcp]>
15:00:32.543517 IP (tos 0x10, ttl 63, id 35068, offset 0, flags [DF], proto TCP (6), length 64) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116495188 win 874 <nop,nop,timestamp[|tcp]>
15:00:32.957127 IP (tos 0x10, ttl 64, id 60360, offset 0, flags [DF], proto TCP (6), length 1420) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: . 4116486980:4116488348(1368) ack 3104784719 win 372 <nop,nop,timestamp[|tcp]>
15:00:32.984538 IP (tos 0x10, ttl 63, id 35069, offset 0, flags [DF], proto TCP (6), length 72) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116495188 win 874 <nop,nop,timestamp[|tcp]>
15:00:33.789131 IP (tos 0x10, ttl 64, id 60361, offset 0, flags [DF], proto TCP (6), length 1420) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: . 4116486980:4116488348(1368) ack 3104784719 win 372 <nop,nop,timestamp[|tcp]>
15:00:33.803902 IP (tos 0x10, ttl 63, id 35070, offset 0, flags [DF], proto TCP (6), length 72) 128.189.212.241.46294 > spider.phas.ubc.ca.ssh: . ack 4116495188 win 874 <nop,nop,timestamp[|tcp]> 
15:00:35.453134 IP (tos 0x10, ttl 64, id 60362, offset 0, flags [DF], proto TCP (6), length 1420) spider.phas.ubc.ca.ssh > 128.189.212.241.46294: . 4116486980:4116488348(1368) ack 3104784719 win 372 <nop,nop,timestamp[|tcp]>

Carl

