From: nedco <nedco@unacs.bg>
Subject: some packets are not droped due heavy load
Date: Fri, 27 Feb 2004 14:18:56 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1077891536.14921.38.camel@cold>
Reply-To: nedco@unacs.bg
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=-y2b3qt2gchEgvAco6lZm"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org


--=-y2b3qt2gchEgvAco6lZm
Content-Type: text/plain
Content-Transfer-Encoding: 7bit




Hi, 

i try to filter some traffic but some of the packets are miss :(


Linux version 2.6.3
iptables v1.2.9
udp traffic is about 4-6MByte per second 

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source          
destination
 8502 8944K LOG       udp  --  eth1   *       0.0.0.0/0           
0.0.0.0/0           udp dpt:22 LOG flags 0 level 4
 8502 8944K DROP    udp  --  eth1   *       0.0.0.0/0           
0.0.0.0/0           udp dpt:22


Feb 27 09:54:21 shaper kernel: IN=eth1 OUT=eth0 SRC=212.5.150.185
DST=66.193.175.152 LEN=1052 TOS=0x00 PREC=0x00 TTL=126 ID=256 PROTO=UDP
SPT=59138 DPT=22 LEN=1032 
Feb 27 09:54:21 shaper kernel: IN=eth1 OUT=eth0 SRC=212.5.150.90
DST=66.193.175.152 LEN=1052 TOS=0x00 PREC=0x00 TTL=126 ID=256 PROTO=UDP
SPT=52483 DPT=22 LEN=1032 
Feb 27 09:54:21 shaper kernel: IN=eth1 OUT=eth0 SRC=212.5.150.142
DST=66.193.175.152 LEN=1052 TOS=0x00 PREC=0x00 TTL=126 ID=256 PROTO=UDP
SPT=45824 DPT=22 LEN=1032 
Feb 27 09:54:21 shaper kernel: IN=eth1 OUT=eth0 SRC=212.5.150.150
DST=66.193.175.152 LEN=1052 TOS=0x00 PREC=0x00 TTL=126 ID=256 PROTO=UDP
SPT=16384 DPT=22 LEN=1032 
Feb 27 09:54:21 shaper kernel: IN=eth1 OUT=eth0 SRC=212.5.150.104
DST=66.193.175.152 LEN=1052 TOS=0x00 PREC=0x00 TTL=126 ID=256 PROTO=UDP
SPT=45568 DPT=22 LEN=1032 
Feb 27 09:54:21 shaper kernel: IN=eth1 OUT=eth0 SRC=212.5.150.216
DST=66.193.175.152 LEN=1052 TOS=0x00 PREC=0x00 TTL=126 ID=256 PROTO=UDP
SPT=47107 DPT=22 LEN=1032 
Feb 27 09:54:21 shaper kernel: IN=eth1 OUT=eth0 SRC=212.5.150.91
DST=66.193.175.152 LEN=1052 TOS=0x00 PREC=0x00 TTL=126 ID=256 PROTO=UDP
SPT=53762 DPT=22 LEN=1032 
Feb 27 09:54:21 shaper kernel: IN=eth1 OUT=eth0 SRC=212.5.150.109
DST=66.193.175.152 LEN=1052 TOS=0x00 PREC=0x00 TTL=126 ID=256 PROTO=UDP
SPT=46594 DPT=22 LEN=1032 
Feb 27 09:54:21 shaper kernel: IN=eth1 OUT=eth0 SRC=212.5.150.13
DST=66.193.175.152 LEN=1052 TOS=0x00 PREC=0x00 TTL=126 ID=256 PROTO=UDP
SPT=62467 DPT=22 LEN=1032 
Feb 27 09:54:21 shaper kernel: IN=eth1 OUT=eth0 SRC=212.5.150.65
DST=66.193.175.152 LEN=1052 TOS=0x00 PREC=0x00 TTL=126 ID=256 PROTO=UDP
SPT=11522 DPT=22 LEN=1032 
Feb 27 09:54:21 shaper kernel: IN=eth1 OUT=eth0 SRC=212.5.150.126
DST=66.193.175.152 LEN=1052 TOS=0x00 PREC=0x00 TTL=126 ID=256 PROTO=UDP
SPT=1025 DPT=22 LEN=1032 
Feb 27 09:54:21 shaper kernel: IN=eth1 OUT=eth0 SRC=212.5.150.178
DST=66.193.175.152 LEN=1052 TOS=0x00 PREC=0x00 TTL=126 ID=256 PROTO=UDP
SPT=46083 DPT=22 LEN=1032 



after this router i put other router and i have 
tcpdump -n udp port 22 -c 200
tcpdump: verbose output suppressed, use -v or -vv for full protocol
decode
listening on eth0, link-type EN10MB (Ethernet), capture size 96 bytes
14:46:35.531086 IP 212.5.150.47.62977 > 66.193.175.152.22: UDP, length:
1024
14:46:35.531201 IP 212.5.150.42.19969 > 66.193.175.152.22: UDP, length:
1024
14:46:37.608255 IP 212.5.150.45.27906 > 66.193.175.152.22: UDP, length:
1024
14:46:37.608345 IP 212.5.150.35.20482 > 66.193.175.152.22: UDP, length:
1024
14:46:39.685715 IP 212.5.150.44.26881 > 66.193.175.152.22: UDP, length:
1024
14:46:39.685798 IP 212.5.150.34.13568 > 66.193.175.152.22: UDP, length:
1024


for me iptables miss some packets 
or is there some other problem 

Is anyone have a idea how to solve this problem?
10x in advance 



--=-y2b3qt2gchEgvAco6lZm
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/3.0.8">
</HEAD>
<BODY>



Hi, <BR>
<BR>
i try to filter some traffic but some of the packets are miss :(<BR>
<BR>
<BR>
Linux version 2.6.3<BR>
iptables v1.2.9<BR>
udp traffic is about 4-6MByte per second <BR>
<BR>
Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)<BR>
 pkts bytes target&nbsp;&nbsp;&nbsp;&nbsp; prot opt in&nbsp;&nbsp;&nbsp;&nbsp; out&nbsp;&nbsp;&nbsp;&nbsp; source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; destination<BR>
 8502 8944K LOG&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; udp&nbsp; --&nbsp; eth1&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; udp dpt:22 LOG flags 0 level 4<BR>
 8502 8944K DROP&nbsp;&nbsp;&nbsp; udp&nbsp; --&nbsp; eth1&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; udp dpt:22<BR>
<BR>
<BR>
Feb 27 09:54:21 shaper kernel: IN=eth1 OUT=eth0 SRC=212.5.150.185 DST=66.193.175.152 LEN=1052 TOS=0x00 PREC=0x00 TTL=126 ID=256 PROTO=UDP SPT=59138 DPT=22 LEN=1032 <BR>
Feb 27 09:54:21 shaper kernel: IN=eth1 OUT=eth0 SRC=212.5.150.90 DST=66.193.175.152 LEN=1052 TOS=0x00 PREC=0x00 TTL=126 ID=256 PROTO=UDP SPT=52483 DPT=22 LEN=1032 <BR>
Feb 27 09:54:21 shaper kernel: IN=eth1 OUT=eth0 SRC=212.5.150.142 DST=66.193.175.152 LEN=1052 TOS=0x00 PREC=0x00 TTL=126 ID=256 PROTO=UDP SPT=45824 DPT=22 LEN=1032 <BR>
Feb 27 09:54:21 shaper kernel: IN=eth1 OUT=eth0 SRC=212.5.150.150 DST=66.193.175.152 LEN=1052 TOS=0x00 PREC=0x00 TTL=126 ID=256 PROTO=UDP SPT=16384 DPT=22 LEN=1032 <BR>
Feb 27 09:54:21 shaper kernel: IN=eth1 OUT=eth0 SRC=212.5.150.104 DST=66.193.175.152 LEN=1052 TOS=0x00 PREC=0x00 TTL=126 ID=256 PROTO=UDP SPT=45568 DPT=22 LEN=1032 <BR>
Feb 27 09:54:21 shaper kernel: IN=eth1 OUT=eth0 SRC=212.5.150.216 DST=66.193.175.152 LEN=1052 TOS=0x00 PREC=0x00 TTL=126 ID=256 PROTO=UDP SPT=47107 DPT=22 LEN=1032 <BR>
Feb 27 09:54:21 shaper kernel: IN=eth1 OUT=eth0 SRC=212.5.150.91 DST=66.193.175.152 LEN=1052 TOS=0x00 PREC=0x00 TTL=126 ID=256 PROTO=UDP SPT=53762 DPT=22 LEN=1032 <BR>
Feb 27 09:54:21 shaper kernel: IN=eth1 OUT=eth0 SRC=212.5.150.109 DST=66.193.175.152 LEN=1052 TOS=0x00 PREC=0x00 TTL=126 ID=256 PROTO=UDP SPT=46594 DPT=22 LEN=1032 <BR>
Feb 27 09:54:21 shaper kernel: IN=eth1 OUT=eth0 SRC=212.5.150.13 DST=66.193.175.152 LEN=1052 TOS=0x00 PREC=0x00 TTL=126 ID=256 PROTO=UDP SPT=62467 DPT=22 LEN=1032 <BR>
Feb 27 09:54:21 shaper kernel: IN=eth1 OUT=eth0 SRC=212.5.150.65 DST=66.193.175.152 LEN=1052 TOS=0x00 PREC=0x00 TTL=126 ID=256 PROTO=UDP SPT=11522 DPT=22 LEN=1032 <BR>
Feb 27 09:54:21 shaper kernel: IN=eth1 OUT=eth0 SRC=212.5.150.126 DST=66.193.175.152 LEN=1052 TOS=0x00 PREC=0x00 TTL=126 ID=256 PROTO=UDP SPT=1025 DPT=22 LEN=1032 <BR>
Feb 27 09:54:21 shaper kernel: IN=eth1 OUT=eth0 SRC=212.5.150.178 DST=66.193.175.152 LEN=1052 TOS=0x00 PREC=0x00 TTL=126 ID=256 PROTO=UDP SPT=46083 DPT=22 LEN=1032 <BR>
<BR>
<BR>
<BR>
after this router i put other router and i have <BR>
tcpdump -n udp port 22 -c 200<BR>
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode<BR>
listening on eth0, link-type EN10MB (Ethernet), capture size 96 bytes<BR>
14:46:35.531086 IP 212.5.150.47.62977 &gt; 66.193.175.152.22: UDP, length: 1024<BR>
14:46:35.531201 IP 212.5.150.42.19969 &gt; 66.193.175.152.22: UDP, length: 1024<BR>
14:46:37.608255 IP 212.5.150.45.27906 &gt; 66.193.175.152.22: UDP, length: 1024<BR>
14:46:37.608345 IP 212.5.150.35.20482 &gt; 66.193.175.152.22: UDP, length: 1024<BR>
14:46:39.685715 IP 212.5.150.44.26881 &gt; 66.193.175.152.22: UDP, length: 1024<BR>
14:46:39.685798 IP 212.5.150.34.13568 &gt; 66.193.175.152.22: UDP, length: 1024<BR>
<BR>
<BR>
for me iptables miss some packets <BR>
or is there some other problem <BR>
<BR>
Is anyone have a idea how to solve this problem?<BR>
10x in advance <BR>
<BR>
<BR>
</BODY>
</HTML>

--=-y2b3qt2gchEgvAco6lZm--


