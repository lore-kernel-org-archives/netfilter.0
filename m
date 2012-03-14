From: Yann Hamon <yann@mandragor.org>
Subject: NEW packets with no SYN bit set in OUTPUT
Date: Wed, 14 Mar 2012 12:28:08 +0100
Message-ID: <4F6080C8.40506@mandragor.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:date:from:mime-version:to
	:subject:content-type:content-transfer-encoding; s=smtpout; bh=N
	LUFwNuJ+P/q9lpsSxhBZG64Qhk=; b=pcbD/PraIeKfRLOjVA10RPO6XK2ZN2xaf
	SOjduo5uIwf12zeIHBJ3QQyZwVbheC6B51f8+ZU1S4wHq4Fcx3PU8VLpozKbLOH+
	EcLls4xkpFkBnTaWX/nPAcVDbmap2vW5ALUsDXlAehf4KML9OquiL4kmh9qeFAiq
	NgyjZidF6Q=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I am having an issue related to conntrack and iptables than I am having 
a hard time fixing. My policy for the OUTPUT chain looks basically like 
this:

Set default policy to DROP
DROP all invalid pakets
ACCEPT all established an related
Then a fairly long list of rules and chains to filter what NEW packets 
should be allowed out
At the end, LOG those that haven't been matched by a previous rule in an 
unauthorized_outgoing chain.

Now I am getting a small number of packets in that chain (about 15-20 
per hour, and the server does about 30mbps), like this one:

kernel: [12817249.101873] [fw] UNAUTH. OUTGOING CONN.IN= OUT=eth0 
SRC=188.xx.xx.xx DST=80.xx.xx.xx LEN=40 TOS=0x00 PREC=0x00 TTL=64 
ID=59528 DF PROTO=TCP SPT=80 DPT=16258 WINDOW=6432 RES=0x00 ACK URGP=0

I am wondering about a few things in that packet:

* Its source port is 80 - the server being a HTTP proxy, this packet is 
(fairly) likely a reply to another connection
* The packet goes into the unauthorized_outgoing logging chain, so the 
packet doesn't have the state established, related, or invalid : it must 
be "new". However the packet doesn't have the SYN bit set - it's just an 
ACK.

I came across the appendix B in the Linux Packet Filtering and Iptables 
tutorial "State NEW packets but no SYN bit set" at 
http://www.linuxtopia.org/Linux_Firewall_iptables/x6193.html  that 
describes a similar "feature", and that it might be triggered by a bad 
Microsoft TCP/IP implementation. However, my packets are in the output 
chain, not the input.

I have added the following rule just before the regular logging chain:

iptables -A OUTPUT -p tcp ! --syn  -m state --state NEW  -j 
new_outgoing_without_syn

It actually captures all the packets that would have otherwise arrived 
in my unauthorized_outgoing chain - so, in a way, I have "solved" my 
problem, as I don't get the false positives anymore.

kernel: [12203442.354426] [fw] NEW W/O SYN.IN= OUT=eth0 SRC=188.xx.xx.xx 
DST=88.xx.xx.xx LEN=1492 TOS=0x00 PREC=0x00 TTL=64 ID=5298 DF PROTO=TCP 
SPT=80 DPT=2373 WINDOW=14 RES=0x00 ACK URGP=0

However, I'm unsure about the origin of those packets.
Do you think my "fix" is correct? What explanation for such packets 
could there be?

NB:

Linux p12 2.6.32-35-server #78-Ubuntu SMP Tue Oct 11 16:26:12 UTC 2011 
x86_64 GNU/Linux
iptables v1.4.4

Tuned TCP stack according to recommendations for varnish:

net.ipv4.tcp_syn_retries=2
net.ipv4.tcp_synack_retries=2
net.ipv4.tcp_max_orphans=262144
net.ipv4.tcp_fin_timeout=3
net.ipv4.tcp_max_syn_backlog=262144
net.ipv4.tcp_wmem=4096 65536 16777216
net.ipv4.tcp_rmem=4096 87380 16777216
net.core.wmem_max=16777216
net.core.rmem_max=16777216
net.core.netdev_max_backlog=2500
net.ipv4.tcp_no_metrics_save=1
net.core.somaxconn=262144
net.ipv4.tcp_tw_recycle=0
net.ipv4.tcp_tw_reuse=0


Thank you,

Yann
