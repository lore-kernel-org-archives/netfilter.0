From: Carl Michal <michal@physics.ubc.ca>
Subject: Re: ssh connections stalling
Date: Fri, 23 Oct 2009 10:32:03 -0700 (PDT)
Message-ID: <alpine.LNX.2.00.0910230951060.13472@spider.phas.ubc.ca>
References: <alpine.LNX.2.00.0910221138180.21365@spider.phas.ubc.ca> <4AE163B6.9040706@chello.at>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AE163B6.9040706@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org


Rob:

DNS queries are definitely allowed.  My problem is somewhat 
intermittent - sometimes an scp transfer will complete, sometimes it 
won't.  When an scp transfer of a file stalls, it often stalls at the
same point in a file.

Karl + Matt:

Stalls are when there's something going on - usually heavy traffic.
If a file transfer is going to stall, its usually near the beginning - in 
the first few 100 kB or so.

This is just a local firewall, this machine isn't doing any routing.

iptables -I INPUT -p tcp --dport 22 -j ACCEPT
doesn't seem to help.

I tried the --clamp-mss-to-pmtu option, but it didn't help

kernel: 2.6.31-gentoo
distro: gentoo
iptables:  1.4.3.2

tcpdump of a stall:
tcpdump host 128.189.212.241
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on eth0, link-type EN10MB (Ethernet), capture size 68 bytes
10:11:53.666783 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: S 1204070872:1204070872(0) win 5840 <mss 1380,[|tcp]>
10:11:53.666819 IP spider.phas.ubc.ca.ssh > 128.189.212.241.49536: S 3213527017:3213527017(0) ack 1204070873 win 5792 <mss 1460,[|tcp]>
10:11:53.668396 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . ack 1 win 92 <nop,nop,timestamp[|tcp]>
10:11:53.671570 IP spider.phas.ubc.ca.ssh > 128.189.212.241.49536: P 1:22(21) ack 1 win 46 <nop,nop,timestamp[|tcp]>
10:11:53.673083 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . ack 22 win 92 <nop,nop,timestamp[|tcp]>
10:11:53.673232 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: P 1:40(39) ack 22 win 92 <nop,nop,timestamp[|tcp]>
10:11:53.673261 IP spider.phas.ubc.ca.ssh > 128.189.212.241.49536: . ack 40 win 46 <nop,nop,timestamp[|tcp]>
10:11:53.673597 IP spider.phas.ubc.ca.ssh > 128.189.212.241.49536: P 22:806(784) ack 40 win 46 <nop,nop,timestamp[|tcp]>
10:11:53.675120 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: P 40:832(792) ack 22 win 92 <nop,nop,timestamp[|tcp]>
10:11:53.713122 IP spider.phas.ubc.ca.ssh > 128.189.212.241.49536: . ack 832 win 58 <nop,nop,timestamp[|tcp]>
10:11:53.714633 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: P 832:856(24) ack 806 win 116 <nop,nop,timestamp[|tcp]>
10:11:53.714647 IP spider.phas.ubc.ca.ssh > 128.189.212.241.49536: . ack 856 win 58 <nop,nop,timestamp[|tcp]>
10:11:53.715894 IP spider.phas.ubc.ca.ssh > 128.189.212.241.49536: P 806:958(152) ack 856 win 58 <nop,nop,timestamp[|tcp]>

...snip...

10:11:56.199883 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: P 7512:7656(144) ack 2846 win 214 <nop,nop,timestamp[|tcp]>
10:11:56.238437 IP spider.phas.ubc.ca.ssh > 128.189.212.241.49536: . ack 7656 win 286 <nop,nop,timestamp[|tcp]>
10:11:56.250616 IP spider.phas.ubc.ca.ssh > 128.189.212.241.49536: P 2846:2990(144) ack 7656 win 286 <nop,nop,timestamp[|tcp]>
10:11:56.252161 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . ack 2990 win 239 <nop,nop,timestamp[|tcp]>
10:11:56.404346 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: P 7656:7784(128) ack 2990 win 239 <nop,nop,timestamp[|tcp]>
10:11:56.404364 IP spider.phas.ubc.ca.ssh > 128.189.212.241.49536: . ack 7784 win 307 <nop,nop,timestamp[|tcp]>
10:11:56.833815 IP spider.phas.ubc.ca.ssh > 128.189.212.241.49536: . 2990:8462(5472) ack 7784 win 307 <nop,nop,timestamp[|tcp]>
10:11:56.895442 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . ack 4358 win 281 <nop,nop,timestamp[|tcp]>
10:11:56.895553 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . ack 5726 win 324 <nop,nop,timestamp[|tcp]>
10:11:56.895564 IP spider.phas.ubc.ca.ssh > 128.189.212.241.49536: . 8462:12566(4104) ack 7784 win 307 <nop,nop,timestamp[|tcp]>
10:11:56.895713 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . ack 7094 win 367 <nop,nop,timestamp[|tcp]>
10:11:56.895721 IP spider.phas.ubc.ca.ssh > 128.189.212.241.49536: P 12566:15302(2736) ack 7784 win 307 <nop,nop,timestamp[|tcp]>
10:11:56.896837 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . ack 8462 win 410 <nop,nop,timestamp[|tcp]>
10:11:56.897729 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . ack 9830 win 452 <nop,nop,timestamp[|tcp]>
10:11:56.897739 IP spider.phas.ubc.ca.ssh > 128.189.212.241.49536: . 15302:16670(1368) ack 7784 win 307 <nop,nop,timestamp[|tcp]>
10:11:56.897743 IP spider.phas.ubc.ca.ssh > 128.189.212.241.49536: P 16670:16942(272) ack 7784 win 307 <nop,nop,timestamp[|tcp]>
10:11:56.898198 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . ack 11198 win 495 <nop,nop,timestamp[|tcp]>
10:11:56.898847 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . ack 12566 win 538 <nop,nop,timestamp[|tcp]>
10:11:56.899049 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . ack 13934 win 581 <nop,nop,timestamp[|tcp]>
10:11:56.899841 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . ack 15302 win 623 <nop,nop,timestamp[|tcp]>
10:11:56.899954 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . ack 15302 win 623 <nop,nop,timestamp[|tcp]>
10:11:56.901001 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . ack 16942 win 666 <nop,nop,timestamp[|tcp]>
10:11:58.448358 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . 7784:9152(1368) ack 16942 win 666 <nop,nop,timestamp[|tcp]>
10:11:58.448384 IP spider.phas.ubc.ca.ssh > 128.189.212.241.49536: . ack 9152 win 330 <nop,nop,timestamp[|tcp]>
10:11:58.448387 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: P 9152:9640(488) ack 16942 win 666 <nop,nop,timestamp[|tcp]>
10:11:58.448393 IP spider.phas.ubc.ca.ssh > 128.189.212.241.49536: . ack 9640 win 351 <nop,nop,timestamp[|tcp]>
10:11:58.448857 IP spider.phas.ubc.ca.ssh > 128.189.212.241.49536: P 16942:18286(1344) ack 9640 win 351 <nop,nop,timestamp[|tcp]>
10:11:58.450854 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . ack 18286 win 709 <nop,nop,timestamp[|tcp]>
10:11:58.460890 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . 9640:11008(1368) ack 18286 win 709 <nop,nop,timestamp[|tcp]>
10:11:58.461441 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . 11008:12376(1368) ack 18286 win 709 <nop,nop,timestamp[|tcp]>
10:11:58.461446 IP spider.phas.ubc.ca.ssh > 128.189.212.241.49536: . ack 12376 win 396 <nop,nop,timestamp[|tcp]>
10:11:58.462017 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . 12376:13744(1368) ack 18286 win 709 <nop,nop,timestamp[|tcp]>
10:11:58.462615 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . 13744:15112(1368) ack 18286 win 709 <nop,nop,timestamp[|tcp]>
10:11:58.462620 IP spider.phas.ubc.ca.ssh > 128.189.212.241.49536: . ack 15112 win 442 <nop,nop,timestamp[|tcp]>
10:11:58.463163 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . 15112:16480(1368) ack 18286 win 709 <nop,nop,timestamp[|tcp]>
10:11:58.463453 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: P 17848:17880(32) ack 18286 win 709 <nop,nop,timestamp[|tcp]>
10:11:58.463460 IP spider.phas.ubc.ca.ssh > 128.189.212.241.49536: . ack 16480 win 464 <nop,nop,timestamp[|tcp]>
10:11:58.463596 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . 16480:17848(1368) ack 18286 win 709 <nop,nop,timestamp[|tcp]>
10:11:58.463603 IP spider.phas.ubc.ca.ssh > 128.189.212.241.49536: . ack 17880 win 487 <nop,nop,timestamp[|tcp]>
10:11:58.477649 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . 17880:19248(1368) ack 18286 win 709 <nop,nop,timestamp[|tcp]>
10:11:58.477661 IP spider.phas.ubc.ca.ssh > 128.189.212.241.49536: . ack 19248 win 501 <nop,nop,timestamp[|tcp]>
10:11:58.478203 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . 19248:20616(1368) ack 18286 win 709 <nop,nop,timestamp[|tcp]>
10:11:58.478209 IP spider.phas.ubc.ca.ssh > 128.189.212.241.49536: . ack 20616 win 501 <nop,nop,timestamp[|tcp]>
10:11:58.478815 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . 20616:21984(1368) ack 18286 win 709 <nop,nop,timestamp[|tcp]>
10:11:58.478821 IP spider.phas.ubc.ca.ssh > 128.189.212.241.49536: . ack 21984 win 501 <nop,nop,timestamp[|tcp]>
10:11:58.479324 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: P 21984:23304(1320) ack 18286 win 709 <nop,nop,timestamp[|tcp]>
10:11:58.479331 IP spider.phas.ubc.ca.ssh > 128.189.212.241.49536: . ack 23304 win 501 <nop,nop,timestamp[|tcp]>
10:11:58.481550 IP spider.phas.ubc.ca.ssh > 128.189.212.241.49536: . 18286:23758(5472) ack 23304 win 501 <nop,nop,timestamp[|tcp]>
10:11:58.484329 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . ack 21022 win 794 <nop,nop,timestamp[|tcp]>
10:11:58.484355 IP spider.phas.ubc.ca.ssh > 128.189.212.241.49536: . 23758:27862(4104) ack 23304 win 501 <nop,nop,timestamp[|tcp]>
10:11:58.485499 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . ack 23758 win 880 <nop,nop,timestamp[|tcp]>
10:11:58.485512 IP spider.phas.ubc.ca.ssh > 128.189.212.241.49536: . 27862:31966(4104) ack 23304 win 501 <nop,nop,timestamp[|tcp]>
10:11:58.486930 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . ack 26494 win 965 <nop,nop,timestamp[|tcp]>
10:11:58.486939 IP spider.phas.ubc.ca.ssh > 128.189.212.241.49536: . 31966:36070(4104) ack 23304 win 501 <nop,nop,timestamp[|tcp]>
10:11:58.487827 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . ack 29230 win 997 <nop,nop,timestamp[|tcp]>
10:11:58.487836 IP spider.phas.ubc.ca.ssh > 128.189.212.241.49536: . 36070:40174(4104) ack 23304 win 501 <nop,nop,timestamp[|tcp]>
10:11:58.489157 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . ack 31966 win 997 <nop,nop,timestamp[|tcp]>
10:11:58.489164 IP spider.phas.ubc.ca.ssh > 128.189.212.241.49536: . 40174:44278(4104) ack 23304 win 501 <nop,nop,timestamp[|tcp]>
10:11:58.490014 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . ack 34702 win 997 <nop,nop,timestamp[|tcp]>
10:11:58.490055 IP spider.phas.ubc.ca.ssh > 128.189.212.241.49536: . 44278:48382(4104) ack 23304 win 501 <nop,nop,timestamp[|tcp]>
10:11:58.491194 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . ack 37438 win 997 <nop,nop,timestamp[|tcp]>
10:11:58.493170 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . ack 40174 win 997 <nop,nop,timestamp[|tcp]>
10:11:58.493177 IP spider.phas.ubc.ca.ssh > 128.189.212.241.49536: . 48382:56590(8208) ack 23304 win 501 <nop,nop,timestamp[|tcp]>
10:11:58.494761 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . ack 42910 win 997 <nop,nop,timestamp[|tcp]>
10:11:58.495770 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . ack 45646 win 997 <nop,nop,timestamp[|tcp]>
10:11:58.495780 IP spider.phas.ubc.ca.ssh > 128.189.212.241.49536: . 56590:64798(8208) ack 23304 win 501 <nop,nop,timestamp[|tcp]>
10:11:58.496809 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . ack 48382 win 997 <nop,nop,timestamp[|tcp]>
10:11:58.496833 IP spider.phas.ubc.ca.ssh > 128.189.212.241.49536: . 64798:68902(4104) ack 23304 win 501 <nop,nop,timestamp[|tcp]>
10:11:58.500763 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . ack 51118 win 997 <nop,nop,timestamp[|tcp]>
10:11:58.501333 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . ack 53854 win 997 <nop,nop,timestamp[|tcp]>
10:11:58.501342 IP spider.phas.ubc.ca.ssh > 128.189.212.241.49536: . 68902:77110(8208) ack 23304 win 501 <nop,nop,timestamp[|tcp]>
10:11:58.502484 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . ack 55222 win 976 <nop,nop,timestamp[|tcp]>
10:11:58.502596 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . ack 55222 win 976 <nop,nop,timestamp[|tcp]>
10:11:58.503590 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . ack 55222 win 976 <nop,nop,timestamp[|tcp]>
10:11:58.504589 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . ack 55222 win 976 <nop,nop,timestamp[|tcp]>
10:11:58.505144 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . ack 55222 win 976 <nop,nop,timestamp[|tcp]>
10:11:58.505720 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . ack 55222 win 976 <nop,nop,timestamp[|tcp]>
10:11:58.506995 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . ack 55222 win 976 <nop,nop,timestamp[|tcp]>
10:11:58.507438 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . ack 55222 win 976 <nop,nop,timestamp[|tcp]>
10:11:58.507576 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . ack 55222 win 976 <nop,nop,timestamp[|tcp]>
10:11:58.508945 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . ack 55222 win 976 <nop,nop,timestamp[|tcp]>
10:11:58.509081 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . ack 55222 win 976 <nop,nop,timestamp[|tcp]>
10:11:58.509708 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . ack 55222 win 976 <nop,nop,timestamp[|tcp]>
10:11:58.510058 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . ack 55222 win 976 <nop,nop,timestamp[|tcp]>
10:11:58.709142 IP spider.phas.ubc.ca.ssh > 128.189.212.241.49536: . 53854:55222(1368) ack 23304 win 501 <nop,nop,timestamp[|tcp]>
10:11:58.711223 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . ack 55222 win 976 <nop,nop,timestamp[|tcp]>
10:11:59.125124 IP spider.phas.ubc.ca.ssh > 128.189.212.241.49536: . 53854:55222(1368) ack 23304 win 501 <nop,nop,timestamp[|tcp]>
10:11:59.147882 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . ack 55222 win 976 <nop,nop,timestamp[|tcp]>
10:11:59.957121 IP spider.phas.ubc.ca.ssh > 128.189.212.241.49536: . 53854:55222(1368) ack 23304 win 501 <nop,nop,timestamp[|tcp]>
10:11:59.967197 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . ack 55222 win 976 <nop,nop,timestamp[|tcp]>
10:12:01.621134 IP spider.phas.ubc.ca.ssh > 128.189.212.241.49536: . 53854:55222(1368) ack 23304 win 501 <nop,nop,timestamp[|tcp]>
10:12:01.708439 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: . ack 55222 win 976 <nop,nop,timestamp[|tcp]>
^C
841 packets captured
841 packets received by filter
0 packets dropped by kernel

syslog shows:
Oct 23 10:11:56 spider ''IN-world':'IN=eth0 OUT= MAC=00:1c:c0:72:48:e9:00:11:bb:09:36:80:08:00 SRC=128.189.212.241 DST=142.103.235.177 LEN=64 TOS=0x10 PREC=0x00 TTL=63 ID=43426 DF PROTO=TCP SPT=49536 DPT=22 WINDOW=623 RES=0x00 ACK URGP=0
Oct 23 10:11:58 spider ''IN-world':'IN=eth0 OUT= MAC=00:1c:c0:72:48:e9:00:11:bb:09:36:80:08:00 SRC=128.189.212.241 DST=142.103.235.177 LEN=64 TOS=0x10 PREC=0x00 TTL=63 ID=43455 DF PROTO=TCP SPT=49536 DPT=22 WINDOW=976 RES=0x00 ACK URGP=0
Oct 23 10:11:58 spider ''IN-world':'IN=eth0 OUT= MAC=00:1c:c0:72:48:e9:00:11:bb:09:36:80:08:00 SRC=128.189.212.241 DST=142.103.235.177 LEN=64 TOS=0x10 PREC=0x00 TTL=63 ID=43456 DF PROTO=TCP SPT=49536 DPT=22 WINDOW=976 RES=0x00 ACK URGP=0
Oct 23 10:11:58 spider ''IN-world':'IN=eth0 OUT= MAC=00:1c:c0:72:48:e9:00:11:bb:09:36:80:08:00 SRC=128.189.212.241 DST=142.103.235.177 LEN=64 TOS=0x10 PREC=0x00 TTL=63 ID=43457 DF PROTO=TCP SPT=49536 DPT=22 WINDOW=976 RES=0x00 ACK URGP=0
Oct 23 10:11:58 spider ''IN-world':'IN=eth0 OUT= MAC=00:1c:c0:72:48:e9:00:11:bb:09:36:80:08:00 SRC=128.189.212.241 DST=142.103.235.177 LEN=64 TOS=0x10 PREC=0x00 TTL=63 ID=43458 DF PROTO=TCP SPT=49536 DPT=22 WINDOW=976 RES=0x00 ACK URGP=0
Oct 23 10:11:58 spider ''IN-world':'IN=eth0 OUT= MAC=00:1c:c0:72:48:e9:00:11:bb:09:36:80:08:00 SRC=128.189.212.241 DST=142.103.235.177 LEN=80 TOS=0x10 PREC=0x00 TTL=63 ID=43468 DF PROTO=TCP SPT=49536 DPT=22 WINDOW=976 RES=0x00 ACK URGP=0
Oct 23 10:12:01 spider ''IN-world':'IN=eth0 OUT= MAC=00:1c:c0:72:48:e9:00:11:bb:09:36:80:08:00 SRC=128.189.212.241 DST=142.103.235.177 LEN=80 TOS=0x10 PREC=0x00 TTL=63 ID=43471 DF PROTO=TCP SPT=49536 DPT=22 WINDOW=976 RES=0x00 ACK URGP=0


It looks to me like the ack 55222 packets at 10:11:58.5xxx are being 
dropped, but why?

Carl

