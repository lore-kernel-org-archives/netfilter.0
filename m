From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: "invalid packets" and "bad HW ICMP checksum"
Date: Wed, 29 Oct 2008 18:10:03 +0100
Message-ID: <490898EB.4080307@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter list <netfilter@vger.kernel.org>

Hi List,

My firewall logs many of the following packets!

Can anyone help me with it?

I found a similar post: 
http://lists.netfilter.org/pipermail/netfilter/2007-July/069183.html

I use REJECT too and have two interfaces but nothing special.

fw01 kernel: nf_ct_icmp: bad HW ICMP checksum IN= OUT= 
SRC=87.171.106.238 DST=[EXT_IP] LEN=154 TOS=0x00 PREC=0x00 TTL=56 
ID=35986 PROTO=ICMP TYPE=3 CODE=1 [SRC=[EXT_IP] DST=87.171.106.238 
LEN=126 TOS=0x00 PREC=0x00 TTL=118 ID=59786 PROTO=UDP SPT=11405 
DPT=64067 LEN=106 ]

fw01 kernel: nf_ct_icmp: bad HW ICMP checksum IN= OUT= SRC=70.55.137.237 
DST=[EXT_IP] LEN=154 TOS=0x00 PREC=0x00 TTL=35 ID=30825 PROTO=ICMP 
TYPE=3 CODE=3 [SRC=[EXT_IP] DST=70.55.137.237 LEN=126 TOS=0x00 PREC=0x00 
TTL=108 ID=59731 PROTO=UDP SPT=11405 DPT=25756 LEN=106 ]

fw01 kernel: nf_ct_tcp: invalid packet ignored IN= OUT= 
SRC=195.228.240.23 DST=[EXT_IP] LEN=52 TOS=0x00 PREC=0x00 TTL=59 
ID=60017 DF PROTO=TCP SPT=80 DPT=59558 SEQ=3345506104 ACK=508060430 
WINDOW=33792 RES=0x00 ACK URGP=0 OPT (0101080A2F70DB47013D0A2B)


Swifty
