From: =?ISO-8859-1?Q?Usu=E1rio_do_Sistema?= <maiconlp@ig.com.br>
Subject: Access Interfaces Wan
Date: Fri, 30 Sep 2011 10:52:35 -0300
Message-ID: <CAMTjHrznU95sGq-0e1CPYetKdXpzprHAo_E3q_R6NdfFFDrLpw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Hello everyone,


I'm needing that my inside network accesses some IPs which are in the
my firewall wan interfaces. for exemplo, in the firewall there is the
IP 200.247.222.1 on the wan interface. those has a destination NAT to
a inside network machine for FTP protocol. so from Internet to
ftp://200.247.222.1 it's Working! but from my inside network to
ftp://200.247.222.1 isn't Working.

I've done some rules as follow:


iptables -t nat -I PREROUTING -s 128.2.0.0/24 -d 200.247.222.1 -p tcp
--dport 21 -j DNAT --to-destination  128.2.8.214

iptables -t nat -I POSTROUTING -s 128.2.0.0/24 -d 200.247.222.1 -o
bond0 -j SNAT --to-source 128.2.7.16

iptables -I FORWARD -s 128.2.0.0/24 -d 200.247.222.1 -j ACCEPT


128.2.0.0/24 is my inside network

bond0 is the inside interface

I've done tcpdump on the ftp machine and shows me :

access from 128.2.20.71 to ftp://200.247.222.1

09:44:03.719062 IP 128.2.20.71.35768 > 128.2.8.214.21: S
395591608:395591608(0) win 14600 <mss 1460,sackOK,timestamp 728976
0,nop,wscale 7>
09:44:03.719273 IP 128.2.20.71.35768 > 128.2.8.214.21: R
395591609:395591609(0) win 0
09:44:06.730331 IP 128.2.20.71.35768 > 128.2.8.214.21: S
395591608:395591608(0) win 14600 <mss 1460,sackOK,timestamp 729278
0,nop,wscale 7>
09:44:06.735412 IP 128.2.20.71.35768 > 128.2.8.214.21: R
395591609:395591609(0) win 0

seems that the source NAT isn't working becuase is appear 128.2.7.16
instead 128.2.20.71

when access direct ftp://128.2.8.214 ( bypass the firewall ) show :

09:44:37.499007 IP 128.2.20.71.34638 > 128.2.8.214.21: S
931391232:931391232(0) win 14600 <mss 1460,sackOK,timestamp 732355
0,nop,wscale 7>

09:44:37.499210 IP 128.2.20.71.34638 > 128.2.8.214.21: . ack
2427650415 win 115 <nop,nop,timestamp 732355 1042489571>

09:44:37.500931 IP 128.2.20.71.34638 > 128.2.8.214.21: . ack 35 win
115 <nop,nop,timestamp 732355 1042489573>

09:44:37.523867 IP 128.2.20.71.34638 > 128.2.8.214.21: P 0:16(16) ack
35 win 115 <nop,nop,timestamp 732357 1042489573>
09:44:37.525707 IP 128.2.20.71.34638 > 128.2.8.214.21: P 16:42(26) ack
69 win 115 <nop,nop,timestamp 732357 1042489596>
09:44:40.469622 IP 128.2.20.71.34638 > 128.2.8.214.21: F 42:42(0) ack
91 win 115 <nop,nop,timestamp 732652 1042492541>

there is ack TCP! and it's work!

How can I access my ip outside 200.247.222.1 from my inside network ??
what is missing in my rules. pay attention in bond0 ( bind eth0 and
eth1 ) maybe it's the problem ?



thanks





























The Firewall is a Red-Hat
