From: Noel Kuntze <noel@familie-kuntze.de>
Subject: Re: SYN packet "disappears"
Date: Thu, 27 Apr 2017 17:08:27 +0200
Message-ID: <9E4BD412-E2B1-48BB-ABDD-90C70ADB0DFC@familie-kuntze.de>
References: <1538022.l5gG4X5sYW@giles>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1538022.l5gG4X5sYW@giles>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kevin <kmg952@bigpond.com>, netfilter@vger.kernel.org



Am 27. April 2017 07:21:14 MESZ schrieb Kevin <kmg952@bigpond.com>:
>Hi,
>
>I'm having trouble changing my iptables configuration to work with a
>new 
>NordVPN/OpenVPN.
>
>In trying to diagnose the problem, I have saturated my firewall with
>"-j LOG" 
>rules. The problem is that the initial SYN packet to TCP port 22 seems
>to go 
>missing between the "nat prerouting" and the "mangle input" chains.

That's where the routing decision is and the rp_filter. It likely drops the packets because they're martians. That's a good thing. Fix your routing on the host.
>
>Messy details (config & log) are at the end of this email.
>
>My question is: Where did my SYN packet go?
>
>The initial portion of my firewall is as follows:
>
>#!/bin/bash
>
>IPT="/sbin/iptables"
>
>$IPT -F
>$IPT -X
>
>for table in filter mangle nat raw security; do
>    $IPT -F -t $table
>    $IPT -X -t $table
>done
>
>$IPT -t filter   --policy INPUT       DROP
>$IPT -t filter   --policy FORWARD     DROP
>$IPT -t filter   --policy OUTPUT      DROP
>
>$IPT -t nat      --policy PREROUTING  ACCEPT
>$IPT -t nat      --policy INPUT       ACCEPT
>$IPT -t nat      --policy OUTPUT      ACCEPT
>$IPT -t nat      --policy POSTROUTING ACCEPT
>
>$IPT -t mangle   --policy PREROUTING  ACCEPT
>$IPT -t mangle   --policy INPUT       ACCEPT
>$IPT -t mangle   --policy FORWARD     ACCEPT
>$IPT -t mangle   --policy OUTPUT      ACCEPT
>$IPT -t mangle   --policy POSTROUTING ACCEPT
>
>$IPT -t raw      --policy PREROUTING  ACCEPT
>$IPT -t raw      --policy OUTPUT      ACCEPT
>
>$IPT -t security --policy INPUT       ACCEPT
>$IPT -t security --policy FORWARD     ACCEPT
>$IPT -t security --policy OUTPUT      ACCEPT
>
>$IPT -t filter   -A INPUT   -i tun+ -s 999.999.999.999 -p tcp --dport
>22 -j 
>LOG --log-prefix "ssh filter input   tun: "
>$IPT -t filter   -A FORWARD -i tun+ -s 999.999.999.999 -p tcp --dport
>22 -j 
>LOG --log-prefix "ssh filter forward tun: "
>$IPT -t filter   -A OUTPUT  -o tun+ -d 999.999.999.999 -p tcp --dport
>22 -j 
>LOG --log-prefix "ssh filter output  tun: "
>
>$IPT -t filter   -A FORWARD     -p tcp --dport 22 -j LOG --log-prefix
>"ssh 
>filter forward:     "
>$IPT -t filter   -A INPUT       -p tcp --dport 22 -j LOG --log-prefix
>"ssh 
>filter input:       "
>$IPT -t filter   -A OUTPUT      -p tcp --dport 22 -j LOG --log-prefix
>"ssh 
>filter output:      "
>
>$IPT -t mangle   -A FORWARD     -p tcp --dport 22 -j LOG --log-prefix
>"ssh 
>mangle forward:     "
>$IPT -t mangle   -A INPUT       -p tcp --dport 22 -j LOG --log-prefix
>"ssh 
>mangle input:       "
>$IPT -t mangle   -A OUTPUT      -p tcp --dport 22 -j LOG --log-prefix
>"ssh 
>mangle output:      "
>$IPT -t mangle   -A POSTROUTING -p tcp --dport 22 -j LOG --log-prefix
>"ssh 
>mangle postrouting: "
>$IPT -t mangle   -A PREROUTING  -p tcp --dport 22 -j LOG --log-prefix
>"ssh 
>mangle prerouting:  "
>
>$IPT -t nat      -A PREROUTING  -p tcp --dport 22 -j LOG --log-prefix
>"ssh nat 
>prerouting:     "
>$IPT -t nat      -A POSTROUTING -p tcp --dport 22 -j LOG --log-prefix
>"ssh nat 
>postrouting:    "
>
>$IPT -t raw      -A  PREROUTING -p tcp --dport 22 -j LOG --log-prefix
>"ssh raw 
>prerouting:     "
>$IPT -t raw      -A  OUTPUT     -p tcp --dport 22 -j LOG --log-prefix
>"ssh raw 
>output:         "
>
>$IPT -t security -A INPUT       -p tcp --dport 22 -j LOG --log-prefix
>"ssh 
>security input:     "
>$IPT -t security -A FORWARD     -p tcp --dport 22 -j LOG --log-prefix
>"ssh 
>security forward:   "
>$IPT -t security -A OUTPUT      -p tcp --dport 22 -j LOG --log-prefix
>"ssh 
>security output:    "
>
>$IPT -A INPUT   -i tun+ -s 999.999.999.999 -j ACCEPT
>$IPT -A FORWARD -i tun+ -s 999.999.999.999 -j ACCEPT
>$IPT -A OUTPUT  -o tun+ -d 999.999.999.999 -j ACCEPT
>
>The resulting log entries are as follows (slightly edited for
>security):
>
>ssh raw prerouting:     IN=wlan OUT= MAC=??? SRC=999.999.999.999 
>DST=192.168.0.20 LEN=60 TOS=0x00 PREC=0x00 TTL=57 ID=40283 DF 
>PROTO=TCP SPT=45823 DPT=22 WINDOW=65535 RES=0x00 SYN URGP=0
>ssh mangle prerouting:  IN=wlan OUT= MAC=??? SRC=999.999.999.999 
>DST=192.168.0.20 LEN=60 TOS=0x00 PREC=0x00 TTL=57 ID=40283 DF 
>PROTO=TCP SPT=45823 DPT=22 WINDOW=65535 RES=0x00 SYN URGP=0
>ssh nat prerouting:     IN=wlan OUT= MAC=??? SRC=999.999.999.999 
>DST=192.168.0.20 LEN=60 TOS=0x00 PREC=0x00 TTL=57 ID=40283 DF 
>PROTO=TCP SPT=45823 DPT=22 WINDOW=65535 RES=0x00 SYN URGP=0
>
><then the following retry>
>
>ssh raw prerouting:     IN=wlan OUT= MAC=??? SRC=999.999.999.999 
>DST=192.168.0.20 LEN=60 TOS=0x00 PREC=0x00 TTL=57 ID=40284 DF 
>PROTO=TCP SPT=45823 DPT=22 WINDOW=65535 RES=0x00 SYN URGP=0
>ssh mangle prerouting:  IN=wlan OUT= MAC=??? SRC=999.999.999.999 
>DST=192.168.0.20 LEN=60 TOS=0x00 PREC=0x00 TTL=57 ID=40284 DF 
>PROTO=TCP SPT=45823 DPT=22 WINDOW=65535 RES=0x00 SYN URGP=0
>ssh nat prerouting:     IN=wlan OUT= MAC=??? SRC=999.999.999.999 
>DST=192.168.0.20 LEN=60 TOS=0x00 PREC=0x00 TTL=57 ID=40284 DF 
>PROTO=TCP SPT=45823 DPT=22 WINDOW=65535 RES=0x00 SYN URGP=0
>
>... and so on.
>
>Cheers,
>Kevin
>
>--
>To unsubscribe from this list: send the line "unsubscribe netfilter" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Sent from mobile
