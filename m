From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: [Fwd: I do not understand !!!]
Date: Mon, 14 Jan 2008 11:00:20 +0100
Message-ID: <478B32B4.9090106@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter list <netfilter@vger.kernel.org>

ANYONE ????

Hi list,

I have a bit complicated script.
But I do not understand the following output of it.

1. ESTABLISHED packets without 0x100 or 0x200 mark ???
2. NEW packets without the 0x200 mark and without SYN ???
3. INVALID packets with SYN/ACK ??? (As a first packet maybe? Should I 
drop it?)
4. Connection that started from internal gets validated as WRONG_NEW 
(with a simple SYN)...

Can anyone tell me how the conntrack system works in detail?

Thanx

Swifty


Chain con_tcp (1 references)
pkts bytes target     prot
   0     0 INVALID    tcp  tcp flags:FIN,SYN,RST,PSH,ACK,URG/NONE
   0     0 INVALID    tcp  tcp flags:FIN,SYN,RST,PSH,ACK,URG/FIN,PSH,URG
   0     0 INVALID    tcp  tcp flags:SYN,RST/SYN,RST
5224  209K INVALID    tcp  tcp flags:FIN,RST/FIN,RST
   0     0 INVALID    tcp  tcp flags:FIN,SYN/FIN,SYN
2477  101K ACCEPT     all  ctstate RELATED
145K 7215K tcp_NEW_2  all  [goto] CONNMARK match 0x200/0x300 ctstate 
ESTABLISHED
 11M 7920M ACCEPT     all  CONNMARK match 0x100/0x300 ctstate ESTABLISHED
2880K 1666M ACCEPT     all  ctstate ESTABLISHED
272K   15M tcp_NEW    all  [goto] ctstate NEW
29796 2233K tcp_INV    all  [goto] ctstate INVALID
   0     0 LOG        all  LOG level debug tcp-sequence tcp-options 
ip-options uid prefix `UNKNOWN:'
   0     0 ACCEPT     all 

Chain tcp_NEW (1 references)
pkts bytes target     prot
232K   13M tcp_NEW_1  tcp  [goto] tcp flags:FIN,SYN,RST,ACK/SYN 
CONNMARK match 0x0/0x300
38579 2014K tcp_NEW_2  all  [goto] CONNMARK match 0x200/0x300
 969  212K LOG        all  LOG level debug tcp-sequence tcp-options 
ip-options uid prefix `WRONG_NEW:'
 969  212K ACCEPT     all 

Chain tcp_NEW_1 (1 references)
pkts bytes target     prot
232K   13M CONNMARK   all  CONNMARK set 0x200/0x300
232K   13M RETURN     all 

Chain tcp_NEW_2 (3 references)
pkts bytes target     prot
184K 9229K CONNMARK   all  CONNMARK set 0x100/0x300
184K 9229K ACCEPT     all

Chain tcp_INV (1 references)
pkts bytes target     prot
   0     0 tcp_NEW_2  all  [goto] CONNMARK match 0x200/0x300
2148 85920 ACCEPT     tcp  tcp flags:FIN,SYN,RST,PSH,ACK,URG/RST
24624  986K ACCEPT     tcp  tcp flags:FIN,SYN,RST,PSH,ACK,URG/FIN,ACK
  86 15329 ACCEPT     tcp  tcp flags:FIN,SYN,RST,PSH,ACK,URG/PSH,ACK
 752 30110 ACCEPT     tcp  tcp flags:FIN,SYN,RST,PSH,ACK,URG/RST,ACK
  80  4088 ACCEPT     tcp  tcp flags:FIN,SYN,RST,PSH,ACK,URG/SYN,ACK
1507  289K ACCEPT     tcp  tcp flags:FIN,SYN,RST,PSH,ACK,URG/FIN,PSH,ACK
 599  822K INVALID    all 


And a few log:

INVALID: IN=ppp0 OUT= MAC= SRC=189.11.239.248 DST=EXT_IP LEN=40 TOS=0x00 
PREC=0x00 TTL=51 ID=17760 PROTO=TCP SPT=50698 DPT=4492 SEQ=0 
ACK=3777589785 WINDOW=0 RES=0x00 ACK RST FIN URGP=0

INVALID: IN=ppp0 OUT= MAC= SRC=78.149.78.12 DST=EXT_IP LEN=40 TOS=0x00 
PREC=0x00 TTL=48 ID=61449 PROTO=TCP SPT=57102 DPT=4495 SEQ=0 
ACK=1455119138 WINDOW=0 RES=0x00 ACK RST FIN URGP=0

INVALID: IN=ppp0 OUT= MAC= SRC=189.11.239.248 DST=EXT_IP LEN=40 TOS=0x00 
PREC=0x00 TTL=51 ID=17770 PROTO=TCP SPT=50698 DPT=4492 SEQ=0 
ACK=3777589785 WINDOW=0 RES=0x00 ACK RST FIN URGP=0

INVALID: IN=ppp0 OUT= MAC= SRC=78.149.78.12 DST=EXT_IP LEN=40 TOS=0x00 
PREC=0x00 TTL=48 ID=61457 PROTO=TCP SPT=57102 DPT=4495 SEQ=0 
ACK=1455119138 WINDOW=0 RES=0x00 ACK RST FIN URGP=0

WRONG_NEW:IN=br1 OUT=ppp0 PHYSIN=lan1 SRC=INT_IP DST=85.131.72.154 
LEN=52 TOS=0x00 PREC=0x00 TTL=127 ID=14307 DF PROTO=TCP SPT=4796 
DPT=52045 SEQ=4243195870 ACK=0 WINDOW=65535 RES=0x00 SYN URGP=0 OPT 
(020405AC0103030001010402)

WRONG_NEW:IN=br1 OUT=ppp0 PHYSIN=lan1 SRC=INT_IP DST=84.3.29.226 LEN=52 
TOS=0x00 PREC=0x00 TTL=127 ID=14322 DF PROTO=TCP SPT=4797 DPT=6881 
SEQ=2594461565 ACK=0 WINDOW=65535 RES=0x00 SYN URGP=0 OPT 
(020405AC0103030001010402)

WRONG_NEW:IN=br1 OUT=ppp0 PHYSIN=lan1 SRC=INT_IP DST=90.52.165.175 
LEN=52 TOS=0x00 PREC=0x00 TTL=127 ID=14323 DF PROTO=TCP SPT=4798 
DPT=50428 SEQ=2039438787 ACK=0 WINDOW=65535 RES=0x00 SYN URGP=0 OPT 
(020405AC0103030001010402)


-
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html



