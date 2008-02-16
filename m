From: "Robert M. Albrecht" <romal@gmx.de>
Subject: illegal packets
Date: Sat, 16 Feb 2008 21:15:21 +0100
Message-ID: <47B74459.5010607@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I keep getting this invalid packets, one to five per minute.

Why are the invalid ?

cu romal


Message from syslogd@gateway at Feb 16 20:39:27 ...

  kernel: nf_ct_tcp: invalid packed ignored IN= OUT= SRC=212.60.137.183 
DST=217.72.204.254 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=25024 DF PROTO=TCP 
SPT=52369 DPT=80 SEQ=4686532 ACK=0 WINDOW=5840 RES=0x00 SYN URGP=0 OPT 
(020405B40402080A0244

Feb 16 20:39:27 gateway kernel: nf_ct_tcp: invalid packed ignored IN= OUT= 
SRC=212.60.137.183 DST=217.72.204.254 LEN=60 TOS=0x00 PREC=0x00 TTL=64 
ID=25024 DF PROTO=TCP SPT=52369 DPT=80 SEQ=4686532 ACK=0 WINDOW=5840 
RES=0x00 SYN URGP=0 OPT (020405B40402080A0244


Message from syslogd@gateway at Feb 16 20:39:33 ...

  kernel: nf_ct_tcp: invalid packed ignored IN= OUT= SRC=212.60.137.183 
DST=217.72.204.254 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=25025 DF PROTO=TCP 
SPT=52369 DPT=80 SEQ=4686532 ACK=0 WINDOW=5840 RES=0x00 SYN URGP=0 OPT 
(020405B40402080A0245

Feb 16 20:39:33 gateway kernel: nf_ct_tcp: invalid packed ignored IN= OUT= 
SRC=212.60.137.183 DST=217.72.204.254 LEN=60 TOS=0x00 PREC=0x00 TTL=64 
ID=25025 DF PROTO=TCP SPT=52369 DPT=80 SEQ=4686532 ACK=0 WINDOW=5840 
RES=0x00 SYN URGP=0 OPT (020405B40402080A0245


