From: bossk <bossk@tyntec.biz>
Subject: iptables question
Date: Tue, 11 Mar 2008 15:20:15 +0100
Message-ID: <200803111520.15941.bossk@tyntec.biz>
Reply-To: bossk@tyntec.biz
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I have a problem with some dropped packets which shouldn't been dropped when I 
enable the following three rules

1. iptables -A allowed -p TCP --syn -j ACCEPT
2. iptables -A allowed -p TCP -m state --state ESTABLISHED,RELATED -j ACCEPT
3. iptables -A allowed -p TCP -j DROP

I see in conntrack that the connection exists
tcp      6 431999 ESTABLISHED src=10.3.4.14 dst=10.3.4.2 sport=42884 
dport=3128 packets=1140 bytes=59440 src=10.3.4.2 dst=10.3.4.14 sport=3128 
dport=42884 packets=1475 bytes=1681482 [ASSURED] mark=0 secmark=0 use=1

Regarding rule 2.  the connections is ESTABLISHED and no packets should be 
dropped.

But in the drop log it looks quite different
IN= OUT=eth0 SRC=10.3.4.14 DST=10.3.4.2 LEN=52 TOS=0x00 PREC=0x00 TTL=64 
ID=20094 DF PROTO=TCP SPT=42884 DPT=3128 WINDOW=4 RES=0x00 ACK URGP=0

What I also see is that the dropped packets have the PSH ACK Flags set, but 
this shouldn't be a problem or? Because right now I don't know what the 
problem is.

It would be great if somebody could enlighten me.

Thanks,
bossk
