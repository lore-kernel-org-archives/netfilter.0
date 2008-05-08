From: "eial@cs.bgu.ac.il" <eial@cs.bgu.ac.il>
Subject: Re: accept rule not working.
Date: Thu, 8 May 2008 08:25:33 +0300 (IDT)
Message-ID: <200805080525.m485PXTY016327@indigo.cs.bgu.ac.il>
References: <200805071514.m47FEhxC008001@indigo.cs.bgu.ac.il>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200805071514.m47FEhxC008001@indigo.cs.bgu.ac.il>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "eial@cs.bgu.ac.il" <eial@cs.bgu.ac.il>
Cc: netfilter@vger.kernel.org


On Wed 07 May 18:14 2008 eial@cs.bgu.ac.il wrote:
> 
> I've created this rule:
> /sbin/iptables -A INPUT -i eth0 -p tcp -m state --state NEW --sport 80 -s 192.168.113.94 -j ACCEPT
> 
> but the firewall still blocks it, I guess there is a typo somewhere but I cant seem to be able to find it
> any hints?
> 
> thanks
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

# tcpdump -i eth0 ip host 192.168.113.94
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on eth0, link-type EN10MB (Ethernet), capture size 68 bytes
08:11:24.236476 IP 192.168.114.2.40573 > 192.168.113.94 F 2798920178:2798920178(0) ack 630443077 win 182 <nop,nop,timestamp 296121 1080942535>
08:11:24.413843 IP 192.168.113.94 > 192.168.114.2.40573: R 630443077:630443077(0) win 0
08:11:24.413907 IP 192.168.114.2 > 192.168.113.94: ICMP 192.168.114.2 tcp port 40573 unreachable, length 48
08:12:24.768797 IP 192.168.114.2.40573 > 192.168.113.94 F 0:0(0) ack 1 win 182 <nop,nop,timestamp 356665 1080942535>
08:12:24.946400 IP 192.168.113.94 > 192.168.114.2.40573: R 630443077:630443077(0) win 0
08:12:24.946464 IP 192.168.114.2 > 192.168.113.94: ICMP 192.168.114.2 tcp port 40573 unreachable, length 48
08:12:57.186350 IP 192.168.114.2.53948 > 192.168.113.94 S 3151686805:3151686805(0) win 5840 <mss 1460,sackOK,timestamp 389088[|tcp]>
08:12:57.364491 IP 192.168.113.94 > 192.168.114.2.53948: S 937462665:937462665(0) ack 3151686806 win 5792 <mss 1460,sackOK,timestamp 1081223595[|tcp]>
08:12:57.364547 IP 192.168.114.2.53948 > 192.168.113.94 . ack 1 win 92 <nop,nop,timestamp 389267 1081223595>
08:12:57.364710 IP 192.168.114.2.53948 > 192.168.113.94 P 1:267(266) ack 1 win 92 <nop,nop,timestamp 389267 1081223595>
08:12:57.543067 IP 192.168.113.94 > 192.168.114.2.53948: . ack 267 win 1716 <nop,nop,timestamp 1081223773 389267>
08:12:57.545658 IP 192.168.113.94 > 192.168.114.2.53948: P 1:26(25) ack 267 win 1716 <nop,nop,timestamp 1081223776 389267>
08:12:57.545700 IP 192.168.114.2.53948 > 192.168.113.94 . ack 26 win 92 <nop,nop,timestamp 389448 1081223776>
08:12:57.545816 IP 192.168.114.2.53948 > 192.168.113.94 . 267:1715(1448) ack 26 win 92 <nop,nop,timestamp 389448 1081223776>
08:12:57.545824 IP 192.168.114.2.53948 > 192.168.113.94 . 1715:3163(1448) ack 26 win 92 <nop,nop,timestamp 389448 1081223776>
08:12:57.724241 IP 192.168.113.94 > 192.168.114.2.53948: . ack 3163 win 3164 <nop,nop,timestamp 1081223955 389448>
08:12:57.724297 IP 192.168.114.2.53948 > 192.168.113.94 P 3163:4611(1448) ack 26 win 92 <nop,nop,timestamp 389626 1081223955>
08:12:57.724307 IP 192.168.114.2.53948 > 192.168.113.94 . 4611:6059(1448) ack 26 win 92 <nop,nop,timestamp 389626 1081223955>
08:12:57.724313 IP 192.168.114.2.53948 > 192.168.113.94 . 6059:7507(1448) ack 26 win 92 <nop,nop,timestamp 389626 1081223955>
08:12:57.903134 IP 192.168.113.94 > 192.168.114.2.53948: . ack 6059 win 4612 <nop,nop,timestamp 1081224134 389626>
08:12:57.903177 IP 192.168.114.2.53948 > 192.168.113.94 P 7507:7889(382) ack 26 win 92 <nop,nop,timestamp 389805 1081224134>
08:12:57.943444 IP 192.168.113.94 > 192.168.114.2.53948: . ack 7507 win 5336 <nop,nop,timestamp 1081224174 389626>
08:12:58.080235 IP 192.168.113.94 > 192.168.114.2.53948: . ack 7889 win 5336 <nop,nop,timestamp 1081224311 389805>
08:12:58.093196 IP 192.168.113.94 > 192.168.114.2.53948: . 26:1474(1448) ack 7889 win 5336 <nop,nop,timestamp 1081224322 389805>
08:12:58.093310 IP 192.168.113.94 > 192.168.114.2.53948: P 1474:2834(1360) ack 7889 win 5336 <nop,nop,timestamp 1081224322 389805>
08:12:58.093327 IP 192.168.114.2.53948 > 192.168.113.94 . ack 2834 win 182 <nop,nop,timestamp 389995 1081224322>
08:12:58.093332 IP 192.168.113.94 > 192.168.114.2.53948: P 2834:2839(5) ack 7889 win 5336 <nop,nop,timestamp 1081224322 389805>
08:12:58.132377 IP 192.168.114.2.53948 > 192.168.113.94: . ack 2839 win 182 <nop,nop,timestamp 390035 1081224322>
08:13:13.090854 IP 192.168.113.94 > 192.168.114.2.53948: F 2839:2839(0) ack 7889 win 5336 <nop,nop,timestamp 1081239324 390035>
08:13:13.130494 IP 192.168.114.2.53948 > 192.168.113.94192.168.113.94: . ack 2840 win 182 <nop,nop,timestamp 405036 1081239324>



