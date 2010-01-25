From: "J. Bakshi" <joydeep@infoservices.in>
Subject: How to create rule from log file information ?
Date: Mon, 25 Jan 2010 23:02:02 +0530
Message-ID: <20100125230202.60f24a5a@infoservices.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I have collected the iptables log against nmap scan. Like

[1] nmap -P0 <my-server_ip>
 
IN=eth0 OUT= MAC=00:0b:6a:de:7b:3b:00:00:cd:27:e5:d9:08:00 SRC=62.194.241.199 DST=10.10.29.34 LEN=48 TOS=0x00 PREC=0x00 TTL=110 ID=316 DF PROTO=TCP SPT=55779 DPT=8630 WINDOW=8192 RES=0x00 SYN URGP=0
 
[2] nmap -sN
 
IN=eth0 OUT= MAC=00:0b:6a:de:7b:3b:00:00:cd:27:e5:d9:08:00 SRC=62.194.241.199 DST=10.10.29.34 LEN=48 TOS=0x00 PREC=0x00 TTL=110 ID=13931 DF PROTO=TCP SPT=56132 DPT=8630 WINDOW=8192 RES=0x00 SYN URGP=0
 
[3] nmap -sX
 
IN=eth0 OUT= MAC=00:0b:6a:de:7b:3b:00:00:cd:27:e5:d9:08:00
 SRC=62.194.241.199 DST=10.10.29.34 LEN=48 TOS=0x00 PREC=0x00 TTL=110
 ID=26846 DF PROTO=TCP SPT=56468 DPT=8630 WINDOW=8192 RES=0x00 SYN
 URGP=0

Can I make rule-set to prevent the above scan from the info collected at the log ?
Kindly enlighten me. Then I can make more rule sets from the log.

Thanks

