From: =?ISO-8859-1?Q?Ma-ris_Ruskulis?= <maris@chown.lv>
Subject: random src dst ports for OUTPUT chain in FILTER table
Date: Thu, 22 Jan 2009 14:24:24 +0200
Message-ID: <49786578.5010801@chown.lv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=chown.lv; s=mail;
	t=1232627067; bh=QdXbcN2M5atg7lG/1TTh3WW6Q33jQJGGed8OdCMAkY0=;
	h=Message-ID:Date:From:MIME-Version:To:Subject:Content-Type:
	 Content-Transfer-Encoding; b=gDucqbAKyJ3VzSEsfctba97JRkqSeRNEiNLvo
	6c1oKH9kkUrATQGRmG/D4qSohhvEmaQZ7WOoUvRGbv74Pidjhn9u9mPk7FOU+5lZBSK
	nX67TWasf80Zju5RIP3CZ4j8o3Y2ypjyJ25rRgMdq2laQG/9D64NuAlWkNhTYdwy6cY
	=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello!
Few weeks ago, I set on my servers OUTPUT chain with policy ACCEPT and
logging - stateful. For start, just for traffic inspectation. On two
machines strange traffic apeared with random src-dst ports.
This looks like port scan from local machine, but noone except me hasn't
access to this server, so, if this is a port scan, than I have been
cracked/hacked. But how? On this server im running only webserver
http,https. HTTP daemon is sitting in jail. And linux kernel is
grsec/pax enabled, so break out of jail is almost impossible. And jail
has only php. I checked Access logs of webserver, and dst ip was listed
here, but when I tried to traceroute this dst it looped, seems that dst
network has problems with routing, maybe this was cause of this strange
traffic? I'm not guru in tcp/ip protocol stack, maybe there is some 
features which done this traffic?

OUPUT:
Unmatched out: IN= OUT=eth1 SRC=xx.xxx.x.50 DST=88.222.29.18 LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=55586 DF PROTO=TCP SPT=41661 DPT=3728 WINDOW=13220 RES=0x00 ACK RST URGP=0 
Unmatched out: IN= OUT=eth1 SRC=xx.xxx.x.50 DST=88.222.29.18 LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=59299 DF PROTO=TCP SPT=40398 DPT=3729 WINDOW=8096 RES=0x00 ACK RST URGP=0 
Unmatched out: IN= OUT=eth1 SRC=xx.xxx.x.50 DST=88.222.29.18 LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=41101 DF PROTO=TCP SPT=47319 DPT=3730 WINDOW=7920 RES=0x00 ACK RST URGP=0 
Unmatched out: IN= OUT=eth1 SRC=xx.xxx.x.50 DST=88.222.29.18 LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=26623 DF PROTO=TCP SPT=41531 DPT=3731 WINDOW=7920 RES=0x00 ACK RST URGP=0 
Unmatched out: IN= OUT=eth1 SRC=xx.xxx.x.50 DST=88.222.29.18 LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=14739 DF PROTO=TCP SPT=45649 DPT=3732 WINDOW=7920 RES=0x00 ACK RST URGP=0 
Unmatched out: IN= OUT=eth1 SRC=xx.xxx.x.50 DST=88.222.29.18 LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=47318 DF PROTO=TCP SPT=42388 DPT=3733 WINDOW=7920 RES=0x00 ACK RST URGP=0 
Unmatched out: IN= OUT=eth1 SRC=xx.xxx.x.50 DST=88.222.29.18 LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=46558 DF PROTO=TCP SPT=42478 DPT=3734 WINDOW=7920 RES=0x00 ACK RST URGP=0 
Unmatched out: IN= OUT=eth1 SRC=xx.xxx.x.50 DST=88.222.29.18 LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=13153 DF PROTO=TCP SPT=35883 DPT=3735 WINDOW=7920 RES=0x00 ACK RST URGP=0 
Unmatched out: IN= OUT=eth1 SRC=xx.xxx.x.50 DST=88.222.29.18 LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=27594 DF PROTO=TCP SPT=47061 DPT=3736 WINDOW=7920 RES=0x00 ACK RST URGP=0 
Unmatched out: IN= OUT=eth1 SRC=xx.xxx.x.50 DST=88.222.29.18 LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=21367 DF PROTO=TCP SPT=44743 DPT=3737 WINDOW=7920 RES=0x00 ACK RST URGP=0 


