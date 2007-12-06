From: "Toby Chamberlain" <toby@webtechservices.com.au>
Subject: FTP Wierdness
Date: Thu, 6 Dec 2007 14:41:06 +1100
Message-ID: <003001c837b9$d7fc9030$0c0210ac@WT2>
References: <fj7m77$n14$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@vger.kernel.org

After working fine for years, I am suddenly experiencing intermittent 
failures with my NAT box (Debian stable) failing to identify some incoming 
ftp-data packets as belonging to an existing connection. The failures seem 
random and can happen at any time in the FTP connection - for example an 
"mget" will receive the NLIST ok but then fail in the subsequent GET

Logging all port 20 traffic from the remote host with "FTP:" shows this in 
the syslog:
(remote is 202.55, internal is 172.16, the NAT box is 203.38)

Dec  4 15:37:19 rc1 kernel: FTP:IN=eth0 OUT=eth0 SRC=202.55.x.x 
DST=172.16.x.x LEN=73 TOS=0x00 PREC=0x00 TTL=113 ID=9526 DF PROTO=TCP SPT=20 
DPT=5005 WINDOW=65535 RES=0x00 ACK PSH URGP=0
Dec  4 15:37:19 rc1 kernel: FTP:IN=eth0 OUT=eth0 SRC=202.55.x.x 
DST=172.16.x.x LEN=40 TOS=0x00 PREC=0x00 TTL=113 ID=9527 DF PROTO=TCP SPT=20 
DPT=5005 WINDOW=65535 RES=0x00 ACK FIN URGP=0
Dec  4 15:37:20 rc1 kernel: FTP:IN=eth0 OUT=eth0 SRC=202.55.x.x 
DST=172.16.x.x LEN=40 TOS=0x00 PREC=0x00 TTL=113 ID=9528 DF PROTO=TCP SPT=20 
DPT=5005 WINDOW=65535 RES=0x00 ACK URGP=0
Dec  4 15:37:20 rc1 kernel: FTP:IN=eth0 OUT= MAC=00:13:xx:xx:etc 
SRC=202.55.x.x DST=203.38.x.x LEN=48 TOS=0x00 PREC=0x00 TTL=114 ID=9539 DF 
PROTO=TCP SPT=20 DPT=5006 WINDOW=65535 RES=0x00 SYN URGP=0
Dec  4 15:37:20 rc1 kernel: Input:IN=eth0 OUT= MAC=00:13:xx:xx:etc 
SRC=202.55.x.x DST=203.38.x.x LEN=48 TOS=0x00 PREC=0x00 TTL=114 ID=9539 DF 
PROTO=TCP SPT=20 DPT=5006 WINDOW=65535 RES=0x00 SYN URGP=0
Dec  4 15:37:23 rc1 kernel: FTP:IN=eth0 OUT= MAC=00:13:xx:xx:etc 
SRC=202.55.x.x DST=203.38.x.x LEN=48 TOS=0x00 PREC=0x00 TTL=114 ID=9580 DF 
PROTO=TCP SPT=20 DPT=5006 WINDOW=65535 RES=0x00 SYN URGP=0
Dec  4 15:37:23 rc1 kernel: Input:IN=eth0 OUT= MAC=00:13:xx:xx:etc 
SRC=202.55.x.x DST=203.38.x.x LEN=48 TOS=0x00 PREC=0x00 TTL=114 ID=9580 DF 
PROTO=TCP SPT=20 DPT=5006 WINDOW=65535 RES=0x00 SYN URGP=006

This is from an mget - the first 3 packets are presumably from the 
successful NLIST, the next 2 are the failed GET - as you can see they aren't 
being un-NATted and are thus blocked by the firewall (the "Input:" lines). 
Eventually the connection times out.

The system exchanges files with the FTP server every 10-20 minutes - it goes 
put, get, put, mget in separate sessions with a second or two in between. 
The failure can occur in any of the operations and it is rare to see 3 
successful completions is a row.

As I said the system has been running perfectly for years. The only recent 
change was upgrading of the client box to a Core2 Duo - it ran fine for a 
few days before the problems started.

Are there any know issues or bugs that could cause this sort of behaviour? 
Does anybody have any idea how to go about fixing it?
Toby

