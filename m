From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Is it a bug???
Date: Mon, 10 Nov 2008 15:44:18 +0100
Message-ID: <491848C2.8030305@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter list <netfilter@vger.kernel.org>

Hi List,

I have a lot of these messages in my syslog:

 fw01 kernel: nf_ct_icmp: bad HW ICMP checksum IN= OUT= SRC=84.0.19.129 
DST={EXT_IP} LEN=158 TOS=0x00 PREC=0x00 TTL=123 ID=7437 PROTO=ICMP 
TYPE=3 CODE=3 [SRC={EXT_IP} DST=84.0.19.129 LEN=130 TOS=0x00 PREC=0x00 
TTL=123 ID=53146 PROTO=UDP SPT=49702 DPT=12082 LEN=110 ]

Are these messages related to the REJECT target?
And if yes then there is a bug in the conntrack?

Thanx,

 Swifty
