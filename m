From: Michele Petrazzo - Unipex <michele.petrazzo@unipex.it>
Subject: strange log on gateway inside []
Date: Thu, 29 Jul 2010 10:38:35 +0200
Message-ID: <4C513E0B.6040005@unipex.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi list,
I have a firewall that log some strange, for me, packets on the OUTPUT 
chain that I haven't see before. This is a typical log:

Firewall DROPOUT- IN= OUT=eth0 SRC=MYPUBBIP DST=188.153.11.87
     LEN=92 TOS=0x00 PREC=0xC0 TTL=64 ID=49303 PROTO=ICMP TYPE=3 CODE=3
[SRC=188.153.11.87 DST=MYADDITIONALIP LEN=64 TOS=0x00 PREC=0x00 TTL=118 
ID=28851 DF PROTO=TCP SPT=12387 DPT=51684 WINDOW=17424 RES=0x00 ACK SYN 
URGP=0 ]

My output chain:
*filter
:OUTPUT DROP [4831251:620928037]
-A OUTPUT -o lo -j ACCEPT
-A OUTPUT -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
-A OUTPUT -j LOG --log-prefix "Firewall DROPOUT- "

On it I have more that one pubb ip addrs and, the MYPUBBIP is the first 
and primary, the MYADDITIONALIP if one of the secondaries.

The question. Why I see this log and why my fw want to talk with 
external and, the last, why the kernel double log talk and one is inside 
the brackets  [ ] ?

Thanks,
Michele
